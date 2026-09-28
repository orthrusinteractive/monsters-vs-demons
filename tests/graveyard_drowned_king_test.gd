extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	seed(24680)
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(12, false)
	level.spawned = level.level_enemy_count()
	level.advance_after_complete()
	if not level.boss_mode or level.boss_level != 3:
		push_error("Level 3 Wave 4 did not transition into The Drowned King battle")
		quit(1)
		return
	level._process(level.BOSS_INTRO_DURATION)
	var boss = level.ghost_by_id(10000)
	if boss.is_empty() or int(boss["kind"]) != 9 or int(boss["hp"]) != level.DROWNED_KING_HP:
		push_error("The Drowned King did not spawn with the Level 3 boss configuration")
		quit(1)
		return
	if level.drowned_king_texture() != level.DROWNED_KING_1:
		push_error("The Swamp King is not locked to his first non-dripping sprite")
		quit(1)
		return
	boss["distance"] = 600.0
	for pad in range(level.BUILD_PADS_3.size()):
		level.placed.append({"pad": pad, "kind": "moss", "facing": "front", "cooldown": 99.0, "howl_time": 0.0, "hp": 180, "max_hp": 180, "hit_flash": 0.0})
	level.boss_attack_cooldown = 0.0
	level._advance_gravewrought(0.01)
	if level.projectiles.size() != 2:
		push_error("The Drowned King did not fire exactly two projectiles when multiple monsters were in range")
		quit(1)
		return
	var targeted_pads: Dictionary = {}
	for projectile in level.projectiles:
		if str(projectile.get("kind")) != "drowned_king" or str(projectile.get("target_type")) != "monster" or int(projectile.get("damage")) != level.DROWNED_KING_PROJECTILE_DAMAGE:
			push_error("The Drowned King projectile configuration is incorrect")
			quit(1)
			return
		targeted_pads[int(projectile["target_pad"])] = true
	if targeted_pads.size() != 2 or level.boss_attack_cooldown != level.DROWNED_KING_ATTACK_COOLDOWN:
		push_error("The Drowned King did not choose two distinct random targets or reset its three-second cooldown")
		quit(1)
		return
	var rotation_before := float(level.projectiles[0]["rotation"])
	level._process(0.05)
	if level.projectiles.is_empty() or is_equal_approx(float(level.projectiles[0]["rotation"]), rotation_before):
		push_error("The Swamp King's projectile did not spin while traveling toward its monster target")
		quit(1)
		return
	print("Swamp King test passed: Level 3 boss spawn, two-target three-second salvo, and spinning projectiles")
	quit(0)
