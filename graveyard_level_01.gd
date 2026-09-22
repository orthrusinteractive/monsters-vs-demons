extends Node2D

const BACKGROUND: Texture2D = preload("res://assets/backgrounds/graveyard-round-01-960x540.png")
const BACKGROUND_2: Texture2D = preload("res://assets/backgrounds/graveyard-round-02-v2-960x540.png")
const FOUL_FIEND: Font = preload("res://assets/fonts/Foul Fiend.otf")
const TOMBSTONE_SCOTT: Texture2D = preload("res://assets/sprites/tombstone-scott-128x128.png")
const TOMBSTONE_TOM: Texture2D = preload("res://assets/sprites/tombstone-tom-128x128.png")
const GHOST: Texture2D = preload("res://assets/sprites/bedsheet-ghost-128x128.png")
const SPECTRE: Texture2D = preload("res://assets/sprites/spectre-front-128x128.png")
const BANSHEE: Texture2D = preload("res://assets/sprites/banshee-front-128x128.png")
const DEMON_DOLL: Texture2D = preload("res://assets/sprites/demon-doll-front-128x128.png")
const GHOSTLY_NUN: Texture2D = preload("res://assets/sprites/ghostly-nun-front-128x128.png")
const DEMON_WALK: Texture2D = preload("res://assets/sprites/red-demon-walk-front-4x128.png")
const MOSS_FRONT: Texture2D = preload("res://assets/sprites/moss-monster-front-128x128.png")
const MOSS_BACK: Texture2D = preload("res://assets/sprites/moss-monster-back-128x128.png")
const MOSS_RIGHT: Texture2D = preload("res://assets/sprites/moss-monster-right-128x128.png")
const MOSS_LEFT: Texture2D = preload("res://assets/sprites/moss-monster-left-128x128.png")
const MOSS_PROJECTILE: Texture2D = preload("res://assets/sprites/moss-projectile-32x32.png")
const BOG_FRONT: Texture2D = preload("res://assets/sprites/bog-guardian-front-128x128.png")
const BOG_BACK: Texture2D = preload("res://assets/sprites/bog-guardian-back-128x128.png")
const BOG_RIGHT: Texture2D = preload("res://assets/sprites/bog-guardian-right-128x128.png")
const BOG_LEFT: Texture2D = preload("res://assets/sprites/bog-guardian-left-128x128.png")
const BOG_PROJECTILE: Texture2D = preload("res://assets/sprites/bog-projectile-32x32.png")
const GARGOYLE_FRONT: Texture2D = preload("res://assets/sprites/graveyard-gargoyle-front-128x128.png")
const GARGOYLE_BACK: Texture2D = preload("res://assets/sprites/graveyard-gargoyle-back-128x128.png")
const GARGOYLE_RIGHT: Texture2D = preload("res://assets/sprites/graveyard-gargoyle-right-128x128.png")
const GARGOYLE_LEFT: Texture2D = preload("res://assets/sprites/graveyard-gargoyle-left-128x128.png")
const GARGOYLE_PROJECTILE: Texture2D = preload("res://assets/sprites/gargoyle-stone-projectile-32x32.png")
const WEREWOLF_FRONT: Texture2D = preload("res://assets/sprites/werewolf-front-128x128.png")
const WEREWOLF_BACK: Texture2D = preload("res://assets/sprites/werewolf-back-128x128.png")
const WEREWOLF_RIGHT: Texture2D = preload("res://assets/sprites/werewolf-right-128x128.png")
const WEREWOLF_LEFT: Texture2D = preload("res://assets/sprites/werewolf-left-128x128.png")
const WEREWOLF_FRONT_HOWL: Texture2D = preload("res://assets/sprites/werewolf-front-howl-128x128.png")
const WEREWOLF_BACK_HOWL: Texture2D = preload("res://assets/sprites/werewolf-back-howl-128x128.png")
const WEREWOLF_RIGHT_HOWL: Texture2D = preload("res://assets/sprites/werewolf-right-howl-128x128.png")
const WEREWOLF_LEFT_HOWL: Texture2D = preload("res://assets/sprites/werewolf-left-howl-128x128.png")
const DRACULA_RIGHT_1: Texture2D = preload("res://assets/sprites/dracula-fly-right-01-128x128.png")
const DRACULA_RIGHT_2: Texture2D = preload("res://assets/sprites/dracula-fly-right-02-128x128.png")
const DRACULA_LEFT_1: Texture2D = preload("res://assets/sprites/dracula-fly-left-01-128x128.png")
const DRACULA_LEFT_2: Texture2D = preload("res://assets/sprites/dracula-fly-left-02-128x128.png")
const DRACULA_UP_1: Texture2D = preload("res://assets/sprites/dracula-fly-up-01-128x128.png")
const DRACULA_UP_2: Texture2D = preload("res://assets/sprites/dracula-fly-up-02-128x128.png")
const DRACULA_DOWN_1: Texture2D = preload("res://assets/sprites/dracula-fly-down-01-128x128.png")
const DRACULA_DOWN_2: Texture2D = preload("res://assets/sprites/dracula-fly-down-02-128x128.png")
const FRANK_FRONT: Texture2D = preload("res://assets/sprites/frankenstein-monster-front-128x128.png")
const FRANK_FRONT_RIGHT: Texture2D = preload("res://assets/sprites/frankenstein-monster-front-right-leg-up-128x128.png")
const FRANK_FRONT_LEFT: Texture2D = preload("res://assets/sprites/frankenstein-monster-front-left-leg-up-128x128.png")
const FRANK_BACK: Texture2D = preload("res://assets/sprites/frankenstein-monster-back-128x128.png")
const FRANK_BACK_RIGHT: Texture2D = preload("res://assets/sprites/frankenstein-monster-back-right-leg-up-128x128.png")
const FRANK_BACK_LEFT: Texture2D = preload("res://assets/sprites/frankenstein-monster-back-left-leg-up-128x128.png")
const FRANK_PORTAL_STRIP: Texture2D = preload("res://assets/sprites/frankenstein-electric-portal-6x128.png")
const FRANK_LIGHTNING_ATLAS: Texture2D = preload("res://assets/effects/frankenstein-lightning-4frame-atlas-1920x1080.png")
const GRAVEWROUGHT_IDLE: Texture2D = preload("res://assets/sprites/level-1-fusion-boss-front-master.png")
const GRAVEWROUGHT_GRAVEWAIL: Texture2D = preload("res://assets/sprites/level-1-fusion-boss-gravewail-master.png")
const SOUL_REAPER_IDLE: Texture2D = preload("res://assets/sprites/level-2-grim-reaper-boss-front-master.png")
const SOUL_REAPER_ATTACK: Texture2D = preload("res://assets/sprites/level-2-grim-reaper-boss-lightning-attack-master.png")
const SOUL_LIGHTNING_1: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-01-master.png")
const SOUL_LIGHTNING_2: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-02-master.png")
const SOUL_LIGHTNING_3: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-03-master.png")
const SOUL_LIGHTNING_4: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-04-master.png")

