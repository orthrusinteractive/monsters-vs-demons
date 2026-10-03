extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(13, false)
	if level.display_level() != 4 or level.display_wave() != 1:
		return fail("Swamp II is not Level 4")
	var expected_pads: Array[Vector2] = [
		Vector2(186, 137), Vector2(102, 206), Vector2(347, 326), Vector2(134, 403),
		Vector2(807, 149), Vector2(857, 221), Vector2(707, 235), Vector2(815, 410)
	]
	if level.active_build_pads() != expected_pads:
		return fail("Swamp II does not use the eight annotated spawn points")
	if not level.ambience_audio.playing or level.ambience_audio.stream != level.LEVEL_3_AMBIENCE:
		return fail("Swamp II does not share the original swamp ambience")
	var left_a: Vector2 = level.point_on_route(0.0, 0)
	var left_b: Vector2 = level.point_on_route(0.0, 1)
	var right_a: Vector2 = level.point_on_route(0.0, 2)
	var right_b: Vector2 = level.point_on_route(0.0, 3)
	if left_a != left_b or right_a != right_b or left_a == right_a or left_a.y <= 540.0 or right_a.y <= 540.0:
		return fail("Swamp II does not have two distinct bottom entrances")
	var exits: Array[Vector2] = []
	for route_id in range(4):
		if level.route_length_for(route_id) <= 0.0:
			return fail("Swamp II route %d is missing" % route_id)
		var exit_point: Vector2 = level.point_on_route(level.route_length_for(route_id), route_id)
		if exit_point.y >= 0.0 or exits.has(exit_point):
			return fail("Swamp II routes do not branch to four distinct top exits")
		exits.append(exit_point)
	level.level3_mist_timer = 0.0
	level._advance_level3_mist(0.01)
	if level.level3_mist_elapsed < 0.0:
		return fail("Swamp II periodic mist did not start")
	print("Swamp II Level 4 test passed: eight annotated pads, two bottom entrances, four exits, shared ambience, and drifting mist")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
