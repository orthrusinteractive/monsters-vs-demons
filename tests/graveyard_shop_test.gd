extends SceneTree


func _initialize() -> void:
	call_deferred("run_test")


func run_test() -> void:
	var level = load("res://graveyard_level_01.tscn").instantiate()
	root.add_child(level)
	level.splash_active = false
	if level.scare_points != 200 or level.selected_monster != "skeleton":
		push_error("Shop did not initialize")
		quit(1)
		return
	var click := InputEventMouseButton.new()
	click.button_index = MOUSE_BUTTON_LEFT
	click.pressed = true
	click.position = level.SHOP_SKELETON.position + Vector2(30, 30)
	level._unhandled_input(click)
	if not level.placed.is_empty() or level.scare_points != 200:
		push_error("Monster could be purchased before selecting a spawn point")
		quit(1)
		return
	click.position = level.BUILD_PADS[0]
	level._unhandled_input(click)
	if level.selected_pad != 0 or not level.placed.is_empty():
		push_error("Empty spawn point was not selected first")
		quit(1)
		return
	click.position = level.SHOP_SKELETON.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 170 or level.placed.size() != 1 or level.placed[0].get("kind") != "skeleton":
		push_error("Skeleton purchase failed")
		quit(1)
		return
	if level.MONSTER_DAMAGE["skeleton"] >= level.MONSTER_DAMAGE["moss"] or level.MONSTER_COST["skeleton"] >= level.MONSTER_COST["moss"]:
		push_error("Skeleton is not the cheapest and weakest monster")
		quit(1)
		return
	if level.monster_texture_for_facing("skeleton", "right") != level.SKELETON_RIGHT:
		push_error("Skeleton facing sprite failed")
		quit(1)
		return
	click.position = level.BUILD_PADS[0]
	level._unhandled_input(click)
	if level.scare_points != 110 or not level.placed.is_empty() or level.selected_pad != 0:
		push_error("Removing a monster did not charge double its purchase price or free its spawn point")
		quit(1)
		return
	level.scare_points = 150
	click.position = level.SHOP_MOSS.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 100 or level.placed.size() != 1 or level.placed[0].get("kind") != "moss":
		push_error("Moss purchase failed")
		quit(1)
		return
	click.position = level.BUILD_PADS[0]
	level._unhandled_input(click)
	if level.scare_points != 0 or not level.placed.is_empty() or level.selected_pad != 0:
		push_error("Moss removal failed")
		quit(1)
		return
	level.scare_points = 110
	click.position = level.BUILD_PADS[1]
	level._unhandled_input(click)
	click.position = level.SHOP_BOG.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 0 or level.placed.size() != 1 or level.placed[0].get("kind") != "bog":
		push_error("Bog Guardian purchase failed")
		quit(1)
		return
	level.scare_points = 150
	click.position = level.BUILD_PADS[2]
	level._unhandled_input(click)
	click.position = level.SHOP_SASQUATCH.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 0 or level.placed.size() != 2 or level.placed[1].get("kind") != "sasquatch":
		push_error("Sasquatch purchase failed")
		quit(1)
		return
	if level.MONSTER_COST["sasquatch"] <= level.MONSTER_COST["bog"] or level.MONSTER_COST["sasquatch"] >= level.MONSTER_COST["gargoyle"] or level.MONSTER_DAMAGE["sasquatch"] <= level.MONSTER_DAMAGE["bog"] or level.MONSTER_DAMAGE["sasquatch"] >= level.MONSTER_DAMAGE["gargoyle"]:
		push_error("Sasquatch stats are not balanced between Bog Guardian and Gargoyle")
		quit(1)
		return
	if level.monster_texture_for_facing("sasquatch", "back") != level.SASQUATCH_BACK:
		push_error("Sasquatch directional sprite failed")
		quit(1)
		return
	level.scare_points = 40
	click.position = level.BUILD_PADS[3]
	level._unhandled_input(click)
	click.position = level.SHOP_GARGOYLE.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.placed.size() != 2 or level.scare_points != 40 or level.selected_pad != 3:
		push_error("Unaffordable purchase was allowed")
		quit(1)
		return
	level.scare_points = 180
	click.position = level.SHOP_GARGOYLE.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 0 or level.placed.size() != 3 or level.placed[2].get("kind") != "gargoyle":
		push_error("Gargoyle purchase failed")
		quit(1)
		return
	if level.monster_texture_for_facing("gargoyle", "right") != level.GARGOYLE_RIGHT:
		push_error("Gargoyle facing sprite failed")
		quit(1)
		return
	level.scare_points = 240
	click.position = level.BUILD_PADS[4]
	level._unhandled_input(click)
	click.position = level.SHOP_WEREWOLF.position + Vector2(30, 30)
	level._unhandled_input(click)
	if level.scare_points != 0 or level.placed.size() != 4 or level.placed[3].get("kind") != "werewolf":
		push_error("Werewolf purchase failed")
		quit(1)
		return
	if level.werewolf_texture_for_facing("back", true) != level.WEREWOLF_BACK_HOWL:
		push_error("Werewolf howl facing sprite failed")
		quit(1)
		return
	print("Shop test passed: Sasquatch is correctly placed between Bog Guardian and Gargoyle")
	quit(0)
