extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(16, false)
	level.advance_after_complete()
	if not level.boss_mode or level.boss_level != 4:
		return fail("Swamp II Wave 4 does not advance to The Miasma boss battle")
	level.boss_intro_elapsed = level.BOSS_INTRO_DURATION
	level._process(0.01)
	var boss: Dictionary = level.ghost_by_id(10000)
	if boss.is_empty() or int(boss["kind"]) != 13 or int(boss["hp"]) != level.MIASMA_HP:
		return fail("The Miasma did not spawn with its configured stats")
	level.placed.append({"pad": 3, "kind": "moss", "hp": 180, "max_hp": 180, "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hit_flash": 0.0, "silence_timer": 0.0})
	level.boss_attack_cooldown = 0.0
	level._advance_gravewrought(0.01)
	if level.projectiles.is_empty() or str(level.projectiles.back().get("kind")) != "miasma":
		return fail("The Miasma did not launch its gas-cloud projectile")
	for step in range(240):
		level._process(0.02)
		if level.projectiles.is_empty():
			break
	if level.placed.is_empty():
		return fail("The gas cloud unexpectedly destroyed the full-health test monster")
	var monster: Dictionary = level.placed[0]
	if int(monster["hp"]) != 180 - level.MIASMA_PROJECTILE_DAMAGE:
		return fail("The gas cloud did not inflict its configured HP damage")
	if float(monster.get("silence_timer", 0.0)) <= 0.0 or float(monster.get("silence_timer", 0.0)) > level.MIASMA_CHOKE_DURATION:
		return fail("The gas cloud did not apply the two-second attack lock")
	print("Miasma boss test passed: Level 4 boss launches damaging gas that disables monster attacks")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
