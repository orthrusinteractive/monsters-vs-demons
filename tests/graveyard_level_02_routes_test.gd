extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(5, false)
	if level.display_level() != 2 or level.display_wave() != 1 or level.active_build_pads().size() != 8:
		push_error("Level 2 battlefield was not selected")
		quit(1)
		return
	if level.point_on_route(0.0, 0) != level.point_on_route(0.0, 1):
		push_error("Level 2 branch entrances do not match")
		quit(1)
		return
	if level.point_on_route(500.0, 0).y >= level.point_on_route(500.0, 1).y:
		push_error("Level 2 upper/lower paths do not diverge")
		quit(1)
		return
	if level.point_on_route(level.route_length_for(0), 0) != level.point_on_route(level.route_length_for(1), 1):
		push_error("Level 2 paths do not rejoin at the mausoleum")
		quit(1)
		return
	level._process(level.WAVE_INTRO_DURATION)
	level.spawn_clock = 0.0
	level._process(0.01)
	if level.ghosts.size() != 2 or int(level.ghosts[0]["route_id"]) != 0 or int(level.ghosts[1]["route_id"]) != 1:
		push_error("Level 2 enemies did not alternate across branches")
		quit(1)
		return
	print("Level 2 route test passed: fork, rejoin, build pads, alternating enemies")
	quit(0)
