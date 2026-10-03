extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	level.scare_points = level.FRANK_UNLOCK_POINTS
	if not level.summon_frank() or level.scare_meter_points != 0 or level.scare_points != level.FRANK_UNLOCK_POINTS or level.summon_frank():
		push_error("Frankenstein current-point unlock or per-level use lock failed")
		quit(1)
		return
	if level.FRANK_PORTAL_STRIP.get_size() != Vector2(768, 128) or level.FRANK_LIGHTNING_ATLAS.get_size() != Vector2(1920, 1080):
		push_error("Frankenstein portal or lightning artwork has the wrong size")
		quit(1)
		return
	if level.frank_portal_frame() != 0:
		push_error("Frankenstein portal did not begin closed")
		quit(1)
		return
	level.ghosts.append({"id": 1, "kind": 1, "distance": 100.0, "flee": 0.0, "phase": 0.0, "hp": 100, "max_hp": 100, "speed": 0.0, "hit_flash": 0.0})
	level.ghosts.append({"id": 2, "kind": 3, "distance": 600.0, "flee": 0.0, "phase": 0.0, "hp": 270, "max_hp": 270, "speed": 0.0, "hit_flash": 0.0})
	level._advance_frank(level.FRANK_PORTAL_OPEN_TIME)
	if level.frank_phase != "portal_wait" or level.frank_portal_frame() < 4:
		push_error("Frankenstein portal did not fully open before the wait")
		quit(1)
		return
	level._advance_frank(level.FRANK_PORTAL_WAIT_TIME * 0.5)
	if level.frank_phase != "portal_wait":
		push_error("Frankenstein did not wait behind the open portal")
		quit(1)
		return
	level._advance_frank(level.FRANK_PORTAL_WAIT_TIME * 0.5)
	if level.frank_phase != "rise":
		push_error("Frankenstein failed to begin rising after the portal wait")
		quit(1)
		return
	level._advance_frank(level.FRANK_RISE_TIME)
	if level.frank_phase != "forward":
		push_error("Frankenstein failed to rise")
		quit(1)
		return
	if level.frank_portal_frame() < 4:
		push_error("Frankenstein portal did not remain fully open")
		quit(1)
		return
	level._advance_frank(level.FRANK_WALK_TIME)
	if level.frank_phase != "blast" or level.scared != 1 or level.scare_points != level.FRANK_UNLOCK_POINTS + 20 or level.scare_meter_points != 20 or int(level.ghosts[1]["hp"]) != 70 or level.frank_blast_targets.size() != 2:
		push_error("Map-wide lightning damage or reward failed")
		quit(1)
		return
	if level.frank_lightning_frame() != 0:
		push_error("Frankenstein lightning animation did not begin on frame 1")
		quit(1)
		return
	level._advance_frank(level.FRANK_BLAST_TIME * 0.5)
	if int(level.ghosts[1]["hp"]) != 70:
		push_error("Lightning dealt damage more than once")
		quit(1)
		return
	level._advance_frank(level.FRANK_BLAST_TIME * 0.5)
	if level.frank_phase != "backward":
		push_error("Frankenstein lightning did not last exactly two seconds")
		quit(1)
		return
	level._advance_frank(level.FRANK_WALK_TIME)
	level._advance_frank(level.FRANK_SINK_TIME)
	if level.frank_phase != "portal_closing" or level.frank_portal_frame() < 4:
		push_error("Portal began closing before Frankenstein fully descended")
		quit(1)
		return
	level._advance_frank(level.FRANK_PORTAL_CLOSE_TIME)
	if level.frank_phase != "idle" or not level.frank_blast_targets.is_empty():
		push_error("Frankenstein failed to return underground")
		quit(1)
		return
	print("Frankenstein test passed: open, wait, rise, walk, two-second lightning, retreat, sink, close")
	quit(0)
