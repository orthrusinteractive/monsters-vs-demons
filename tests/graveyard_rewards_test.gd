extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	var rewards := [20, 35, 50, 65, 80, 100]
	for kind in range(1, 7):
		level.start_level(kind, false)
		level.scare_meter_points = 0
		level.spawned = level.level_enemy_count()
		var enemy_pos: Vector2 = level.point_on_route(130.0)
		level.ghosts.append({"id": kind, "kind": kind, "distance": 130.0, "flee": 0.0, "phase": 0.0, "hp": 30, "max_hp": 30, "speed": 0.0, "hit_flash": 0.0})
		level.projectiles.append({"position": enemy_pos + Vector2(0, -19), "target_id": kind, "rotation": 0.0, "damage": 30, "kind": "moss"})
		level._process(0.01)
		if level.scare_points != 200 + rewards[kind - 1] or level.scare_meter_points != rewards[kind - 1] or level.scare_meter_square_count() != int(rewards[kind - 1] / 5) or level.scared != 1:
			push_error("Wrong scare-point reward for enemy kind %d: points=%d scared=%d" % [kind, level.scare_points, level.scared])
			quit(1)
			return
	if level.MUMMY_UNLOCK_POINTS != 20000 or level.FRANK_UNLOCK_POINTS != 30000 or level.DRACULA_UNLOCK_POINTS != 10000 or level.SCARE_METER_MAX != 3000:
		push_error("Special unlock or Scare Meter maximum is incorrect")
		quit(1)
		return
	print("Rewards test passed: enemy rewards, 3000-point upgrades, and special unlock thresholds are correct")
	quit(0)
