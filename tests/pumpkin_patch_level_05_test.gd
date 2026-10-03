extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(17, false)
	if level.display_level() != 5 or level.display_wave() != 1:
		return fail("Pumpkin Run is not Level 5")
	var expected_pads: Array[Vector2] = [
		Vector2(379, 180), Vector2(762, 179), Vector2(605, 312),
		Vector2(899, 330), Vector2(100, 385), Vector2(327, 456)
	]
	if level.active_build_pads() != expected_pads:
		return fail("Pumpkin Run does not use the six annotated spawn points")
	var starts: Array[Vector2] = []
	var exits: Array[Vector2] = []
	for route_id in range(3):
		if level.route_length_for(route_id) <= 0.0:
			return fail("Pumpkin Patch route %d is missing" % route_id)
		var start: Vector2 = level.point_on_route(0.0, route_id)
		var exit_point: Vector2 = level.point_on_route(level.route_length_for(route_id), route_id)
		if start.x <= 960.0:
			return fail("Pumpkin Patch route %d does not enter from the right" % route_id)
		if exit_point.x >= 0.0:
			return fail("Pumpkin Patch route %d does not exit through the left edge" % route_id)
		if starts.has(start) or exits.has(exit_point):
			return fail("Pumpkin Patch routes do not have three distinct entrances and exits")
		starts.append(start)
		exits.append(exit_point)
	level._process(level.WAVE_INTRO_DURATION)
	while level.ghosts.size() < 3:
		level.spawn_clock = 0.0
		level._process(0.01)
	if level.ghosts.size() != 3:
		return fail("Pumpkin Patch did not begin spawning across all three routes")
	for enemy_index in range(3):
		if int(level.ghosts[enemy_index]["route_id"]) != enemy_index:
			return fail("Pumpkin Patch enemies are not alternating across all three paths")
	print("Pumpkin Run Level 5 test passed: annotated pads and three separate right-to-left routes")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
