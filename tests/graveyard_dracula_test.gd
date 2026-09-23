extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.spawned = level.level_enemy_count()
	if level.summon_dracula() or level.scare_meter_points != 0:
		push_error("Dracula was summoned without a full-enough scare meter")
		quit(1)
		return
	level.scare_meter_points = level.DRACULA_COST
	level.ghosts.append({"id": 0, "kind": 1, "distance": 160.0, "flee": 0.0, "phase": 0.0, "hp": 150, "max_hp": 150, "speed": 0.0, "hit_flash": 0.0})
	level.ghosts.append({"id": 1, "kind": 2, "distance": 170.0, "flee": 0.0, "phase": 0.0, "hp": 80, "max_hp": 80, "speed": 0.0, "hit_flash": 0.0})
	if not level.summon_dracula() or level.scare_meter_points != 0 or level.scare_points != 200 or level.summon_dracula():
		push_error("Dracula meter reset or single-active-use rule failed")
		quit(1)
		return
	level._process(1.0)
	if int(level.ghosts[0]["hp"]) != 50 or int(level.ghosts[1]["hp"]) != 0 or level.scared != 1 or level.scare_points != 235 or level.scare_meter_points != 35:
		push_error("Dracula did not hit both enemies and award the spectre's points")
		quit(1)
		return
	level._process(1.0)
	if int(level.ghosts[0]["hp"]) != 50:
		push_error("Dracula hit the same enemy more than once")
		quit(1)
		return
	for i in range(10):
		level._process(1.0)
	if level.dracula_active or level.summon_dracula():
		push_error("Dracula was reusable without repaying the cost")
		quit(1)
		return
	level.scare_meter_points = level.DRACULA_COST
	if not level.summon_dracula() or level.scare_meter_points != 0:
		push_error("Dracula could not be purchased again after points accumulated")
		quit(1)
		return
	var directions: Array[String] = []
	var traveled := 0.0
	for i in range(level.ROUTE.size() - 1):
		var segment: float = level.ROUTE[i].distance_to(level.ROUTE[i + 1])
		var direction: String = level.dracula_direction_at(traveled + segment * 0.5)
		if not directions.has(direction):
			directions.append(direction)
		traveled += segment
	if not directions.has("right") or not directions.has("up") or not directions.has("down"):
		push_error("Dracula does not follow the route's right/up/down turns")
		quit(1)
		return
	for direction in ["right", "left", "up", "down"]:
		for frame in range(2):
			var texture: Texture2D = level.dracula_texture(direction, frame)
			if texture == null or texture.get_size() != Vector2(128, 128):
				push_error("Missing Dracula direction/frame: %s/%d" % [direction, frame])
				quit(1)
				return
	print("Dracula test passed: 1000-point meter unlock/reset, sweep, rewards, directions, frames, and reuse")
	quit(0)
