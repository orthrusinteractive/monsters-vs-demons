extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	seed(8642)
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	if level.PROJECTILE_WHOOSH == null or level.LIGHTNING_STRIKE_SOUND == null or level.LIGHTNING_STRIKE_CLOSE_SOUND == null or level.GRAVEYARD_AMBIENCE == null or level.WEREWOLF_GROWL_SOUND == null:
		push_error("One or more gameplay audio assets failed to load")
		quit(1)
		return
	if not level.ambience_audio.playing:
		push_error("Level 1 graveyard ambience did not begin playing")
		quit(1)
		return
	level.start_level(5, false)
	if level.ambience_audio.playing:
		push_error("Graveyard ambience continued outside Level 1")
		quit(1)
		return
	level.start_level(1, false)
	level.sky_lightning_timer = 0.0
	level._advance_sky_lightning(0.01)
	if level.sky_lightning_elapsed < 0.0 or level.sky_lightning_x < 140.0 or level.sky_lightning_x > 825.0 or not level.lightning_audio.playing:
		push_error("Random sky lightning did not start at a valid location with its strike sound")
		quit(1)
		return
	if level.lightning_audio.stream != level.LIGHTNING_STRIKE_SOUND and level.lightning_audio.stream != level.LIGHTNING_STRIKE_CLOSE_SOUND:
		push_error("Lightning did not randomly choose from the two strike recordings")
		quit(1)
		return
	level._advance_sky_lightning(0.65)
	if level.sky_lightning_timer < 20.5:
		push_error("Lightning cooldown permits more than three strikes per minute")
		quit(1)
		return
	print("Audio test passed: Level 1 ambience loop control and randomized lightning strike audio")
	quit(0)
