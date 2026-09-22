extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(4, false)
	var expected_pads := [Vector2(141, 226), Vector2(329, 178), Vector2(615, 321), Vector2(846, 210)]
	if level.BUILD_PADS != expected_pads or level.FRANK_ORIGIN != Vector2(459, 160):
		push_error("Level 1 placement pads or Frankenstein portal origin do not match the annotated layout")
		quit(1)
		return
	level.spawned = level.level_enemy_count()
	if not level.wave_complete():
		push_error("Level 1 Wave 4 did not become complete")
		quit(1)
		return
	level.placed.append({"pad": 0, "kind": "moss", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 50, "max_hp": 180, "hit_flash": 0.0})
	level.placed.append({"pad": 1, "kind": "bog", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 270, "max_hp": 270, "hit_flash": 0.0})
	level.advance_after_complete()
	if not level.boss_mode or level.boss_spawned:
		push_error("Wave 4 did not transition into the boss introduction")
		quit(1)
		return
	level._process(level.BOSS_INTRO_DURATION)
	var boss = level.ghost_by_id(10000)
	if not level.boss_spawned or boss.is_empty() or int(boss["hp"]) != level.GRAVEWROUGHT_HP:
		push_error("The Gravewrought did not spawn after the boss introduction")
		quit(1)
		return
	level._advance_gravewrought(level.GRAVEWAIL_COOLDOWN)
	if level.boss_gravewail_elapsed < 0.0:
		push_error("The Gravewrought did not begin Gravewail")
		quit(1)
		return
	level._advance_gravewrought(level.GRAVEWAIL_HIT_TIME)
	if level.placed.size() != 1 or int(level.placed[0]["hp"]) != 195:
		push_error("Gravewail did not damage and destroy monsters in its large radius")
		quit(1)
		return
	var points_before: int = level.scare_points
	level.damage_enemy(boss, level.GRAVEWROUGHT_HP)
	level._process(1.3)
	if not level.boss_defeated or level.scare_points != points_before + level.GRAVEWROUGHT_REWARD or not level.wave_complete():
		push_error("Boss defeat, reward, or completion state failed")
		quit(1)
		return
	level.advance_after_complete()
	if level.current_level != 5 or level.display_level() != 2 or level.boss_mode:
		push_error("Level 2 did not unlock after the boss was defeated")
		quit(1)
		return
	level.start_level(8, false)
	level.spawned = level.level_enemy_count()
	level.placed.append({"pad": 0, "kind": "moss", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 80, "max_hp": 180, "hit_flash": 0.0})
	level.placed.append({"pad": 7, "kind": "gargoyle", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 380, "max_hp": 380, "hit_flash": 0.0})
	level.advance_after_complete()
	if not level.boss_mode or level.boss_level != 2:
		push_error("Level 2 Wave 4 did not transition into the Soul Reaper battle")
		quit(1)
		return
	level._process(level.BOSS_INTRO_DURATION)
	boss = level.ghost_by_id(10000)
	if boss.is_empty() or int(boss["kind"]) != 8 or int(boss["hp"]) != level.SOUL_REAPER_HP:
		push_error("Soul Reaper did not spawn with the Level 2 boss configuration")
		quit(1)
		return
	level._advance_gravewrought(level.SOUL_LIGHTNING_COOLDOWN)
	level._advance_gravewrought(level.SOUL_LIGHTNING_HIT_TIME)
	if level.placed.size() != 1 or int(level.placed[0]["hp"]) != 290:
		push_error("Soul Reaper lightning did not damage every remaining monster")
		quit(1)
		return
	points_before = level.scare_points
	level.damage_enemy(boss, level.SOUL_REAPER_HP)
	level._process(1.3)
	if not level.wave_complete() or level.scare_points != points_before + level.SOUL_REAPER_REWARD:
		push_error("Soul Reaper defeat or reward failed")
		quit(1)
		return
	level.advance_after_complete()
	if level.current_level != 1 or level.boss_mode:
		push_error("The game did not restart after the Level 2 boss")
		quit(1)
		return
	print("Boss test passed: Level 1 pads, both boss intros, Gravewail, Soul Reaper lightning, rewards, progression")
	quit(0)