const SIZE := Vector2(960, 540)
const LEVEL_COUNT := 8
const WAVES_PER_LEVEL := 4
const WAVE_INTRO_DURATION := 3.5
const WAVE_LABEL_DELAY := 1.1
const LEVEL_NAMES := ["BEDSHEET GHOSTS", "SPECTRES", "RED DEMONS", "BANSHEES", "GHOSTS & SPECTRES", "DEMONS & BANSHEES", "DEMON DOLLS", "GHOSTLY NUNS"]
const LEVEL_HP := [100, 180, 270, 320, 400, 500]
const LEVEL_SPEED := [42.0, 44.0, 46.0, 48.0, 52.0, 49.0]
const LEVEL_ENEMY_COUNT := [12, 13, 14, 15, 16, 17, 12, 13]
const LEVEL_PATTERNS := [
	[1], [2], [3],
	[4],
	[1, 2],
	[3, 4],
	[5],
	[6]
]
const LEVEL_BONUS_HP := [0, 0, 0, 20, 40, 60, 0, 0]
const LEVEL_BONUS_SPEED := [0.0, 0.0, 0.0, 3.0, 6.0, 9.0, 0.0, 0.0]
const LEVEL_SPAWN_INTERVAL := [2.1, 2.1, 2.1, 1.9, 1.7, 1.5, 1.8, 2.0]
const SCARE_RANGE := 105.0
const SCARE_COOLDOWN := 1.5
const PROJECTILE_SPEED := 190.0
const PROJECTILE_SPIN := 11.0
const PROJECTILE_DAMAGE := 30
const STARTING_SCARE_POINTS := 200
const SCARE_REWARD := [20, 35, 50, 65, 80, 100]
const DRACULA_COST := 350
const DRACULA_DAMAGE := 100
const DRACULA_SPEED := 260.0
const DRACULA_CONTACT_RADIUS := 29.0
const FRANK_COST := 500
const FRANK_DAMAGE := 200
const FRANK_ORIGIN := Vector2(459, 160)
const FRANK_STEP_DISTANCE := 56.0
const FRANK_PORTAL_OPEN_TIME := 0.9
const FRANK_PORTAL_WAIT_TIME := 1.0
const FRANK_RISE_TIME := 0.9
const FRANK_WALK_TIME := 1.1
const FRANK_BLAST_TIME := 2.0
const FRANK_SINK_TIME := 0.9
const FRANK_PORTAL_CLOSE_TIME := 0.9
const MONSTER_COST := {"moss": 50, "bog": 110, "gargoyle": 180, "werewolf": 240}
const MONSTER_DAMAGE := {"moss": 30, "bog": 60, "gargoyle": 90, "werewolf": 120}
const WEREWOLF_RANGE := 145.0
const WEREWOLF_COOLDOWN := 1.8
const HOWL_DURATION := 0.42
const BOSS_INTRO_DURATION := 3.2
const GRAVEWROUGHT_HP := 4200
const GRAVEWROUGHT_SPEED := 22.0
const GRAVEWROUGHT_REWARD := 500
const GRAVEWAIL_COOLDOWN := 4.5
const GRAVEWAIL_DURATION := 1.25
const GRAVEWAIL_HIT_TIME := 0.62
const GRAVEWAIL_RADIUS := 330.0
const GRAVEWAIL_DAMAGE := 75
const SOUL_REAPER_HP := 6500
const SOUL_REAPER_SPEED := 20.0
const SOUL_REAPER_REWARD := 800
const SOUL_LIGHTNING_COOLDOWN := 5.5
const SOUL_LIGHTNING_DURATION := 2.0
const SOUL_LIGHTNING_HIT_TIME := 0.8
const SOUL_LIGHTNING_DAMAGE := 90
const MONSTER_HP := {"moss": 180, "bog": 270, "gargoyle": 380, "werewolf": 320}
const SHOP_MOSS := Rect2(8, 461, 150, 65)
const SHOP_BOG := Rect2(167, 461, 150, 65)
const SHOP_GARGOYLE := Rect2(326, 461, 150, 65)
const SHOP_WEREWOLF := Rect2(485, 461, 150, 65)
const SHOP_DRACULA := Rect2(644, 461, 150, 65)
const SHOP_FRANK := Rect2(803, 461, 149, 65)
const PORTRAIT_MOSS := Rect2(38, 25, 52, 52)
const PORTRAIT_BOG := Rect2(38, 24, 52, 52)
const PORTRAIT_GARGOYLE := Rect2(38, 24, 52, 52)
const PORTRAIT_WEREWOLF := Rect2(37, 6, 54, 54)
const PORTRAIT_DRACULA := Rect2(43, 53, 44, 44)
const PORTRAIT_FRANK := Rect2(42, 5, 44, 48)
const BUILD_PADS: Array[Vector2] = [
	Vector2(141, 226), Vector2(329, 178), Vector2(615, 321), Vector2(846, 210)
]
const BUILD_PADS_2: Array[Vector2] = [
	Vector2(164, 177), Vector2(332, 102), Vector2(400, 253), Vector2(584, 107),
	Vector2(610, 285), Vector2(344, 427), Vector2(650, 425), Vector2(736, 354)
]
const ROUTE: Array[Vector2] = [
	Vector2(-35, 170), Vector2(175, 169), Vector2(216, 175),
	Vector2(242, 211), Vector2(258, 269), Vector2(300, 282),
	Vector2(368, 285), Vector2(403, 324), Vector2(456, 336),
	Vector2(492, 321), Vector2(523, 278), Vector2(542, 219),
	Vector2(582, 189), Vector2(653, 185), Vector2(694, 196),
	Vector2(732, 238), Vector2(765, 286), Vector2(813, 304),
	Vector2(995, 305)
]
const ROUTE_2_UP: Array[Vector2] = [
	Vector2(-35, 278), Vector2(160, 278), Vector2(222, 270), Vector2(275, 210),
	Vector2(341, 169), Vector2(445, 159), Vector2(550, 161), Vector2(640, 186),
	Vector2(704, 257), Vector2(754, 279), Vector2(840, 268)
]
const ROUTE_2_DOWN: Array[Vector2] = [
	Vector2(-35, 278), Vector2(160, 278), Vector2(222, 286), Vector2(282, 352),
	Vector2(350, 379), Vector2(466, 383), Vector2(575, 379), Vector2(650, 344),
	Vector2(704, 288), Vector2(754, 279), Vector2(840, 268)
]

var ghosts: Array[Dictionary] = []
var placed: Array[Dictionary] = []
var projectiles: Array[Dictionary] = []
var howls: Array[Dictionary] = []
var route_length := 0.0
var route_length_2_up := 0.0
var route_length_2_down := 0.0
var spawn_clock := 0.0
var spawned := 0
var scared := 0
var escaped := 0
var hover_pad := -1
var selected_pad := -1
var time_passed := 0.0
var wave_intro_elapsed := 0.0
var current_level := 1
var scare_points := STARTING_SCARE_POINTS
var selected_monster := "moss"
var dracula_active := false
var dracula_distance := -60.0
var dracula_hit_ids: Dictionary = {}
var dracula_route_id := 0
var frank_phase := "idle"
var frank_elapsed := 0.0
var frank_blast_targets: Array[Vector2] = []
var boss_mode := false
var boss_spawned := false
var boss_defeated := false
var boss_intro_elapsed := 0.0
var boss_attack_cooldown := GRAVEWAIL_COOLDOWN
var boss_gravewail_elapsed := -1.0
var boss_gravewail_hit := false
var boss_level := 0


func _ready() -> void:
	for i in range(ROUTE.size() - 1):
		route_length += ROUTE[i].distance_to(ROUTE[i + 1])
	for i in range(ROUTE_2_UP.size() - 1):
		route_length_2_up += ROUTE_2_UP[i].distance_to(ROUTE_2_UP[i + 1])
	for i in range(ROUTE_2_DOWN.size() - 1):
		route_length_2_down += ROUTE_2_DOWN[i].distance_to(ROUTE_2_DOWN[i + 1])
	start_level(1, false)


func reset_level() -> void:
	start_level(current_level, false)


func start_level(level_number: int, keep_monsters: bool) -> void:
	var old_display_level := display_level()
	current_level = clampi(level_number, 1, LEVEL_COUNT)
	ghosts.clear()
	if not keep_monsters:
		placed.clear()
		scare_points = STARTING_SCARE_POINTS
	elif display_level() != old_display_level:
		placed.clear()
	else:
		for monster in placed:
			monster["cooldown"] = 0.0
	projectiles.clear()
	howls.clear()
	dracula_active = false
	dracula_distance = -60.0
	dracula_route_id = 0
	dracula_hit_ids.clear()
	frank_phase = "idle"
	frank_elapsed = 0.0
	frank_blast_targets.clear()
	boss_mode = false
	boss_spawned = false
	boss_defeated = false
	boss_intro_elapsed = 0.0
	boss_attack_cooldown = GRAVEWAIL_COOLDOWN
	boss_gravewail_elapsed = -1.0
	boss_gravewail_hit = false
	boss_level = 0
	selected_pad = -1
	spawn_clock = 0.0
	spawned = 0
	scared = 0
	escaped = 0
	time_passed = 0.0
	wave_intro_elapsed = 0.0
	queue_redraw()


