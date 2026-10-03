extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.splash_active = false
	level.wave_intro_elapsed = level.WAVE_INTRO_DURATION
	level.spawned = level.level_enemy_count()
	level.placed.append({"pad": 0, "kind": "werewolf", "facing": "front", "cooldown": 0.0, "howl_time": 0.0})
	level.ghosts.append({"id": 1, "kind": 1, "distance": 130.0, "flee": 0.0, "phase": 0.0, "hp": 150, "max_hp": 150, "speed": 0.0, "hit_flash": 0.0})
	level._process(0.01)
	if level.howls.size() != 1 or not level.projectiles.is_empty() or float(level.placed[0]["howl_time"]) <= 0.0 or not level.werewolf_audio.playing:
		push_error("Werewolf did not begin a visible howl")
		quit(1)
		return
	level._process(level.HOWL_DURATION)
	if not level.howls.is_empty() or int(level.ghosts[0]["hp"]) != 30:
		push_error("Werewolf howl did not deal exactly 120 damage")
		quit(1)
		return
	print("Werewolf test passed: directional howl pose and one 120-damage shock wave")
	quit(0)
