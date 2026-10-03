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
	level.ghosts.append({"id": 1, "kind": 1, "route_id": 0, "distance": 130.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 0.0, "hit_flash": 0.0})
	level.placed.append({"pad": 0, "kind": "sasquatch", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 325, "max_hp": 325, "hit_flash": 0.0, "silence_timer": 0.0})
	level._process(0.01)
	if level.projectiles.is_empty() or str(level.projectiles[0].get("kind")) != "sasquatch":
		return fail("Sasquatch did not throw his boulder")
	if not level.sasquatch_audio.playing or level.sasquatch_audio.stream != level.SASQUATCH_ATTACK_SOUND:
		return fail("Sasquatch roar did not play when the boulder was thrown")
	print("Sasquatch audio test passed: every boulder attack triggers the attached roar")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
