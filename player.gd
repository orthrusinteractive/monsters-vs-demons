extends Node2D

const ATLAS: Texture2D = preload("res://assets/sprites/cave-explorer-selected-source-sheet.png")
const BACKGROUND: Texture2D = preload("res://assets/backgrounds/cave-platform-test-640x360.png")
const WALK_STRIP: Texture2D = preload("res://assets/sprites/cave-explorer-yellow-helmet-walk-4-128.png")
const RUN_TEXTURES: Array[Texture2D] = [
	preload("res://assets/sprites/stabilized/run_01.png"),
	preload("res://assets/sprites/stabilized/run_02.png"),
	preload("res://assets/sprites/stabilized/run_03.png"),
	preload("res://assets/sprites/stabilized/run_04.png")
]
const ATLAS_COLUMNS := 4
const ATLAS_ROWS := 8
const DISPLAY_SIZE := Vector2(128, 128)

const WALK_SPEED := 150.0
const RUN_SPEED := 245.0
const ACCELERATION := 900.0
const DECELERATION := 1200.0
const CLIMB_SPEED := 105.0
const JUMP_SPEED := 340.0
const GRAVITY := 960.0

const LOWER_PLATFORM_Y := 287.0
const UPPER_PLATFORM_Y := 137.0
const UPPER_PLATFORM_LEFT := 314.0
const LADDER_X := 480.0
const LADDER_HALF_WIDTH := 30.0

var explorer_position := Vector2(180, LOWER_PLATFORM_Y)
var velocity := Vector2.ZERO
var current_floor_y := LOWER_PLATFORM_Y
var facing_left := false
var action := "idle"
var frame_index := 0
var animation_time := 0.0
var frame_duration := 1.0
var frame_blend := 0.0
var jumping := false
var climbing := false

var animations := {
	"idle": [Vector2i(0, 0)],
	"walk": [Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(3, 0)],
	"crouch": [Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1), Vector2i(3, 1)],
	"jump": [Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2), Vector2i(3, 2)],
	"run": [Vector2i(0, 3), Vector2i(1, 3), Vector2i(2, 3), Vector2i(3, 3)],
	"climb_up": [Vector2i(0, 4), Vector2i(1, 4), Vector2i(2, 4), Vector2i(3, 4)],
	"climb_down": [Vector2i(0, 5), Vector2i(1, 5), Vector2i(2, 5), Vector2i(3, 5)]
}

func _ready() -> void:
	queue_redraw()

func _physics_process(delta: float) -> void:
	var horizontal := Input.get_axis("ui_left", "ui_right")
	if Input.is_key_pressed(KEY_A):
		horizontal -= 1.0
	if Input.is_key_pressed(KEY_D):
		horizontal += 1.0
	horizontal = clampf(horizontal, -1.0, 1.0)

	if horizontal < 0.0:
		facing_left = true
	elif horizontal > 0.0:
		facing_left = false

	var climb_up_pressed := Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP)
	var climb_down_pressed := Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN)
	var near_ladder := absf(explorer_position.x - LADDER_X) <= LADDER_HALF_WIDTH

	if not jumping and (climbing or ((climb_up_pressed or climb_down_pressed) and near_ladder)):
		update_climbing(delta, climb_up_pressed, climb_down_pressed)
		queue_redraw()
		return

	if Input.is_action_just_pressed("ui_accept") and not jumping:
		jumping = true
		velocity.y = -JUMP_SPEED
		set_action("jump")

	var running := Input.is_key_pressed(KEY_SHIFT)
	var maximum_speed := RUN_SPEED if running else WALK_SPEED
	var target_speed := horizontal * maximum_speed
	var horizontal_rate := ACCELERATION if horizontal != 0.0 else DECELERATION
	velocity.x = move_toward(velocity.x, target_speed, horizontal_rate * delta)
	explorer_position.x += velocity.x * delta

	if jumping:
		velocity.y += GRAVITY * delta
		explorer_position.y += velocity.y * delta
		update_jump_frame()
		if explorer_position.y >= current_floor_y and velocity.y >= 0.0:
			explorer_position.y = current_floor_y
			velocity.y = 0.0
			jumping = false
			set_action("idle")
	else:
		explorer_position.y = current_floor_y
		update_ground_animation(delta, horizontal, running)

	constrain_to_platform()
	queue_redraw()

func update_climbing(delta: float, climb_up_pressed: bool, climb_down_pressed: bool) -> void:
	climbing = true
	velocity = Vector2.ZERO
	explorer_position.x = move_toward(explorer_position.x, LADDER_X, 260.0 * delta)
	if climb_up_pressed:
		set_action("climb_up")
		explorer_position.y = maxf(UPPER_PLATFORM_Y, explorer_position.y - CLIMB_SPEED * delta)
		advance_animation(delta, 10.0, true)
	elif climb_down_pressed:
		set_action("climb_down")
		explorer_position.y = minf(LOWER_PLATFORM_Y, explorer_position.y + CLIMB_SPEED * delta)
		advance_animation(delta, 10.0, true)
	else:
		frame_blend = 0.0

	if explorer_position.y <= UPPER_PLATFORM_Y:
		explorer_position.y = UPPER_PLATFORM_Y
		current_floor_y = UPPER_PLATFORM_Y
		climbing = false
	elif explorer_position.y >= LOWER_PLATFORM_Y:
		explorer_position.y = LOWER_PLATFORM_Y
		current_floor_y = LOWER_PLATFORM_Y
		climbing = false

