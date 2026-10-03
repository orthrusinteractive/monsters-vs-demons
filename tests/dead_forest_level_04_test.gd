extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var scene: PackedScene = load("res://graveyard_level_01.tscn")
	var level = scene.instantiate()
	root.add_child(level)
	var expected_counts := [33, 32, 33, 34]
	var expected_patterns := [[11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 10], [3, 10], [3, 10, 6], [1, 2, 3, 4, 5, 6, 10]]
	for wave_index in range(4):
		level.start_level(21 + wave_index, false)
		if level.display_level() != 6 or level.display_wave() != wave_index + 1:
			return fail("Dead Forest level/wave mapping is incorrect")
		if level.level_enemy_count() != expected_counts[wave_index]:
			return fail("Dead Forest Wave %d has the wrong enemy count" % (wave_index + 1))
		var pattern: Array = expected_patterns[wave_index]
		for enemy_index in range(level.level_enemy_count()):
			if level.enemy_kind_for_spawn(enemy_index) != pattern[enemy_index % pattern.size()]:
				return fail("Dead Forest Wave %d has the wrong horde pattern" % (wave_index + 1))
		if level.active_build_pads() != level.BUILD_PADS_6:
			return fail("Dead Forest build pads are not active")

	level.start_level(21, false)
	var hound_count := 0
	var fire_demon_count := 0
	for enemy_index in range(level.level_enemy_count()):
		if level.enemy_kind_for_spawn(enemy_index) == 11:
			hound_count += 1
		elif level.enemy_kind_for_spawn(enemy_index) == 10:
			fire_demon_count += 1
	if hound_count != 30 or fire_demon_count != 3:
		return fail("Dead Forest Wave 1 is not using the exact ten-Hell-Hounds-per-Fire-Demon ratio")
	if level.point_on_route(0.0, 0).x <= 960.0 or level.point_on_route(level.route_length_for(0), 0).x >= 0.0:
		return fail("Dead Forest enemies are not traveling from right to left")
	for route_id in range(4):
		if level.route_length_for(route_id) <= 0.0:
			return fail("Dead Forest route %d is missing" % route_id)
	var expected_fire_speed: float = (float(level.FIRE_DEMON_SPEED) + float(level.LEVEL_BONUS_SPEED[20])) * 1.10
	if not is_equal_approx(level.enemy_speed_for_kind(10), expected_fire_speed):
		return fail("Dead Forest enemies are not 10 percent faster than the Level 3 baseline")
	if not is_equal_approx(level.enemy_speed_for_kind(11), expected_fire_speed * 2.0):
		return fail("Hell Hounds are not running at twice the Fire Demon speed")
	if not is_equal_approx(level.boss_speed_for_level(100.0, 6), 110.0):
		return fail("Dead Forest boss speed multiplier is incorrect")
	print("Dead Forest test passed: 30 Hell Hounds, 3 Fire Demons, doubled hound speed, and right-to-left routes")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
