extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.ghosts.append({"id": 1, "kind": 1, "route_id": 0, "distance": 210.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	level.ghosts.append({"id": 2, "kind": 1, "route_id": 0, "distance": 430.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	level.scare_meter_points = level.MUMMY_COST
	if not level.summon_mummy() or level.scare_meter_points != 0:
		push_error("Mummy did not unlock as a one-use 3000-point special")
		quit(1)
		return
	level._advance_mummy(level.MUMMY_SARCOPHAGUS_TIME)
	level._advance_mummy(level.MUMMY_RISE_TIME)
	if level.projectiles.size() != 2:
		push_error("Mummy did not throw one bandage at every active enemy")
		quit(1)
		return
	for projectile in level.projectiles:
		var target = level.ghost_by_id(int(projectile["target_id"]))
		projectile["position"] = level.point_on_route(float(target["distance"]), int(target.get("route_id", 0))) + Vector2(0, -19)
	level._process(0.01)
	for enemy in level.ghosts:
		if float(enemy.get("slow_timer", 0.0)) < level.MUMMY_SLOW_DURATION - 0.1:
			push_error("Mummy bandage did not apply the ten-second slow")
			quit(1)
			return

	var upgrade_level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(upgrade_level)
	upgrade_level.set_process(false)
	upgrade_level.scare_meter_points = upgrade_level.SCARE_METER_MAX
	if not upgrade_level.select_nightmare_upgrade("strength") or upgrade_level.scare_meter_points != 0 or upgrade_level.monster_damage_for("moss") != 45:
		push_error("Monstrous Strength selection or 50-percent damage bonus failed")
		quit(1)
		return
	upgrade_level.start_level(5, true)
	if upgrade_level.nightmare_upgrade_active("strength") or not upgrade_level.activate_nightmare_upgrade() or upgrade_level.monster_damage_for("moss") != 45:
		push_error("Nightmare upgrade did not become available once on the next game level")
		quit(1)
		return

	var end_level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(end_level)
	end_level.set_process(false)
	end_level.spawned = end_level.level_enemy_count()
	end_level.ghosts.append({"id": 3, "kind": 1, "route_id": 0, "distance": 300.0, "flee": 0.4, "phase": 0.0, "hp": 0, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	end_level.placed.append({"pad": 0, "kind": "killian", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 350, "max_hp": 350, "hit_flash": 0.0})
	end_level.placed.append({"pad": 1, "kind": "moss", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 180, "max_hp": 180, "hit_flash": 0.0})
	end_level.projectiles.append({"position": Vector2.ZERO, "target_type": "monster", "target_pad": 1, "rotation": 0.0, "damage": 100, "kind": "killian"})
	end_level._process(0.01)
	if not end_level.projectiles.is_empty() or int(end_level.placed[1]["hp"]) != 180:
		push_error("Attacks continued after the encounter was resolved")
		quit(1)
		return
	print("Mummy/Nightmare test passed: global slow, persistent once-per-level upgrade, and end-of-level attack stop")
	quit(0)
