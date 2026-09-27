extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)

	# A normal enemy escape removes 25% of the current meter value.
	level.start_level(1, false)
	level.scare_meter_points = 1000
	level.spawned = 1
	level.ghosts.append({"id": 1, "kind": 1, "route_id": 0, "distance": level.route_length - 1.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 10.0, "hit_flash": 0.0})
	level._process(0.2)
	if level.escaped != 1 or level.scare_meter_points != 750 or level.game_lost:
		push_error("Normal escape did not reduce the Scare Meter by 25 percent")
		quit(1)
		return

	# A boss reaching the exit ends the game and destroys every monster.
	level.start_level(4, false)
	level.start_boss_battle()
	level.boss_spawned = true
	level.boss_intro_elapsed = level.BOSS_INTRO_DURATION
	level.placed.append({"pad": 0, "kind": "moss", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 180, "max_hp": 180, "hit_flash": 0.0})
	level.projectiles.append({"position": Vector2.ZERO, "target_id": 10000, "rotation": 0.0, "damage": 30, "kind": "moss"})
	level.howls.append({"origin": Vector2.ZERO, "target_id": 10000, "elapsed": 0.0, "damage": 120})
	level.dracula_active = true
	level.frank_phase = "blast"
	level.ghosts.append({"id": 10000, "kind": 7, "is_boss": true, "route_id": 0, "distance": level.route_length - 1.0, "flee": 0.0, "phase": 0.0, "hp": level.GRAVEWROUGHT_HP, "max_hp": level.GRAVEWROUGHT_HP, "speed": 10.0, "hit_flash": 0.0})
	level._process(0.2)
	if not level.game_lost or not level.placed.is_empty() or not level.ghosts.is_empty() or not level.projectiles.is_empty() or not level.howls.is_empty() or level.dracula_active or level.frank_phase != "idle":
		push_error("Boss escape did not trigger the terminal loss and perish all monsters")
		quit(1)
		return
	if level.wave_complete():
		push_error("A lost boss battle was incorrectly treated as complete")
		quit(1)
		return

	print("Escape loss test passed: meter penalty and boss terminal loss")
	quit(0)
