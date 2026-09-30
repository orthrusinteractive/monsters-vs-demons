extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.splash_active = false
	Engine.time_scale = 1.0
	for expected_speed in [2.0, 3.0, 4.0, 5.0, 1.0]:
		var click := InputEventMouseButton.new()
		click.button_index = MOUSE_BUTTON_LEFT
		click.pressed = true
		click.position = level.TEST_SPEED_BUTTON.get_center()
		level._unhandled_input(click)
		if not is_equal_approx(Engine.time_scale, expected_speed):
			push_error("Test speed button did not cycle to %.0fX" % expected_speed)
			Engine.time_scale = 1.0
			quit(1)
			return
	Engine.time_scale = 1.0
	print("Game speed button test passed: 1X through 5X cycle")
	quit(0)
