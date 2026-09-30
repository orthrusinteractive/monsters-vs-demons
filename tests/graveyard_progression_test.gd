extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var scene: PackedScene = load("res://graveyard_level_01.tscn")
	var level = scene.instantiate()
	root.add_child(level)
	var expected_hp := [100, 180, 270, 340, 140, 330, 400, 100, 580, 200, 390, 250]
	var expected_count := [17, 18, 19, 20, 22, 23, 24, 25, 27, 28, 29, 30]
	var expected_speed := [42.0, 44.0, 46.0, 48.0, 46.2, 50.6, 57.2, 46.2]
	var expected_patterns := [[1], [2], [3], [4], [1, 2], [3, 4], [5], [1, 2, 3, 4, 5], [6], [1, 5], [3, 2], [1, 2, 3, 4, 5, 6]]
	for number in range(1, 13):
		level.start_level(number, false)
		if level.display_level() != int((number - 1) / 4) + 1 or level.display_wave() != (number - 1) % 4 + 1:
			push_error("Incorrect level/wave label for stage %d" % number)
			quit(1)
			return
		if level.wave_intro_elapsed != 0.0 or not level.ghosts.is_empty():
			push_error("Level %d intro did not reset" % number)
			quit(1)
			return
		level._process(level.WAVE_INTRO_DURATION * 0.5)
		if not level.ghosts.is_empty():
			push_error("Level %d spawned before the wave intro finished" % number)
			quit(1)
			return
		level._process(level.WAVE_INTRO_DURATION * 0.5)
		for frame in range(5):
			await process_frame
			if not level.ghosts.is_empty():
				break
		if level.current_level != number or level.ghosts.size() != 1:
			push_error("Level %d did not start" % number)
			quit(1)
			return
		var enemy: Dictionary = level.ghosts[0]
		if int(enemy["kind"]) != expected_patterns[number - 1][0] or int(enemy["hp"]) != expected_hp[number - 1] or level.level_enemy_count() != expected_count[number - 1]:
			push_error("Level %d enemy configuration is incorrect" % number)
			quit(1)
			return
		if number <= 8 and not is_equal_approx(float(enemy["speed"]), expected_speed[number - 1]):
			push_error("Level %d enemy speed is incorrect: %.2f" % [number, float(enemy["speed"])])
			quit(1)
			return
		for index in range(level.level_enemy_count()):
			var kind: int = level.enemy_kind_for_spawn(index)
			if kind != expected_patterns[number - 1][index % expected_patterns[number - 1].size()] or level.enemy_hp_for_kind(kind) <= 0:
				push_error("Level %d has an incorrect enemy pattern" % number)
				quit(1)
				return

	level.start_level(1, false)
	level.placed.append({"pad": 0, "facing": "front", "cooldown": 0.0})
	level.scare_points = 75
	for number in range(1, 8):
		level.spawned = level.level_enemy_count()
		level.ghosts.clear()
		level.projectiles.clear()
		var next_key := InputEventKey.new()
		next_key.pressed = true
		next_key.keycode = KEY_N
		level._unhandled_input(next_key)
		if number == 4:
			if not level.boss_mode or level.current_level != 4 or level.placed.size() != 1 or level.scare_points != 75:
				push_error("Level 1 did not transition into its boss battle")
				quit(1)
				return
			level.boss_defeated = true
			level._unhandled_input(next_key)
		var expected_placed := 1 if number < 4 else 0
		if level.current_level != number + 1 or level.placed.size() != expected_placed or level.scare_points != 75:
			push_error("Transition from stage %d did not retain the correct monsters/scare points" % number)
			quit(1)
			return
	print("Progression test passed: three levels, twelve wave patterns, and level-boundary reset")
	quit(0)