func display_level() -> int:
	return int((current_level - 1) / WAVES_PER_LEVEL) + 1


func display_wave() -> int:
	return (current_level - 1) % WAVES_PER_LEVEL + 1


func active_build_pads() -> Array[Vector2]:
	return BUILD_PADS_2 if display_level() == 2 else BUILD_PADS


func level_hp() -> int:
	return enemy_hp_for_kind(enemy_kind_for_spawn(0))


func level_speed() -> float:
	return enemy_speed_for_kind(enemy_kind_for_spawn(0))


func level_enemy_count() -> int:
	return int(LEVEL_ENEMY_COUNT[current_level - 1])


func enemy_kind_for_spawn(index: int) -> int:
	var pattern: Array = LEVEL_PATTERNS[current_level - 1]
	return int(pattern[index % pattern.size()])


func enemy_hp_for_kind(kind: int) -> int:
	return int(LEVEL_HP[kind - 1]) + int(LEVEL_BONUS_HP[current_level - 1])


func enemy_speed_for_kind(kind: int) -> float:
	return float(LEVEL_SPEED[kind - 1]) + float(LEVEL_BONUS_SPEED[current_level - 1])


func wave_complete() -> bool:
	if boss_mode:
		return boss_defeated and ghosts.is_empty() and projectiles.is_empty() and howls.is_empty() and not dracula_active and frank_phase == "idle"
	return spawned >= level_enemy_count() and ghosts.is_empty() and projectiles.is_empty() and howls.is_empty() and not dracula_active and frank_phase == "idle"


func start_boss_battle() -> void:
	ghosts.clear()
	projectiles.clear()
	howls.clear()
	dracula_active = false
	dracula_hit_ids.clear()
	frank_phase = "idle"
	frank_blast_targets.clear()
	boss_mode = true
	boss_level = display_level()
	boss_spawned = false
	boss_defeated = false
	boss_intro_elapsed = 0.0
	boss_attack_cooldown = SOUL_LIGHTNING_COOLDOWN if boss_level == 2 else GRAVEWAIL_COOLDOWN
	boss_gravewail_elapsed = -1.0
	boss_gravewail_hit = false
	wave_intro_elapsed = WAVE_INTRO_DURATION
	for monster in placed:
		var kind := str(monster.get("kind", "moss"))
		if not monster.has("max_hp"):
			monster["max_hp"] = int(MONSTER_HP.get(kind, 180))
		if not monster.has("hp"):
			monster["hp"] = int(monster["max_hp"])
		monster["hit_flash"] = 0.0
	queue_redraw()


func can_summon_dracula() -> bool:
	return scare_points >= DRACULA_COST and not dracula_active and not wave_complete()


func summon_dracula() -> bool:
	if not can_summon_dracula():
		return false
	scare_points -= DRACULA_COST
	dracula_active = true
	dracula_distance = -60.0
	dracula_route_id = 0
	dracula_hit_ids.clear()
	queue_redraw()
	return true


func can_summon_frank() -> bool:
	return scare_points >= FRANK_COST and frank_phase == "idle" and not wave_complete()


func summon_frank() -> bool:
	if not can_summon_frank():
		return false
	scare_points -= FRANK_COST
	frank_phase = "portal_opening"
	frank_elapsed = 0.0
	frank_blast_targets.clear()
	queue_redraw()
	return true


func damage_enemy(enemy: Dictionary, damage: int) -> void:
	if float(enemy["flee"]) > 0.0:
		return
	enemy["hp"] = maxi(0, int(enemy["hp"]) - damage)
	enemy["hit_flash"] = 0.16
	if int(enemy["hp"]) == 0:
		enemy["flee"] = 1.2 if bool(enemy.get("is_boss", false)) else 0.8
		scared += 1
		if bool(enemy.get("is_boss", false)):
			boss_defeated = true
			scare_points += SOUL_REAPER_REWARD if boss_level == 2 else GRAVEWROUGHT_REWARD
		else:
			scare_points += int(SCARE_REWARD[int(enemy["kind"]) - 1])


func _process(delta: float) -> void:
	time_passed += delta
	wave_intro_elapsed = minf(wave_intro_elapsed + delta, WAVE_INTRO_DURATION)
	if boss_mode:
		boss_intro_elapsed = minf(boss_intro_elapsed + delta, BOSS_INTRO_DURATION)
		if boss_intro_elapsed >= BOSS_INTRO_DURATION and not boss_spawned and not boss_defeated:
			var boss_hp := SOUL_REAPER_HP if boss_level == 2 else GRAVEWROUGHT_HP
			var boss_speed := SOUL_REAPER_SPEED if boss_level == 2 else GRAVEWROUGHT_SPEED
			ghosts.append({"id": 10000, "kind": 8 if boss_level == 2 else 7, "is_boss": true, "route_id": 0, "distance": 0.0, "flee": 0.0, "phase": 0.0, "hp": boss_hp, "max_hp": boss_hp, "speed": boss_speed, "hit_flash": 0.0})
			boss_spawned = true
	elif wave_intro_elapsed >= WAVE_INTRO_DURATION and spawned < level_enemy_count():
		spawn_clock -= delta
		if spawn_clock <= 0.0:
			var enemy_kind := enemy_kind_for_spawn(spawned)
			var enemy_hp := enemy_hp_for_kind(enemy_kind)
			ghosts.append({"id": spawned, "kind": enemy_kind, "route_id": spawned % 2 if display_level() == 2 else 0, "distance": 0.0, "flee": 0.0, "phase": float(spawned) * 1.7, "hp": enemy_hp, "max_hp": enemy_hp, "speed": enemy_speed_for_kind(enemy_kind), "hit_flash": 0.0})
			spawned += 1
			spawn_clock = float(LEVEL_SPAWN_INTERVAL[current_level - 1])

	for i in range(ghosts.size() - 1, -1, -1):
		var ghost: Dictionary = ghosts[i]
		ghost["hit_flash"] = maxf(0.0, float(ghost["hit_flash"]) - delta)
		if ghost["flee"] > 0.0:
			ghost["flee"] = float(ghost["flee"]) - delta
			ghost["distance"] = maxf(0.0, float(ghost["distance"]) - float(ghost["speed"]) * 2.4 * delta)
			if ghost["flee"] <= 0.0:
				ghosts.remove_at(i)
		else:
			ghost["distance"] = float(ghost["distance"]) + float(ghost["speed"]) * delta
			if ghost["distance"] >= route_length_for(int(ghost.get("route_id", 0))):
				if bool(ghost.get("is_boss", false)):
					ghost["distance"] = maxf(0.0, route_length_for(int(ghost.get("route_id", 0))) - 82.0)
				else:
					ghosts.remove_at(i)
					escaped += 1

	for monster in placed:
		monster["cooldown"] = maxf(0.0, float(monster["cooldown"]) - delta)
		monster["howl_time"] = maxf(0.0, float(monster.get("howl_time", 0.0)) - delta)
		monster["hit_flash"] = maxf(0.0, float(monster.get("hit_flash", 0.0)) - delta)
		var kind: String = str(monster.get("kind", "moss"))
		var monster_pos: Vector2 = active_build_pads()[int(monster["pad"])]
		var nearest: Dictionary = {}
		var nearest_distance := WEREWOLF_RANGE if kind == "werewolf" else (140.0 if kind == "gargoyle" else (125.0 if kind == "bog" else SCARE_RANGE))
		for ghost in ghosts:
			if ghost["flee"] > 0.0:
				continue
			var ghost_pos := point_on_route(float(ghost["distance"]), int(ghost.get("route_id", 0)))
			var distance := monster_pos.distance_to(ghost_pos)
			if distance < nearest_distance:
				nearest_distance = distance
				nearest = ghost
		if not nearest.is_empty():
			var direction: Vector2 = point_on_route(float(nearest["distance"]), int(nearest.get("route_id", 0))) - monster_pos
			if absf(direction.x) > absf(direction.y):
				monster["facing"] = "right" if direction.x > 0.0 else "left"
			else:
				monster["facing"] = "front" if direction.y > 0.0 else "back"
			if monster["cooldown"] <= 0.0:
				if kind == "werewolf":
					howls.append({"origin": werewolf_mouth_position(monster_pos, str(monster["facing"])), "target_id": int(nearest["id"]), "elapsed": 0.0, "damage": int(MONSTER_DAMAGE[kind])})
					monster["howl_time"] = HOWL_DURATION
					monster["cooldown"] = WEREWOLF_COOLDOWN
				else:
					projectiles.append({
						"position": monster_pos + Vector2(0, -29),
						"target_id": int(nearest["id"]),
						"rotation": 0.0,
						"damage": int(MONSTER_DAMAGE[kind]),
						"kind": kind
					})
					monster["cooldown"] = 1.35 if kind == "gargoyle" else (1.2 if kind == "bog" else SCARE_COOLDOWN)

	for i in range(projectiles.size() - 1, -1, -1):
		var projectile: Dictionary = projectiles[i]
		var target := ghost_by_id(int(projectile["target_id"]))
		if target.is_empty() or float(target["flee"]) > 0.0:
			projectiles.remove_at(i)
			continue
		var target_pos := point_on_route(float(target["distance"]), int(target.get("route_id", 0))) + Vector2(0, -19)
		var projectile_pos: Vector2 = projectile["position"]
		projectile["position"] = projectile_pos.move_toward(target_pos, PROJECTILE_SPEED * delta)
		projectile["rotation"] = float(projectile["rotation"]) + PROJECTILE_SPIN * delta
		if (projectile["position"] as Vector2).distance_to(target_pos) < 12.0:
			damage_enemy(target, int(projectile.get("damage", PROJECTILE_DAMAGE)))
			projectiles.remove_at(i)

	for i in range(howls.size() - 1, -1, -1):
		var howl: Dictionary = howls[i]
		var target := ghost_by_id(int(howl["target_id"]))
		if target.is_empty() or float(target["flee"]) > 0.0:
			howls.remove_at(i)
			continue
		howl["elapsed"] = float(howl["elapsed"]) + delta
		if float(howl["elapsed"]) >= HOWL_DURATION:
			damage_enemy(target, int(howl["damage"]))
			howls.remove_at(i)

	if dracula_active:
		var previous_distance := dracula_distance
		dracula_distance += DRACULA_SPEED * delta
		for enemy in ghosts:
			var id := int(enemy["id"])
			if dracula_hit_ids.has(id) or float(enemy["flee"]) > 0.0 or int(enemy.get("route_id", 0)) != dracula_route_id:
				continue
			var enemy_distance := float(enemy["distance"])
			if enemy_distance >= previous_distance - DRACULA_CONTACT_RADIUS and enemy_distance <= dracula_distance + DRACULA_CONTACT_RADIUS:
				dracula_hit_ids[id] = true
				damage_enemy(enemy, DRACULA_DAMAGE)
		if dracula_distance >= route_length_for(dracula_route_id) + 60.0:
			if display_level() == 2 and dracula_route_id == 0:
				dracula_route_id = 1
				dracula_distance = -60.0
			else:
				dracula_active = false
				dracula_hit_ids.clear()

	_advance_frank(delta)
	_advance_gravewrought(delta)

	var mouse_pos := get_global_mouse_position()
	hover_pad = -1
	for i in range(active_build_pads().size()):
		if active_build_pads()[i].distance_to(mouse_pos) <= 24.0:
			hover_pad = i
			break
	queue_redraw()