func update_ground_animation(delta: float, horizontal: float, running: bool) -> void:
	if Input.is_key_pressed(KEY_C):
		set_action("crouch")
		advance_animation(delta, 10.0, false)
	elif absf(velocity.x) > 8.0:
		set_action("run" if running else "walk")
		var speed_ratio := absf(velocity.x) / (RUN_SPEED if running else WALK_SPEED)
		advance_animation(delta, lerpf(7.0, 13.0 if running else 11.0, speed_ratio), true)
	else:
		set_action("idle")

func update_jump_frame() -> void:
	frame_blend = 0.0
	if velocity.y < -170.0:
		frame_index = 0
	elif velocity.y < -30.0:
		frame_index = 1
	elif velocity.y < 150.0:
		frame_index = 2
	else:
		frame_index = 3

func set_action(next_action: String) -> void:
	if action == next_action:
		return
	action = next_action
	frame_index = 0
	animation_time = 0.0
	frame_blend = 0.0

func advance_animation(delta: float, fps: float, loop: bool) -> void:
	frame_duration = 1.0 / fps
	animation_time += delta
	while animation_time >= frame_duration:
		animation_time -= frame_duration
		if frame_index < animations[action].size() - 1:
			frame_index += 1
		elif loop:
			frame_index = 0
		else:
			animation_time = 0.0
			break
	frame_blend = animation_time / frame_duration if loop else 0.0

func constrain_to_platform() -> void:
	if current_floor_y == UPPER_PLATFORM_Y and not climbing:
		explorer_position.x = clampf(explorer_position.x, UPPER_PLATFORM_LEFT + 32.0, 608.0)
	else:
		explorer_position.x = clampf(explorer_position.x, 32.0, 608.0)

func get_source_region(coordinates: Vector2i) -> Rect2:
	var x0 := roundi(coordinates.x * ATLAS.get_width() / float(ATLAS_COLUMNS))
	var x1 := roundi((coordinates.x + 1) * ATLAS.get_width() / float(ATLAS_COLUMNS))
	var y0 := roundi(coordinates.y * ATLAS.get_height() / float(ATLAS_ROWS))
	var y1 := roundi((coordinates.y + 1) * ATLAS.get_height() / float(ATLAS_ROWS))
	return Rect2(x0, y0, x1 - x0, y1 - y0)

func draw_atlas_frame(coordinates: Vector2i, opacity: float) -> void:
	var source_region := get_source_region(coordinates)
	draw_texture_rect_region(ATLAS, Rect2(-DISPLAY_SIZE.x / 2.0, -DISPLAY_SIZE.y, DISPLAY_SIZE.x, DISPLAY_SIZE.y), source_region, Color(1.0, 1.0, 1.0, opacity))

func _draw() -> void:
	draw_texture_rect(BACKGROUND, Rect2(0, 0, 640, 360), false)
	draw_rect(Rect2(10, 8, 620, 98), Color(0.015, 0.022, 0.03, 0.78))
	draw_string(ThemeDB.fallback_font, Vector2(18, 28), "CAVE MOVEMENT TEST", HORIZONTAL_ALIGNMENT_LEFT, -1, 20, Color("e8edf2"))
	draw_string(ThemeDB.fallback_font, Vector2(18, 52), "A/D: move   Shift: run   C: crouch   Space: jump", HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color("aeb9c3"))
	draw_string(ThemeDB.fallback_font, Vector2(18, 73), "At ladder: W/Up climbs, S/Down descends", HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color("aeb9c3"))
	draw_string(ThemeDB.fallback_font, Vector2(18, 98), "Action: " + action.replace("_", " "), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color("f2c84b"))

	var draw_scale := Vector2(-1.0, 1.0) if facing_left and not action.begins_with("climb") else Vector2.ONE
	draw_set_transform(explorer_position, 0.0, draw_scale)
	if action == "walk" or action == "idle":
		var walk_frame := frame_index if action == "walk" else 0
		var walk_region := Rect2(walk_frame * 128, 0, 128, 128)
		draw_texture_rect_region(WALK_STRIP, Rect2(-DISPLAY_SIZE.x / 2.0, -DISPLAY_SIZE.y, DISPLAY_SIZE.x, DISPLAY_SIZE.y), walk_region)
	elif action == "run":
		draw_texture_rect(RUN_TEXTURES[frame_index], Rect2(-DISPLAY_SIZE.x / 2.0, -DISPLAY_SIZE.y, DISPLAY_SIZE.x, DISPLAY_SIZE.y), false)
	else:
		var frames: Array = animations[action]
		draw_atlas_frame(frames[frame_index], 1.0)
	draw_set_transform(Vector2.ZERO)
