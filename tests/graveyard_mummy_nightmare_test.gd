extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(1, false)
	level.ghosts.append({"id": 1, "kind": 1, "route_id": 0, "distance": 210.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	level.ghosts.append({"id": 2, "kind": 1, "route_id": 0, "distance": 430.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	level.scare_meter_points = level.MUMMY_COST
	if not level.summon_mummy() or level.scare_meter_points != 0:
		push_error("Mummy did not unlock as a one-use 3000-point special")
		quit(1)
		return
	level._advance_mummy(level.MUMMY_SARCOPHAGUS_TIME)
	if level.mummy_phase != "explosion":
		push_error("Mummy sarcophagus did not transition from falling to its impact explosion")
		quit(1)
		return
	level._advance_mummy(level.MUMMY_EXPLOSION_TIME)
	if level.mummy_phase != "stand":
		push_error("Mummy was not revealed standing after the explosion")
		quit(1)
		return
	level._advance_mummy(level.MUMMY_REVEAL_PAUSE)
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
	upgrade_level.start_level(1, false)
	upgrade_level.scare_meter_points = upgrade_level.SCARE_METER_MAX
	if upgrade_level.nightmare_kind_at_position(upgrade_level.NIGHTMARE_STRENGTH_BUTTON.get_center()) != "strength" or upgrade_level.nightmare_kind_at_position(upgrade_level.NIGHTMARE_FLESH_BUTTON.get_center()) != "flesh" or upgrade_level.nightmare_kind_at_position(upgrade_level.NIGHTMARE_FOG_BUTTON.get_center()) != "fog":
		push_error("Nightmare upgrade hover targets do not match their displayed icons")
		quit(1)
		return
	if str(upgrade_level.monster_tooltip_at_position(upgrade_level.SHOP_KILLIAN.get_center()).get("title", "")) != "KILLIAN CLOWN" or str(upgrade_level.monster_tooltip_at_position(upgrade_level.SHOP_DRACULA.get_center()).get("title", "")) != "DRACULA" or str(upgrade_level.monster_tooltip_at_position(upgrade_level.SHOP_MUMMY.get_center()).get("title", "")) != "THE MUMMY":
		push_error("Monster hover targets do not expose the correct character details")
		quit(1)
		return
	if not upgrade_level.select_nightmare_upgrade("strength") or upgrade_level.scare_meter_points != 0 or upgrade_level.monster_damage_for("moss") != 45:
		push_error("Monstrous Strength selection or 50-percent damage bonus failed")
		quit(1)
		return
	var strength_status_rect: Rect2 = upgrade_level.nightmare_upgrade_display_rect("strength", upgrade_level.NIGHTMARE_STRENGTH_BUTTON)
	if strength_status_rect.position.y != 12.0 or upgrade_level.nightmare_kind_at_position(strength_status_rect.get_center()) != "strength" or upgrade_level.nightmare_kind_at_position(upgrade_level.NIGHTMARE_STRENGTH_BUTTON.get_center()) == "strength":
		push_error("Selected Nightmare upgrade did not move from the choice grid into the horizontal status row")
		quit(1)
		return
	upgrade_level.start_level(5, true)
	if not upgrade_level.nightmare_upgrade_active("strength") or upgrade_level.monster_damage_for("moss") != 45:
		push_error("Nightmare upgrade did not remain active on the next game level")
		quit(1)
		return
	upgrade_level.scare_meter_points = upgrade_level.SCARE_METER_MAX
	if not upgrade_level.select_nightmare_upgrade("flesh") or upgrade_level.nightmare_upgrades.size() != 2 or not upgrade_level.nightmare_upgrade_active("flesh"):
		push_error("A second full meter did not unlock and add a remaining Nightmare upgrade")
		quit(1)
		return
	upgrade_level.scare_meter_points = upgrade_level.SCARE_METER_MAX
	if not upgrade_level.select_nightmare_upgrade("fog") or upgrade_level.nightmare_upgrades.size() != 3 or not upgrade_level.nightmare_upgrade_active("fog"):
		push_error("A third full meter did not unlock the final Nightmare upgrade")
		quit(1)
		return
	for upgrade_kind in ["blood_moon", "fury", "shadow", "siphon", "bargain", "rites"]:
		upgrade_level.scare_meter_points = upgrade_level.SCARE_METER_MAX
		if not upgrade_level.select_nightmare_upgrade(upgrade_kind):
			push_error("A full meter did not unlock %s" % upgrade_kind)
			quit(1)
			return
	if upgrade_level.nightmare_upgrades.size() != 9 or upgrade_level.nightmare_reward(20) != 30 or not is_equal_approx(upgrade_level.nightmare_cooldown(2.0), 1.5) or not is_equal_approx(upgrade_level.nightmare_range(100.0), 130.0) or upgrade_level.monster_purchase_cost("skeleton") != 23:
		push_error("One or more expanded Nightmare Upgrade modifiers are incorrect")
		quit(1)
		return
	var last_status_rect: Rect2 = upgrade_level.nightmare_upgrade_display_rect("rites", upgrade_level.NIGHTMARE_LAST_RITES_BUTTON)
	if last_status_rect.position != Vector2(730, 12) or last_status_rect.end.x > 780.0:
		push_error("Selected Nightmare upgrades do not fit in one horizontal row beside the Scare Meter")
		quit(1)
		return
	upgrade_level.placed.append({"pad": 0, "kind": "moss", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 50, "max_hp": 100, "hit_flash": 0.0})
	var siphon_target := {"id": 77, "kind": 1, "flee": 0.0, "hp": 1, "max_hp": 100, "hit_flash": 0.0}
	upgrade_level.damage_enemy(siphon_target, 1)
	if int(upgrade_level.placed[0]["hp"]) != 60:
		push_error("Soul Siphon did not heal placed monsters")
		quit(1)
		return
	upgrade_level.register_enemy_escape()
	if upgrade_level.escaped != 0 or not upgrade_level.last_rites_used_this_wave:
		push_error("Last Rites did not prevent the first escape")
		quit(1)
		return

	var end_level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(end_level)
	end_level.set_process(false)
	end_level.start_level(1, false)
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
	print("Mummy/Nightmare test passed: all nine permanent upgrades and end-of-level attack stop")
	quit(0)
