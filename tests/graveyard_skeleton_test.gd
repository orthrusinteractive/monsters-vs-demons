extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.splash_active = false
	level.placed.append({"pad": 0, "kind": "skeleton", "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": 140, "max_hp": 140, "hit_flash": 0.0})
	level.ghosts.append({"id": 77, "kind": 1, "route_id": 0, "distance": 160.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 0.0, "hit_flash": 0.0})
	level._process(0.05)
	if level.projectiles.is_empty() or level.projectiles[0].get("kind") != "skeleton" or int(level.projectiles[0].get("damage")) != 15:
		push_error("Skeleton did not throw its 15-damage bone projectile")
		quit(1)
		return
	var rotated := false
	for i in range(20):
		level._process(0.05)
		if not level.projectiles.is_empty() and absf(float(level.projectiles[0].get("rotation", 0.0))) > 0.0:
			rotated = true
		if int(level.ghosts[0]["hp"]) < 100:
			break
	if not rotated or int(level.ghosts[0]["hp"]) != 85:
		push_error("Skeleton bone did not visibly rotate and deal exactly 15 damage")
		quit(1)
		return
	if level.SKELETON_PROJECTILE == null or level.SCARE_METER_FRAME == null:
		push_error("Skeleton projectile or Scare Meter artwork is missing")
		quit(1)
		return
	print("Skeleton test passed: cheapest defender throws a rotating 15-damage bone")
	quit(0)
