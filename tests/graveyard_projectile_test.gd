extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var scene: PackedScene = load("res://graveyard_level_01.tscn")
	var level = scene.instantiate()
	root.add_child(level)
	level.splash_active = false
	level.wave_intro_elapsed = level.WAVE_INTRO_DURATION
	level.spawned = level.level_enemy_count()
	level.ghosts.append({"id": 0, "kind": 1, "distance": 130.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 42.0, "hit_flash": 0.0})
	level.placed.append({"pad": 0, "facing": "front", "cooldown": 0.0})
	var launched := false
	var rotated := false
	for frame in range(120):
		await process_frame
		if not level.projectiles.is_empty():
			launched = true
			if float(level.projectiles[0]["rotation"]) > 0.0:
				rotated = true
		if int(level.ghosts[0]["hp"]) < 100:
			break
	if not launched or not rotated or int(level.ghosts[0]["hp"]) != 70 or level.scared != 0:
		push_error("First hit failed: launched=%s rotated=%s hp=%d scared=%d" % [launched, rotated, level.ghosts[0]["hp"], level.scared])
		quit(1)
		return
	for i in range(3):
		level.projectiles.append({"position": level.point_on_route(float(level.ghosts[0]["distance"])) + Vector2(0, -19), "target_id": 0, "rotation": 0.0})
	await process_frame
	if int(level.ghosts[0]["hp"]) != 0 or level.scared != 1:
		push_error("Four-hit defeat failed: hp=%d scared=%d" % [level.ghosts[0]["hp"], level.scared])
		quit(1)
		return
	print("Projectile test passed: spinning shots deal 30 damage; four hits scare a 100 HP ghost")
	quit(0)