func _advance_frank(delta: float) -> void:
	if frank_phase == "idle":
		return
	frank_elapsed += delta
	match frank_phase:
		"portal_opening":
			if frank_elapsed >= FRANK_PORTAL_OPEN_TIME:
				frank_phase = "portal_wait"
				frank_elapsed = 0.0
		"portal_wait":
			if frank_elapsed >= FRANK_PORTAL_WAIT_TIME:
				frank_phase = "rise"
				frank_elapsed = 0.0
		"rise":
			if frank_elapsed >= FRANK_RISE_TIME:
				frank_phase = "forward"
				frank_elapsed = 0.0
		"forward":
			if frank_elapsed >= FRANK_WALK_TIME:
				frank_phase = "blast"
				frank_elapsed = 0.0
				frank_blast_targets.clear()
				for enemy in ghosts:
					if float(enemy["flee"]) > 0.0:
						continue
					frank_blast_targets.append(point_on_route(float(enemy["distance"]), int(enemy.get("route_id", 0))) + Vector2(0, -20))
					damage_enemy(enemy, FRANK_DAMAGE)
		"blast":
			if frank_elapsed >= FRANK_BLAST_TIME:
				frank_phase = "backward"
				frank_elapsed = 0.0
				frank_blast_targets.clear()
		"backward":
			if frank_elapsed >= FRANK_WALK_TIME:
				frank_phase = "sink"
				frank_elapsed = 0.0
		"sink":
			if frank_elapsed >= FRANK_SINK_TIME:
				frank_phase = "portal_closing"
				frank_elapsed = 0.0
		"portal_closing":
			if frank_elapsed >= FRANK_PORTAL_CLOSE_TIME:
				frank_phase = "idle"
				frank_elapsed = 0.0


func _advance_gravewrought(delta: float) -> void:
	if not boss_mode or not boss_spawned or boss_defeated:
		return
	var boss := ghost_by_id(10000)
	if boss.is_empty() or float(boss.get("flee", 0.0)) > 0.0:
		return
	if boss_gravewail_elapsed < 0.0:
		boss_attack_cooldown -= delta
		if boss_attack_cooldown <= 0.0:
			boss_gravewail_elapsed = 0.0
			boss_gravewail_hit = false
		return
	boss_gravewail_elapsed += delta
	var hit_time := SOUL_LIGHTNING_HIT_TIME if boss_level == 2 else GRAVEWAIL_HIT_TIME
	var attack_damage := SOUL_LIGHTNING_DAMAGE if boss_level == 2 else GRAVEWAIL_DAMAGE
	if not boss_gravewail_hit and boss_gravewail_elapsed >= hit_time:
		boss_gravewail_hit = true
		var boss_pos := point_on_route(float(boss["distance"]), int(boss.get("route_id", 0)))
		for i in range(placed.size() - 1, -1, -1):
			var monster: Dictionary = placed[i]
			var monster_pos: Vector2 = active_build_pads()[int(monster["pad"])]
			if boss_level == 1 and boss_pos.distance_to(monster_pos) > GRAVEWAIL_RADIUS:
				continue
			var kind := str(monster.get("kind", "moss"))
			var max_hp := int(monster.get("max_hp", MONSTER_HP.get(kind, 180)))
			monster["max_hp"] = max_hp
			monster["hp"] = maxi(0, int(monster.get("hp", max_hp)) - attack_damage)
			monster["hit_flash"] = 0.28
			if int(monster["hp"]) == 0:
				placed.remove_at(i)
	var attack_duration := SOUL_LIGHTNING_DURATION if boss_level == 2 else GRAVEWAIL_DURATION
	if boss_gravewail_elapsed >= attack_duration:
		boss_gravewail_elapsed = -1.0
		boss_attack_cooldown = SOUL_LIGHTNING_COOLDOWN if boss_level == 2 else GRAVEWAIL_COOLDOWN
		boss_gravewail_hit = false


func route_length_for(route_id: int = 0) -> float:
	if display_level() == 2:
		return route_length_2_down if route_id == 1 else route_length_2_up
	return route_length


func point_on_route(distance: float, route_id: int = 0) -> Vector2:
	var route: Array[Vector2] = ROUTE
	if display_level() == 2:
		route = ROUTE_2_DOWN if route_id == 1 else ROUTE_2_UP
	var remaining := distance
	for i in range(route.size() - 1):
		var segment := route[i].distance_to(route[i + 1])
		if remaining <= segment:
			return route[i].lerp(route[i + 1], clampf(remaining / segment, 0.0, 1.0))
		remaining -= segment
	return route[route.size() - 1]


func dracula_direction_at(distance: float, route_id: int = 0) -> String:
	var before := point_on_route(maxf(0.0, distance - 8.0), route_id)
	var after := point_on_route(minf(route_length_for(route_id), distance + 8.0), route_id)
	var movement := after - before
	if absf(movement.x) >= absf(movement.y):
		return "right" if movement.x >= 0.0 else "left"
	return "down" if movement.y >= 0.0 else "up"


