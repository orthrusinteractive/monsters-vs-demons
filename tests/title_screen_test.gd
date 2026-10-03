extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.set_process(false)
	if not level.splash_active:
		push_error("Opening title screen was not active at startup")
		quit(1)
		return
	if not level.title_music_audio.playing or not level.title_music_audio_layer_2.playing:
		push_error("Both opening title music layers did not start")
		quit(1)
		return
	var click := InputEventMouseButton.new()
	click.button_index = MOUSE_BUTTON_LEFT
	click.pressed = true
	click.position = level.PLAY_BUTTON.get_center()
	level._unhandled_input(click)
	if level.splash_active or level.current_level != 1 or level.wave_intro_elapsed != 0.0 or level.title_music_audio.playing or level.title_music_audio_layer_2.playing:
		push_error("PLAY did not begin Level 1 from a clean introduction")
		quit(1)
		return
	print("Title screen test passed: splash starts active and PLAY begins Level 1")
	quit(0)
