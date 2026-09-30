extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(9, false)
	var expected_pads: Array[Vector2] = [
		Vector2(253, 189), Vector2(785, 111), Vector2(756, 289),
		Vector2(407, 354), Vector2(781, 441)
	]
	if level.BUILD_PADS_3 != expected_pads or level.build_pads_for_level(3) != expected_pads:
		push_error("Level 3 swamp placement pads do not match the annotated layout")
		quit(1)
		return
	if level.display_level() != 3 or level.display_wave() != 1 or level.active_build_pads() != expected_pads:
		push_error("Swamp Level 3 did not become the active battlefield")
		quit(1)
		return
	level.scare_points = 1000
	level.selected_pad = level.LEVEL_3_SWAMP_ONLY_PAD
	if level.try_place_monster("skeleton"):
		push_error("The restricted Level 3 swamp pad accepted a Skeleton")
		quit(1)
		return
	if not level.try_place_monster("moss"):
		push_error("The restricted Level 3 swamp pad rejected the Moss Monster")
		quit(1)
		return
	level.placed.clear()
	level.selected_pad = level.LEVEL_3_SWAMP_ONLY_PAD
	if not level.try_place_monster("bog"):
		push_error("The restricted Level 3 swamp pad rejected the Bog Guardian")
		quit(1)
		return
	level.placed.clear()
	if level.point_on_route(0.0, 0) != level.point_on_route(0.0, 1):
		push_error("Swamp route entrances do not match")
		quit(1)
		return
	if level.point_on_route(600.0, 0).y >= level.point_on_route(600.0, 1).y:
		push_error("Swamp upper and lower paths do not diverge")
		quit(1)
		return
	if level.point_on_route(level.route_length_for(0), 0) == level.point_on_route(level.route_length_for(1), 1):
		push_error("Swamp paths do not end at separate exits")
		quit(1)
		return
	level._process(level.WAVE_INTRO_DURATION)
	level.spawn_clock = 0.0
	level._process(0.01)
	if level.ghosts.size() != 2 or int(level.ghosts[0]["route_id"]) != 0 or int(level.ghosts[1]["route_id"]) != 1:
		push_error("Swamp enemies did not alternate across both routes")
		quit(1)
		return
	print("Swamp Level 3 layout test passed: background stage, five pads, and two enemy routes")
	quit(0)