func dracula_texture(direction: String, frame: int) -> Texture2D:
	match direction:
		"left": return DRACULA_LEFT_1 if frame == 0 else DRACULA_LEFT_2
		"up": return DRACULA_UP_1 if frame == 0 else DRACULA_UP_2
		"down": return DRACULA_DOWN_1 if frame == 0 else DRACULA_DOWN_2
		_: return DRACULA_RIGHT_1 if frame == 0 else DRACULA_RIGHT_2


func ghost_by_id(id: int) -> Dictionary:
	for ghost in ghosts:
		if int(ghost["id"]) == id:
			return ghost
	return {}


func werewolf_mouth_position(monster_pos: Vector2, facing: String) -> Vector2:
	match facing:
		"right": return monster_pos + Vector2(17, -37)
		"left": return monster_pos + Vector2(-17, -37)
		"back": return monster_pos + Vector2(0, -50)
		_: return monster_pos + Vector2(0, -36)


func advance_after_complete() -> void:
	if display_wave() == WAVES_PER_LEVEL and not boss_mode:
		start_boss_battle()
	elif current_level < LEVEL_COUNT:
		start_level(current_level + 1, true)
	else:
		start_level(1, false)


func monster_index_at_pad(pad_index: int) -> int:
	for i in range(placed.size()):
		if int(placed[i]["pad"]) == pad_index:
			return i
	return -1


func pad_index_at_position(position: Vector2) -> int:
	for i in range(active_build_pads().size()):
		if active_build_pads()[i].distance_to(position) <= 38.0:
			return i
	return -1


func try_place_monster(kind: String) -> bool:
	if selected_pad < 0 or pad_occupied(selected_pad):
		return false
	var cost := int(MONSTER_COST[kind])
	if scare_points < cost:
		return false
	scare_points -= cost
	selected_monster = kind
	placed.append({"pad": selected_pad, "kind": kind, "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": int(MONSTER_HP[kind]), "max_hp": int(MONSTER_HP[kind]), "hit_flash": 0.0})
	selected_pad = -1
	queue_redraw()
	return true


func try_remove_monster(pad_index: int) -> bool:
	var monster_index := monster_index_at_pad(pad_index)
	if monster_index < 0:
		return false
	var kind := str(placed[monster_index].get("kind", "moss"))
	var removal_cost := int(MONSTER_COST[kind]) * 2
	if scare_points < removal_cost:
		return false
	scare_points -= removal_cost
	placed.remove_at(monster_index)
	selected_pad = pad_index
	queue_redraw()
	return true


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if SHOP_MOSS.has_point(event.position):
			try_place_monster("moss")
			return
		if SHOP_BOG.has_point(event.position):
			try_place_monster("bog")
			return
		if SHOP_GARGOYLE.has_point(event.position):
			try_place_monster("gargoyle")
			return
		if SHOP_WEREWOLF.has_point(event.position):
			try_place_monster("werewolf")
			return
		if SHOP_DRACULA.has_point(event.position):
			summon_dracula()
			return
		if SHOP_FRANK.has_point(event.position):
			summon_frank()
			return
		if wave_complete() and Rect2(293, 222, 375, 96).has_point(event.position):
			advance_after_complete()
			return
		var clicked_pad := pad_index_at_position(event.position)
		if clicked_pad >= 0:
			if pad_occupied(clicked_pad):
				try_remove_monster(clicked_pad)
			else:
				selected_pad = clicked_pad
				queue_redraw()
	elif event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_R:
			reset_level()
		elif event.keycode == KEY_N and wave_complete():
			advance_after_complete()
		elif event.keycode >= KEY_1 and event.keycode <= KEY_8:
			start_level(event.keycode - KEY_1 + 1, false)
		elif event.keycode == KEY_Q:
			try_place_monster("moss")
		elif event.keycode == KEY_W:
			try_place_monster("bog")
		elif event.keycode == KEY_G:
			try_place_monster("gargoyle")
		elif event.keycode == KEY_H:
			try_place_monster("werewolf")
		elif event.keycode == KEY_E:
			summon_dracula()
		elif event.keycode == KEY_F:
			summon_frank()
		elif event.keycode == KEY_T:
			scare_points += 500
			queue_redraw()


func pad_occupied(index: int) -> bool:
	for monster in placed:
		if monster["pad"] == index:
			return true
	return false


