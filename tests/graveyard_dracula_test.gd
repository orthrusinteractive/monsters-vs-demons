extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	if level.summon_dracula():
		return fail("Dracula was available before 10,000 current scare points were held")
	var defeated_enemy := {"id": 50, "kind": 1, "route_id": 0, "distance": 0.0, "flee": 0.0, "phase": 0.0, "hp": 1, "max_hp": 1, "speed": 0.0, "hit_flash": 0.0}
	level.damage_enemy(defeated_enemy, 1)
	if level.total_scare_points_earned != 20:
		return fail("Defeated enemies did not add to current scare points")
	level.scare_points = level.DRACULA_UNLOCK_POINTS
	level.scare_meter_points = 777
	if not level.summon_dracula():
		return fail("Dracula did not unlock after 10,000 points were earned")
	if level.scare_meter_points != 777 or not level.dracula_used_levels.has(1):
		return fail("Using Dracula charged meter points or failed to record the level use")
	level.dracula_active = false
	if level.summon_dracula():
		return fail("Dracula was usable twice during the same level")
	level.start_level(5, true)
	if level.scare_points != level.DRACULA_UNLOCK_POINTS or not level.can_summon_dracula():
		return fail("Dracula's current-point unlock did not carry into the next level")
	if not level.summon_dracula() or not level.dracula_used_levels.has(2):
		return fail("Dracula was not available for his free Level 2 use")
	var directions: Array[String] = []
	var traveled := 0.0
	for i in range(level.ROUTE.size() - 1):
		var segment: float = level.ROUTE[i].distance_to(level.ROUTE[i + 1])
		var direction: String = level.dracula_direction_at(traveled + segment * 0.5)
		if not directions.has(direction):
			directions.append(direction)
		traveled += segment
	if not directions.has("right") or not directions.has("up") or not directions.has("down"):
		return fail("Dracula does not follow the route's directional turns")
	for direction in ["right", "left", "up", "down"]:
		for frame in range(2):
			var texture: Texture2D = level.dracula_texture(direction, frame)
			if texture == null or texture.get_size() != Vector2(128, 128):
				return fail("Missing Dracula direction/frame: %s/%d" % [direction, frame])
	print("Dracula test passed: 10,000 current-point unlock and one free use per level")
	quit(0)


func fail(message: String) -> void:
	push_error(message)
	quit(1)
