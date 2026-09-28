extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	seed(7)
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.start_level(5, false)
	level.scare_points = 1000
	level.selected_pad = 1
	if not level.try_place_monster("killian"):
		push_error("Killian Clown could not be purchased and placed")
		quit(1)
		return
	if level.scare_points != 500 or int(level.placed[0]["hp"]) != 350:
		push_error("Killian cost or health is incorrect")
		quit(1)
		return
	level.placed.append({"pad": 2, "kind": "moss", "facing": "front", "cooldown": 99.0, "howl_time": 0.0, "hp": 180, "max_hp": 180, "hit_flash": 0.0})
	var killian_pos: Vector2 = level.active_build_pads()[1]
	level.ghosts.append({"id": 91, "kind": 1, "route_id": 0, "distance": 365.0, "flee": 0.0, "phase": 0.0, "hp": 300, "max_hp": 300, "speed": 0.0, "hit_flash": 0.0})
	# Put the enemy in range explicitly while keeping it on a valid route.
	var best_distance := 0.0
	var best_gap := INF
	for route_distance in range(0, int(level.route_length_for(0)), 5):
		var gap: float = killian_pos.distance_to(level.point_on_route(float(route_distance), 0))
		if gap < best_gap:
			best_gap = gap
			best_distance = float(route_distance)
	level.ghosts[0]["distance"] = best_distance
	var candidates = level.killian_target_candidates(level.placed[0])
	var enemy_selections := 0
	for selection_index in range(1000):
		if str(level.choose_killian_target(candidates).get("type")) == "enemy":
			enemy_selections += 1
	if enemy_selections < 860 or enemy_selections > 940:
		push_error("Killian's weighted targeting is not approximately 90/10: enemy selections=%d" % enemy_selections)
		quit(1)
		return
	seed(7)
	level._process(0.01)
	if level.projectiles.size() != 1:
		push_error("Killian did not throw exactly one machete: candidates=%d gap=%.2f projectiles=%d" % [candidates.size(), best_gap, level.projectiles.size()])
		quit(1)
		return
	for projectile in level.projectiles:
		if str(projectile.get("kind")) != "killian" or int(projectile.get("damage")) != 100 or not ["enemy", "monster"].has(str(projectile.get("target_type"))):
			push_error("Killian machete projectile configuration is incorrect")
			quit(1)
			return
	level._process(1.0)
	var enemy_damage := 300 - int(level.ghosts[0]["hp"])
	var moss_index: int = level.monster_index_at_pad(2)
	var ally_damage := 180 if moss_index < 0 else 180 - int(level.placed[moss_index]["hp"])
	if enemy_damage + ally_damage != 100:
		push_error("Killian's machete did not deal 100 total damage")
		quit(1)
		return
	print("Killian test passed: cost, health, range, and one spinning wildcard machete")
	quit(0)