func _draw() -> void:
	draw_texture_rect(BACKGROUND_2 if display_level() == 2 else BACKGROUND, Rect2(Vector2.ZERO, SIZE), false)
	_draw_moving_clouds()
	if display_level() == 1:
		draw_texture_rect(TOMBSTONE_SCOTT, Rect2(347, 348, 76, 70), false)
		draw_texture_rect(TOMBSTONE_TOM, Rect2(661, 315, 76, 70), false)
		_draw_mausoleum_candle()
	else:
		_draw_mausoleum_orange_glow()
	for i in range(active_build_pads().size()):
		if pad_occupied(i):
			continue
		var point := active_build_pads()[i]
		var active := i == hover_pad or i == selected_pad
		draw_circle(point, 22.0, Color(0.11, 0.78, 0.52, 0.16 if not active else 0.30))
		draw_arc(point, 20.0, 0.0, TAU, 32, Color(0.42, 0.98, 0.71, 0.66 if not active else 1.0), 2.0)
		draw_line(point + Vector2(-5, 0), point + Vector2(5, 0), Color(0.68, 1.0, 0.8, 0.8), 1.5)
		draw_line(point + Vector2(0, -5), point + Vector2(0, 5), Color(0.68, 1.0, 0.8, 0.8), 1.5)

	for ghost in ghosts:
		var pos := point_on_route(float(ghost["distance"]), int(ghost.get("route_id", 0)))
		var bob := sin(time_passed * 5.0 + float(ghost["phase"])) * 2.2
		var fleeing: bool = float(ghost["flee"]) > 0.0
		var tint := Color(0.75, 1.0, 1.0, 0.58) if fleeing else (Color(1.0, 0.65, 0.65) if ghost["hit_flash"] > 0.0 else Color.WHITE)
		var is_boss := bool(ghost.get("is_boss", false))
		var sprite_rect := Rect2(pos + Vector2(-70, -118 + bob), Vector2(140, 140)) if is_boss else Rect2(pos + Vector2(-34, -55 + bob), Vector2(68, 68))
		match int(ghost["kind"]):
			2:
				draw_texture_rect(SPECTRE, sprite_rect, false, tint)
			3:
				var walk_frame := int(floor(time_passed * 5.0 + float(ghost["phase"]))) % 4
				draw_texture_rect_region(DEMON_WALK, sprite_rect, Rect2(walk_frame * 128, 0, 128, 128), tint)
			4:
				draw_texture_rect(BANSHEE, sprite_rect, false, tint)
			5:
				draw_texture_rect(DEMON_DOLL, sprite_rect, false, tint)
			6:
				draw_texture_rect(GHOSTLY_NUN, sprite_rect, false, tint)
			7:
				var boss_texture := GRAVEWROUGHT_GRAVEWAIL if boss_gravewail_elapsed >= 0.0 and not fleeing else GRAVEWROUGHT_IDLE
				draw_texture_rect(boss_texture, sprite_rect, false, tint)
			8:
				var reaper_texture := SOUL_REAPER_ATTACK if boss_gravewail_elapsed >= 0.0 and not fleeing else SOUL_REAPER_IDLE
				draw_texture_rect(reaper_texture, sprite_rect, false, tint)
			_:
				draw_texture_rect(GHOST, sprite_rect, false, tint)
		if not fleeing:
			var health_ratio := float(ghost["hp"]) / float(ghost["max_hp"])
			if is_boss:
				draw_rect(Rect2(pos + Vector2(-51, -130 + bob), Vector2(102, 9)), Color(0.10, 0.04, 0.08, 0.50))
				draw_rect(Rect2(pos + Vector2(-50, -129 + bob), Vector2(100.0 * health_ratio, 7)), Color(0.84, 0.12, 0.28, 0.50))
			else:
				draw_rect(Rect2(pos + Vector2(-17, -65 + bob), Vector2(34, 6)), Color(0.10, 0.11, 0.12, 0.50))
				draw_rect(Rect2(pos + Vector2(-16, -64 + bob), Vector2(32.0 * health_ratio, 4)), Color(0.45, 0.9, 0.53, 0.50))

	for monster in placed:
		var pos: Vector2 = active_build_pads()[int(monster["pad"])]
		var kind: String = str(monster.get("kind", "moss"))
		var texture := werewolf_texture_for_facing(str(monster["facing"]), true) if kind == "werewolf" and float(monster.get("howl_time", 0.0)) > 0.0 else monster_texture_for_facing(kind, str(monster["facing"]))
		var monster_tint := Color(1.0, 0.55, 0.55) if float(monster.get("hit_flash", 0.0)) > 0.0 else Color.WHITE
		draw_texture_rect(texture, Rect2(pos + Vector2(-37, -56), Vector2(74, 74)), false, monster_tint)
		if boss_mode and monster.has("hp"):
			var monster_health := float(monster["hp"]) / float(monster["max_hp"])
			draw_rect(Rect2(pos + Vector2(-19, -66), Vector2(38, 5)), Color(0.08, 0.09, 0.10, 0.50))
			draw_rect(Rect2(pos + Vector2(-18, -65), Vector2(36.0 * monster_health, 3)), Color(0.30, 0.78, 0.92, 0.50))
		if kind != "werewolf" and monster["cooldown"] > (1.13 if kind == "gargoyle" else (0.98 if kind == "bog" else SCARE_COOLDOWN - 0.22)):
			draw_arc(pos, 35.0, 0.0, TAU, 32, Color(0.8, 1.0, 0.48, 0.7), 2.0)

	for howl in howls:
		var target := ghost_by_id(int(howl["target_id"]))
		if target.is_empty():
			continue
		var origin: Vector2 = howl["origin"]
		var destination := point_on_route(float(target["distance"]), int(target.get("route_id", 0))) + Vector2(0, -19)
		var heading := (destination - origin).angle()
		var progress := clampf(float(howl["elapsed"]) / HOWL_DURATION, 0.0, 1.0)
		for ring in range(3):
			var along := progress - float(ring) * 0.16
			if along <= 0.0:
				continue
			var center := origin.lerp(destination, along)
			var radius := 7.0 + along * 10.0
			draw_arc(center, radius, heading - PI * 0.5, heading + PI * 0.5, 18, Color(0.66, 0.83, 1.0, 0.78 * (1.0 - along * 0.35)), 3.0)
			draw_arc(center, radius + 3.0, heading - PI * 0.36, heading + PI * 0.36, 12, Color(0.93, 0.97, 1.0, 0.35 * (1.0 - along * 0.35)), 1.5)

	_draw_gravewrought_shockwaves()

	for projectile in projectiles:
		var projectile_pos: Vector2 = projectile["position"]
		draw_set_transform(projectile_pos, float(projectile["rotation"]))
		var projectile_texture: Texture2D = MOSS_PROJECTILE
		match str(projectile.get("kind", "moss")):
			"bog": projectile_texture = BOG_PROJECTILE
			"gargoyle": projectile_texture = GARGOYLE_PROJECTILE
		draw_texture_rect(projectile_texture, Rect2(-16, -16, 32, 32), false)
		draw_set_transform(Vector2.ZERO)
	if dracula_active:
		var flight_pos := point_on_route(clampf(dracula_distance, 0.0, route_length_for(dracula_route_id)), dracula_route_id)
		flight_pos.y += sin(time_passed * 11.0) * 2.0
		var flight_direction := dracula_direction_at(clampf(dracula_distance, 0.0, route_length_for(dracula_route_id)), dracula_route_id)
		var cape_frame := int(floor(time_passed * 7.0)) % 2
		draw_texture_rect(dracula_texture(flight_direction, cape_frame), Rect2(flight_pos + Vector2(-48, -70), Vector2(96, 96)), false)
	_draw_frank()
	_draw_lightning()

	draw_rect(Rect2(0, 0, 960, 55), Color(0.03, 0.07, 0.12, 0.84))
	var font := ThemeDB.fallback_font
	var boss_name := "SOUL REAPER" if boss_level == 2 else "THE GRAVEWROUGHT"
	var stage_title := "GRAVEYARD  /  LEVEL %d: %s" % [boss_level, boss_name] if boss_mode else "GRAVEYARD  /  LEVEL %d  WAVE %d: %s" % [display_level(), display_wave(), LEVEL_NAMES[current_level - 1]]
	draw_string(font, Vector2(22, 25), stage_title, HORIZONTAL_ALIGNMENT_LEFT, -1, 18, Color(0.94, 0.97, 0.89))
	draw_string(font, Vector2(22, 45), "Click pad, then monster  |  Click placed monster: remove (2x cost)  |  E: Dracula  F: Frank", HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.66, 0.85, 0.73))
	var progress_text := "BOSS" if boss_mode and not boss_defeated else ("DEFEATED" if boss_mode else "Scared: %d / %d" % [scared, level_enemy_count()])
	draw_string(font, Vector2(625, 25), progress_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color(0.99, 0.91, 0.69))
	draw_string(font, Vector2(790, 25), "Points: %d" % scare_points, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color(1.0, 0.88, 0.42))
	draw_string(font, Vector2(790, 45), "Escaped: %d  |  R" % escaped, HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.84, 0.88, 0.91))
	draw_string(font, Vector2(791, 442), "T: +500 TEST PTS", HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.78, 0.86, 1.0))
	draw_rect(Rect2(0, 449, 960, 91), Color(0.03, 0.07, 0.10, 0.94))
	_draw_shop_card(SHOP_MOSS, "moss", MOSS_FRONT, PORTRAIT_MOSS, "MOSS MONSTER", "30 damage", font)
	_draw_shop_card(SHOP_BOG, "bog", BOG_FRONT, PORTRAIT_BOG, "BOG GUARDIAN", "60 damage", font)
	_draw_shop_card(SHOP_GARGOYLE, "gargoyle", GARGOYLE_FRONT, PORTRAIT_GARGOYLE, "GARGOYLE", "90 damage", font)
	_draw_shop_card(SHOP_WEREWOLF, "werewolf", WEREWOLF_FRONT, PORTRAIT_WEREWOLF, "WEREWOLF", "120 howl", font)
	_draw_dracula_card(font)
	_draw_frank_card(font)
	if wave_complete():
		draw_rect(Rect2(293, 222, 375, 96), Color(0.03, 0.07, 0.12, 0.92))
		if boss_mode:
			draw_string(font, Vector2(324, 261), "LEVEL %d COMPLETE" % boss_level, HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(1.0, 0.84, 0.25))
			var next_text := "Click to restart  |  1-8: choose a wave" if boss_level == 2 else "Click here or N: begin Level 2"
			draw_string(font, Vector2(324, 292), next_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
		elif display_wave() == WAVES_PER_LEVEL:
			draw_string(font, Vector2(324, 261), "WAVE %d COMPLETE" % display_wave(), HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click here or N: BOSS BATTLE", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(1.0, 0.58, 0.46))
		elif current_level < LEVEL_COUNT:
			draw_string(font, Vector2(324, 261), "WAVE %d COMPLETE" % display_wave(), HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click here or N: next wave  |  R: replay", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
		else:
			draw_string(font, Vector2(324, 261), "GRAVEYARD CLEARED", HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click to restart  |  1-8: choose a level", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
	_draw_wave_intro()
	_draw_boss_intro()


func _draw_wave_intro() -> void:
	if wave_intro_elapsed >= WAVE_INTRO_DURATION:
		return
	var fade_out := clampf((WAVE_INTRO_DURATION - wave_intro_elapsed) / 0.65, 0.0, 1.0)
	var level_alpha := minf(clampf(wave_intro_elapsed / 0.6, 0.0, 1.0), fade_out)
	var wave_alpha := minf(clampf((wave_intro_elapsed - WAVE_LABEL_DELAY) / 0.6, 0.0, 1.0), fade_out)
	draw_rect(Rect2(0, 55, SIZE.x, 394), Color(0.02, 0.04, 0.10, 0.48 * level_alpha))
	_draw_intro_title("LEVEL %d" % display_level(), 208.0, 86, Color(1.0, 0.84, 0.25), Color(1.0, 0.65, 0.10), level_alpha)
	if wave_alpha > 0.0:
		_draw_intro_title("WAVE %d" % display_wave(), 321.0, 76, Color.WHITE, Color(0.55, 0.72, 1.0), wave_alpha)


func _draw_boss_intro() -> void:
	if not boss_mode or boss_intro_elapsed >= BOSS_INTRO_DURATION:
		return
	var fade_out := clampf((BOSS_INTRO_DURATION - boss_intro_elapsed) / 0.7, 0.0, 1.0)
	var title_alpha := minf(clampf(boss_intro_elapsed / 0.55, 0.0, 1.0), fade_out)
	var name_alpha := minf(clampf((boss_intro_elapsed - 0.8) / 0.55, 0.0, 1.0), fade_out)
	draw_rect(Rect2(0, 55, SIZE.x, 394), Color(0.10, 0.01, 0.05, 0.62 * title_alpha))
	_draw_intro_title("BOSS BATTLE", 230.0, 88, Color(1.0, 0.92, 0.88), Color(1.0, 0.08, 0.18), title_alpha)
	if name_alpha > 0.0:
		var boss_title := "SOUL REAPER" if boss_level == 2 else "THE GRAVEWROUGHT"
		var title_color := Color(1.0, 0.66, 0.20) if boss_level == 2 else Color(0.84, 0.72, 1.0)
		var title_glow := Color(1.0, 0.24, 0.02) if boss_level == 2 else Color(0.54, 0.12, 0.88)
		_draw_intro_title(boss_title, 326.0, 52, title_color, title_glow, name_alpha)


func _draw_gravewrought_shockwaves() -> void:
	if boss_gravewail_elapsed < 0.0:
		return
	if boss_level == 2:
		var lightning_frame := int(floor(boss_gravewail_elapsed * 8.0)) % 4
		var lightning_texture: Texture2D = SOUL_LIGHTNING_1
		match lightning_frame:
			1: lightning_texture = SOUL_LIGHTNING_2
			2: lightning_texture = SOUL_LIGHTNING_3
			3: lightning_texture = SOUL_LIGHTNING_4
		draw_rect(Rect2(0, 55, SIZE.x, 394), Color(1.0, 0.25, 0.02, 0.10))
		draw_texture_rect(lightning_texture, Rect2(Vector2.ZERO, SIZE), false, Color(1.0, 1.0, 1.0, 0.86))
		return
	var boss := ghost_by_id(10000)
	if boss.is_empty() or float(boss.get("flee", 0.0)) > 0.0:
		return
	var origin := point_on_route(float(boss["distance"]), int(boss.get("route_id", 0))) + Vector2(0, -62)
	var progress := clampf(boss_gravewail_elapsed / GRAVEWAIL_DURATION, 0.0, 1.0)
	for ring in range(8):
		var wave := progress * 1.42 - float(ring) * 0.105
		if wave <= 0.0 or wave >= 1.0:
			continue
		var radius := 24.0 + wave * GRAVEWAIL_RADIUS
		var alpha := 0.82 * (1.0 - wave)
		draw_arc(origin, radius, 0.0, TAU, 72, Color(0.75, 0.48, 1.0, alpha), 5.0)
		draw_arc(origin, radius + 6.0, 0.0, TAU, 72, Color(1.0, 0.22, 0.38, alpha * 0.55), 2.5)


func _draw_intro_title(title: String, baseline_y: float, font_size: int, color: Color, glow: Color, alpha: float) -> void:
	var width := FOUL_FIEND.get_string_size(title, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x
	var baseline := Vector2((SIZE.x - width) * 0.5, baseline_y)
	for offset in [Vector2(-8, 0), Vector2(8, 0), Vector2(0, -8), Vector2(0, 8), Vector2(-5, -5), Vector2(5, -5), Vector2(-5, 5), Vector2(5, 5)]:
		draw_string(FOUL_FIEND, baseline + offset, title, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, Color(glow.r, glow.g, glow.b, 0.15 * alpha))
	for offset in [Vector2(-3, 0), Vector2(3, 0), Vector2(0, -3), Vector2(0, 3)]:
		draw_string(FOUL_FIEND, baseline + offset, title, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, Color(glow.r, glow.g, glow.b, 0.32 * alpha))
	draw_string(FOUL_FIEND, baseline, title, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, Color(color.r, color.g, color.b, alpha))


func _draw_mausoleum_candle() -> void:
	var pulse := 0.75 + 0.15 * sin(time_passed * 9.0) + 0.10 * sin(time_passed * 17.3)
	var flame := Vector2(146, 80 + roundf(sin(time_passed * 11.0)))
	draw_circle(flame, 11.0 + 2.0 * pulse, Color(1.0, 0.45, 0.09, 0.10 * pulse))
	draw_circle(flame, 5.0 + pulse, Color(1.0, 0.59, 0.12, 0.20 * pulse))
	draw_colored_polygon(PackedVector2Array([flame + Vector2(-2, 2), flame + Vector2(0, -6 - roundf(pulse * 2.0)), flame + Vector2(2, 2)]), Color(1.0, 0.65, 0.19, 0.85))
	draw_rect(Rect2(flame.x - 1, flame.y - 1, 2, 3), Color(1.0, 0.93, 0.53, 0.95))


func _draw_mausoleum_orange_glow() -> void:
	var pulse := 0.5 + 0.5 * sin(TAU * time_passed / 4.2 - PI * 0.5)
	var center := Vector2(840, 221)
	draw_circle(center, 42.0, Color(1.0, 0.38, 0.05, 0.035 + pulse * 0.045))
	draw_circle(center, 28.0, Color(1.0, 0.46, 0.08, 0.055 + pulse * 0.08))
	draw_circle(center + Vector2(0, 12), 17.0, Color(1.0, 0.57, 0.16, 0.07 + pulse * 0.12))


func _draw_moving_clouds() -> void:
	var drift := fmod(time_passed * 2.5, 112.0)
	for origin in [Vector2(280, 13), Vector2(445, 28), Vector2(720, 12)]:
		var x: float = origin.x + drift
		var y: float = origin.y
		var tint := Color(0.43, 0.53, 0.68, 0.15)
		draw_rect(Rect2(x, y, 51, 4), tint)
		draw_rect(Rect2(x + 8, y - 4, 38, 4), tint)
		draw_rect(Rect2(x + 20, y - 7, 15, 3), tint)
		draw_rect(Rect2(x + 35, y + 4, 32, 3), Color(0.37, 0.47, 0.62, 0.11))


func _draw_lightning() -> void:
	var phase := fmod(time_passed, 17.0)
	var flash := 0.0
	if phase > 10.25 and phase < 10.34:
		flash = 0.24
	elif phase > 10.47 and phase < 10.60:
		flash = 0.40
	if flash <= 0.0:
		return
	draw_rect(Rect2(0, 0, SIZE.x, 449), Color(0.69, 0.78, 1.0, flash * 0.32))
	draw_polyline(PackedVector2Array([Vector2(506, 7), Vector2(499, 19), Vector2(505, 19), Vector2(495, 37), Vector2(500, 37), Vector2(492, 58)]), Color(0.80, 0.87, 1.0, flash * 1.8), 2.0)


func frank_texture(back_view: bool, frame: int) -> Texture2D:
	if back_view:
		match frame:
			1: return FRANK_BACK_RIGHT
			2: return FRANK_BACK_LEFT
			_: return FRANK_BACK
	match frame:
		1: return FRANK_FRONT_RIGHT
		2: return FRANK_FRONT_LEFT
		_: return FRANK_FRONT


func frank_foot_position() -> Vector2:
	match frank_phase:
		"forward": return FRANK_ORIGIN + Vector2(0, FRANK_STEP_DISTANCE * clampf(frank_elapsed / FRANK_WALK_TIME, 0.0, 1.0))
		"blast": return FRANK_ORIGIN + Vector2(0, FRANK_STEP_DISTANCE)
		"backward": return FRANK_ORIGIN + Vector2(0, FRANK_STEP_DISTANCE * (1.0 - clampf(frank_elapsed / FRANK_WALK_TIME, 0.0, 1.0)))
		_: return FRANK_ORIGIN


func frank_portal_frame() -> int:
	match frank_phase:
		"portal_opening": return clampi(int(floor(frank_elapsed / FRANK_PORTAL_OPEN_TIME * 5.0)), 0, 4)
		"portal_closing": return clampi(4 - int(floor(frank_elapsed / FRANK_PORTAL_CLOSE_TIME * 5.0)), 0, 4)
		"idle": return 0
		_: return 4 + int(floor(time_passed * 8.0)) % 2


func frank_lightning_frame() -> int:
	return int(floor(frank_elapsed * 8.0)) % 4


func _draw_frank() -> void:
	if frank_phase == "idle":
		return
	var foot := frank_foot_position()
	var portal_frame := frank_portal_frame()
	draw_texture_rect_region(FRANK_PORTAL_STRIP, Rect2(FRANK_ORIGIN - Vector2(64, 64), Vector2(128, 128)), Rect2(portal_frame * 128, 0, 128, 128))
	if frank_phase == "portal_opening" or frank_phase == "portal_wait" or frank_phase == "portal_closing":
		return
	var back_view := frank_phase == "backward" or frank_phase == "sink"
	var frame := 0
	if frank_phase == "forward" or frank_phase == "backward":
		frame = (int(floor(frank_elapsed * 6.0)) % 4 + 1) % 3
	var texture := frank_texture(back_view, frame)
	var reveal := 1.0
	if frank_phase == "rise":
		reveal = clampf(frank_elapsed / FRANK_RISE_TIME, 0.0, 1.0)
	elif frank_phase == "sink":
		reveal = 1.0 - clampf(frank_elapsed / FRANK_SINK_TIME, 0.0, 1.0)
	if reveal > 0.0:
		var visible_height := 104.0 * reveal
		draw_texture_rect_region(texture, Rect2(foot.x - 52.0, foot.y - visible_height, 104.0, visible_height), Rect2(0, 0, 128, 128.0 * reveal))
	if frank_phase != "blast":
		return
	var lightning_frame := frank_lightning_frame()
	var source_rect := Rect2((lightning_frame % 2) * 960, int(lightning_frame / 2) * 540, 960, 540)
	draw_rect(Rect2(0, 55, SIZE.x, 394), Color(0.36, 0.60, 1.0, 0.10))
	draw_texture_rect_region(FRANK_LIGHTNING_ATLAS, Rect2(Vector2.ZERO, SIZE), source_rect, Color(1.0, 1.0, 1.0, 0.82))


func texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return MOSS_BACK
		"right": return MOSS_RIGHT
		"left": return MOSS_LEFT
		_: return MOSS_FRONT


func bog_texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return BOG_BACK
		"right": return BOG_RIGHT
		"left": return BOG_LEFT
		_: return BOG_FRONT


func gargoyle_texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return GARGOYLE_BACK
		"right": return GARGOYLE_RIGHT
		"left": return GARGOYLE_LEFT
		_: return GARGOYLE_FRONT


func werewolf_texture_for_facing(facing: String, howling: bool = false) -> Texture2D:
	if howling:
		match facing:
			"back": return WEREWOLF_BACK_HOWL
			"right": return WEREWOLF_RIGHT_HOWL
			"left": return WEREWOLF_LEFT_HOWL
			_: return WEREWOLF_FRONT_HOWL
	match facing:
		"back": return WEREWOLF_BACK
		"right": return WEREWOLF_RIGHT
		"left": return WEREWOLF_LEFT
		_: return WEREWOLF_FRONT


func monster_texture_for_facing(kind: String, facing: String) -> Texture2D:
	match kind:
		"bog": return bog_texture_for_facing(facing)
		"gargoyle": return gargoyle_texture_for_facing(facing)
		"werewolf": return werewolf_texture_for_facing(facing)
		_: return texture_for_facing(facing)


func _draw_portrait(rect: Rect2, texture: Texture2D, source: Rect2, tint: Color) -> void:
	var portrait_rect := Rect2(rect.position + Vector2(4, 7), Vector2(48, 50))
	draw_rect(portrait_rect, Color(0.04, 0.06, 0.08, 1.0))
	draw_texture_rect_region(texture, Rect2(portrait_rect.position + Vector2(2, 2), Vector2(44, 46)), source, tint)
	draw_rect(portrait_rect, Color(0.40, 0.51, 0.48), false, 1.0)


func _draw_shop_card(rect: Rect2, kind: String, texture: Texture2D, source: Rect2, title: String, subtitle: String, font: Font) -> void:
	var selected := selected_pad >= 0 and not pad_occupied(selected_pad)
	var affordable := selected_pad >= 0 and not pad_occupied(selected_pad) and scare_points >= int(MONSTER_COST[kind])
	draw_rect(rect, Color(0.13, 0.23, 0.20, 1.0) if selected else Color(0.10, 0.15, 0.17, 1.0))
	draw_rect(rect, Color(0.72, 0.95, 0.59) if selected else Color(0.33, 0.46, 0.40), false, 2.0)
	_draw_portrait(rect, texture, source, Color.WHITE if affordable else Color(0.55, 0.55, 0.55))
	draw_string(font, rect.position + Vector2(57, 23), title, HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color.WHITE if affordable else Color(0.55, 0.59, 0.57))
	draw_string(font, rect.position + Vector2(57, 45), "%d | %s" % [MONSTER_COST[kind], subtitle], HORIZONTAL_ALIGNMENT_LEFT, -1, 9, Color(0.92, 0.86, 0.57) if affordable else Color(0.55, 0.59, 0.57))


func _draw_dracula_card(font: Font) -> void:
	var usable := can_summon_dracula()
	var outline := Color(0.95, 0.45, 0.52) if usable else Color(0.42, 0.29, 0.33)
	draw_rect(SHOP_DRACULA, Color(0.27, 0.10, 0.15) if usable else Color(0.14, 0.10, 0.13))
	draw_rect(SHOP_DRACULA, outline, false, 2.0)
	_draw_portrait(SHOP_DRACULA, DRACULA_DOWN_1, PORTRAIT_DRACULA, Color.WHITE if usable else Color(0.55, 0.55, 0.55))
	draw_string(font, SHOP_DRACULA.position + Vector2(57, 23), "DRACULA", HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color.WHITE if usable else Color(0.63, 0.57, 0.59))
	var status := "FLYING" if dracula_active else "%d | flight" % DRACULA_COST
	draw_string(font, SHOP_DRACULA.position + Vector2(57, 45), status, HORIZONTAL_ALIGNMENT_LEFT, -1, 9, Color(1.0, 0.73, 0.74) if usable else Color(0.63, 0.57, 0.59))


func _draw_frank_card(font: Font) -> void:
	var usable := can_summon_frank()
	var outline := Color(0.52, 0.77, 1.0) if usable else Color(0.30, 0.39, 0.46)
	draw_rect(SHOP_FRANK, Color(0.10, 0.17, 0.25) if usable else Color(0.09, 0.13, 0.17))
	draw_rect(SHOP_FRANK, outline, false, 2.0)
	_draw_portrait(SHOP_FRANK, FRANK_FRONT, PORTRAIT_FRANK, Color.WHITE if usable else Color(0.55, 0.55, 0.55))
	draw_string(font, SHOP_FRANK.position + Vector2(57, 23), "FRANKENSTEIN", HORIZONTAL_ALIGNMENT_LEFT, -1, 10, Color.WHITE if usable else Color(0.63, 0.67, 0.70))
	var status := "ACTIVE" if frank_phase != "idle" else "%d | lightning" % FRANK_COST
	draw_string(font, SHOP_FRANK.position + Vector2(57, 45), status, HORIZONTAL_ALIGNMENT_LEFT, -1, 9, Color(0.71, 0.86, 1.0) if usable else Color(0.63, 0.67, 0.70))
