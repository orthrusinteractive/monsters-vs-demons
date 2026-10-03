extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(20, false)
	level.advance_after_complete()
	if not level.boss_mode or level.boss_level != 5:
		return fail("Pumpkin Run Wave 4 does not advance to its boss battle")
	level.boss_intro_elapsed = level.BOSS_INTRO_DURATION
	level._process(0.01)
	var boss: Dictionary = level.ghost_by_id(10000)
	if boss.is_empty() or int(boss["kind"]) != 12 or int(boss["hp"]) != level.HEADLESS_HORSEMAN_HP:
		return fail("Headless Horseman did not spawn with the configured boss stats")
	level.placed.append({"pad": 0, "kind": "moss", "hp": 180, "max_hp": 180, "facing": "front", "cooldown": 0.0, "hit_flash": 0.0})
	boss["distance"] = level.route_length_for(0) * 0.45
	level.boss_attack_cooldown = 0.0
	level._advance_gravewrought(0.01)
	if level.projectiles.is_empty():
		return fail("Headless Horseman did not throw a projectile pumpkin")
	var projectile: Dictionary = level.projectiles.back()
	if str(projectile.get("kind")) != "headless_horseman" or int(projectile.get("damage")) != level.HEADLESS_HORSEMAN_PROJECTILE_DAMAGE:
		return fail("Headless Horseman projectile is not configured correctly")
	print("Headless Horseman boss test passed: Level 5 boss spawns and throws projectile pumpkins")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
