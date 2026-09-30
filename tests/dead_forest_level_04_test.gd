extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var scene: PackedScene = load("res://graveyard_level_01.tscn")
	var level = scene.instantiate()
	root.add_child(level)
	var expected_counts := [31, 32, 33, 34]
	var expected_patterns := [[10], [3, 10], [3, 10, 6], [1, 2, 3, 4, 5, 6, 10]]
	for wave_index in range(4):
		level.start_level(13 + wave_index, false)
		if level.display_level() != 4 or level.display_wave() != wave_index + 1:
			return fail("Dead Forest level/wave mapping is incorrect")
		if level.level_enemy_count() != expected_counts[wave_index]:
			return fail("Dead Forest Wave %d has the wrong enemy count" % (wave_index + 1))
		var pattern: Array = expected_patterns[wave_index]
		for enemy_index in range(level.level_enemy_count()):
			if level.enemy_kind_for_spawn(enemy_index) != pattern[enemy_index % pattern.size()]:
				return fail("Dead Forest Wave %d has the wrong horde pattern" % (wave_index + 1))
		if level.active_build_pads() != level.BUILD_PADS_4:
			return fail("Dead Forest build pads are not active")

	level.start_level(13, false)
	if level.point_on_route(0.0, 0).x <= 960.0 or level.point_on_route(level.route_length_for(0), 0).x >= 0.0:
		return fail("Dead Forest enemies are not traveling from right to left")
	for route_id in range(4):
		if level.route_length_for(route_id) <= 0.0:
			return fail("Dead Forest route %d is missing" % route_id)
	var expected_fire_speed: float = (float(level.FIRE_DEMON_SPEED) + float(level.LEVEL_BONUS_SPEED[12])) * 1.10
	if not is_equal_approx(level.enemy_speed_for_kind(10), expected_fire_speed):
		return fail("Dead Forest enemies are not 10 percent faster than the Level 3 baseline")
	if not is_equal_approx(level.boss_speed_for_level(100.0, 4), 110.0):
		return fail("Dead Forest boss speed multiplier is incorrect")
	print("Dead Forest test passed: four waves, four right-to-left routes, counts, patterns, and 10% speed increase")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
