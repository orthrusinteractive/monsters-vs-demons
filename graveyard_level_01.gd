extends Node2D

const BACKGROUND: Texture2D = preload("res://assets/backgrounds/graveyard-round-01-960x540.png")
const BACKGROUND_2: Texture2D = preload("res://assets/backgrounds/graveyard-round-02-v2-960x540.png")
const BACKGROUND_3: Texture2D = preload("res://assets/backgrounds/swamp-level-after-mausoleum-v1-960x540.png")
const FOUL_FIEND: Font = preload("res://assets/fonts/Foul Fiend.otf")
const TOMBSTONE_SCOTT: Texture2D = preload("res://assets/sprites/tombstone-scott-128x128.png")
const TOMBSTONE_TOM: Texture2D = preload("res://assets/sprites/tombstone-tom-128x128.png")
const TOMBSTONE_JAY: Texture2D = preload("res://assets/sprites/tombstone-jay-128x128.png")
const TOMBSTONE_FRED: Texture2D = preload("res://assets/sprites/tombstone-fred-128x128.png")
const TOMBSTONE_MIKE: Texture2D = preload("res://assets/sprites/tombstone-mike-128x128.png")
const TOMBSTONE_CHUCK: Texture2D = preload("res://assets/sprites/tombstone-chuck-128x128.png")
const GHOST: Texture2D = preload("res://assets/sprites/bedsheet-ghost-128x128.png")
const SPECTRE: Texture2D = preload("res://assets/sprites/spectre-front-128x128.png")
const BANSHEE: Texture2D = preload("res://assets/sprites/banshee-front-128x128.png")
const DEMON_DOLL: Texture2D = preload("res://assets/sprites/demon-doll-front-128x128.png")
const GHOSTLY_NUN: Texture2D = preload("res://assets/sprites/ghostly-nun-front-128x128.png")
const DEMON_WALK: Texture2D = preload("res://assets/sprites/red-demon-walk-front-4x128.png")
const SKELETON_FRONT: Texture2D = preload("res://assets/sprites/skeleton-front-master.png")
const SKELETON_BACK: Texture2D = preload("res://assets/sprites/skeleton-back-master.png")
const SKELETON_RIGHT: Texture2D = preload("res://assets/sprites/skeleton-right-master.png")
const SKELETON_LEFT: Texture2D = preload("res://assets/sprites/skeleton-left-master.png")
const SKELETON_PROJECTILE: Texture2D = preload("res://assets/sprites/skeleton-bone-projectile-master.png")
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
const KILLIAN_FRONT: Texture2D = preload("res://assets/sprites/clown-killer-front-master.png")
const KILLIAN_BACK: Texture2D = preload("res://assets/sprites/clown-killer-back-master.png")
const KILLIAN_RIGHT: Texture2D = preload("res://assets/sprites/clown-killer-right-master.png")
const KILLIAN_LEFT: Texture2D = preload("res://assets/sprites/clown-killer-left-master.png")
const KILLIAN_MACHETE: Texture2D = preload("res://assets/sprites/clown-killer-machete-projectile-master.png")
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
const MUMMY_FRONT: Texture2D = preload("res://assets/sprites/mummy-front-128x128.png")
const MUMMY_SARCOPHAGUS: Texture2D = preload("res://assets/sprites/mummy-sarcophagus-open-128x128.png")
const MUMMY_BANDAGE: Texture2D = preload("res://assets/sprites/mummy-bandage-projectile-48x48.png")
const GRAVEWROUGHT_IDLE: Texture2D = preload("res://assets/sprites/level-1-fusion-boss-front-master.png")
const GRAVEWROUGHT_GRAVEWAIL: Texture2D = preload("res://assets/sprites/level-1-fusion-boss-gravewail-master.png")
const SOUL_REAPER_IDLE: Texture2D = preload("res://assets/sprites/level-2-grim-reaper-boss-front-master.png")
const SOUL_REAPER_ATTACK: Texture2D = preload("res://assets/sprites/level-2-grim-reaper-boss-lightning-attack-master.png")
const DROWNED_KING_1: Texture2D = preload("res://assets/sprites/drowned-king-front-drip-01-128x128.png")
const DROWNED_KING_PROJECTILE: Texture2D = preload("res://assets/sprites/drowned-king-swamp-projectile-48x48.png")
const SOUL_LIGHTNING_1: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-01-master.png")
const SOUL_LIGHTNING_2: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-02-master.png")
const SOUL_LIGHTNING_3: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-03-master.png")
const SOUL_LIGHTNING_4: Texture2D = preload("res://assets/effects/grim-reaper-orange-lightning-frame-04-master.png")
const SCARE_METER_FRAME: Texture2D = preload("res://assets/ui/scare-meter-three-specials-master.png")
const NIGHTMARE_STRENGTH: Texture2D = preload("res://assets/ui/nightmare-upgrade-monstrous-strength-44x44.png")
const NIGHTMARE_FLESH: Texture2D = preload("res://assets/ui/nightmare-upgrade-undying-flesh-44x44.png")
const NIGHTMARE_FOG: Texture2D = preload("res://assets/ui/nightmare-upgrade-graveyard-fog-44x44.png")
const NIGHTMARE_BLOOD_MOON: Texture2D = preload("res://assets/ui/nightmare-upgrade-blood-moon.png")
const NIGHTMARE_FURY: Texture2D = preload("res://assets/ui/nightmare-upgrade-relentless-fury.png")
const NIGHTMARE_LONG_SHADOW: Texture2D = preload("res://assets/ui/nightmare-upgrade-long-shadow.png")
const NIGHTMARE_SOUL_SIPHON: Texture2D = preload("res://assets/ui/nightmare-upgrade-soul-siphon.png")
const NIGHTMARE_GRAVE_BARGAIN: Texture2D = preload("res://assets/ui/nightmare-upgrade-grave-bargain.png")
const NIGHTMARE_LAST_RITES: Texture2D = preload("res://assets/ui/nightmare-upgrade-last-rites.png")
const PROJECTILE_WHOOSH: AudioStream = preload("res://assets/audio/projectile-whoosh.wav")
const LIGHTNING_STRIKE_SOUND: AudioStream = preload("res://assets/audio/lightning-strike.wav")
const LIGHTNING_STRIKE_CLOSE_SOUND: AudioStream = preload("res://assets/audio/lightning-strike-close.wav")
const GRAVEYARD_AMBIENCE: AudioStream = preload("res://assets/audio/level-1-graveyard-ambience.wav")
const WEREWOLF_GROWL_SOUND: AudioStream = preload("res://assets/audio/werewolf-growl.wav")
const GRAVEWROUGHT_SCREAM_SOUND: AudioStream = preload("res://assets/audio/gravewrought-ghost-scream-trimmed.wav")

const SIZE := Vector2(960, 540)
const LEVEL_COUNT := 12
const WAVES_PER_LEVEL := 4
const WAVE_INTRO_DURATION := 3.5
const WAVE_LABEL_DELAY := 1.1
const LEVEL_NAMES := ["BEDSHEET GHOSTS", "SPECTRES", "RED DEMONS", "BANSHEES", "GHOSTS & SPECTRES", "DEMONS & BANSHEES", "DEMON DOLLS", "GHOSTLY NUNS", "GHOSTS & DOLLS", "SPECTRES & NUNS", "DEMONS & BANSHEES", "SWAMP HORDE"]
const LEVEL_HP := [100, 180, 270, 320, 400, 500]
const LEVEL_SPEED := [42.0, 44.0, 46.0, 48.0, 52.0, 49.0]
const LEVEL_ENEMY_COUNT := [17, 18, 19, 20, 22, 23, 24, 25, 14, 15, 16, 18]
const LEVEL_PATTERNS := [
	[1], [2], [3],
	[4],
	[1, 2],
	[3, 4],
	[5],
	[6],
	[1, 5],
	[2, 6],
	[3, 4],
	[1, 2, 3, 4, 5, 6]
]
const LEVEL_BONUS_HP := [0, 0, 0, 20, 40, 60, 0, 0, 80, 100, 120, 150]
const LEVEL_BONUS_SPEED := [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 12.0, 14.0, 16.0]
const LEVEL_SPAWN_INTERVAL := [2.1, 2.1, 2.1, 1.9, 1.7, 1.5, 1.8, 2.0, 1.7, 1.6, 1.5, 1.35]
const SCARE_RANGE := 105.0
const SCARE_COOLDOWN := 1.5
const PROJECTILE_SPEED := 190.0
const PROJECTILE_SPIN := 11.0
const PROJECTILE_DAMAGE := 30
const STARTING_SCARE_POINTS := 200
const SCARE_REWARD := [20, 35, 50, 65, 80, 100]
const DRACULA_COST := 1000
const DRACULA_DAMAGE := 100
const DRACULA_SPEED := 260.0
const DRACULA_CONTACT_RADIUS := 29.0
const FRANK_COST := 1500
const FRANK_DAMAGE := 200
const MUMMY_COST := 3000
const MUMMY_ORIGIN := Vector2(596, 188)
const MUMMY_SARCOPHAGUS_TIME := 0.8
const MUMMY_RISE_TIME := 0.9
const MUMMY_CAST_TIME := 0.45
const MUMMY_LINGER_TIME := 0.8
const MUMMY_SINK_TIME := 0.9
const MUMMY_CLOSE_TIME := 0.6
const MUMMY_SLOW_DURATION := 10.0
const MUMMY_SPEED_MULTIPLIER := 0.5
const FRANK_ORIGIN := Vector2(459, 160)
const FRANK_STEP_DISTANCE := 56.0
const FRANK_PORTAL_OPEN_TIME := 0.9
const FRANK_PORTAL_WAIT_TIME := 1.0
const FRANK_RISE_TIME := 0.9
const FRANK_WALK_TIME := 1.1
const FRANK_BLAST_TIME := 2.0
const FRANK_SINK_TIME := 0.9
const FRANK_PORTAL_CLOSE_TIME := 0.9
const MONSTER_COST := {"skeleton": 30, "moss": 50, "bog": 110, "gargoyle": 180, "werewolf": 240, "killian": 500}
const MONSTER_DAMAGE := {"skeleton": 15, "moss": 30, "bog": 60, "gargoyle": 90, "werewolf": 120, "killian": 100}
const WEREWOLF_RANGE := 145.0
const WEREWOLF_COOLDOWN := 1.8
const KILLIAN_RANGE := 160.0
const KILLIAN_COOLDOWN := 2.0
const KILLIAN_ENEMY_TARGET_CHANCE := 0.90
const HOWL_DURATION := 0.42
const BOSS_INTRO_DURATION := 3.2
const GRAVEWROUGHT_HP := 3500
const GRAVEWROUGHT_SPEED := 22.0
const GRAVEWROUGHT_REWARD := 500
const GRAVEWAIL_COOLDOWN := 4.5
const GRAVEWAIL_DURATION := 1.25
const GRAVEWAIL_HIT_TIME := 0.62
const GRAVEWAIL_RADIUS := 330.0
const GRAVEWAIL_DAMAGE := 75
const SOUL_REAPER_HP := 4500
const SOUL_REAPER_SPEED := 20.0
const SOUL_REAPER_REWARD := 800
const SOUL_LIGHTNING_COOLDOWN := 5.5
const SOUL_LIGHTNING_DURATION := 2.0
const SOUL_LIGHTNING_HIT_TIME := 0.8
const SOUL_LIGHTNING_DAMAGE := 180
const SOUL_LIGHTNING_RANGE := 300.0
const DROWNED_KING_HP := 5500
const DROWNED_KING_SPEED := 18.0
const DROWNED_KING_REWARD := 1000
const DROWNED_KING_ATTACK_COOLDOWN := 3.0
const DROWNED_KING_ATTACK_RANGE := 300.0
const DROWNED_KING_PROJECTILE_DAMAGE := 120
const NIGHTMARE_STRENGTH_MULTIPLIER := 1.5
const NIGHTMARE_FLESH_MULTIPLIER := 1.5
const NIGHTMARE_FOG_SPEED_MULTIPLIER := 0.65
const NIGHTMARE_BLOOD_MOON_REWARD_MULTIPLIER := 1.5
const NIGHTMARE_FURY_COOLDOWN_MULTIPLIER := 0.75
const NIGHTMARE_LONG_SHADOW_RANGE_MULTIPLIER := 1.3
const NIGHTMARE_SOUL_SIPHON_HEAL_RATIO := 0.10
const NIGHTMARE_GRAVE_BARGAIN_COST_MULTIPLIER := 0.75
const MONSTER_HP := {"skeleton": 140, "moss": 180, "bog": 270, "gargoyle": 380, "werewolf": 320, "killian": 350}
const SHOP_SKELETON := Rect2(10, 467, 65, 65)
const SHOP_MOSS := Rect2(115, 467, 65, 65)
const SHOP_BOG := Rect2(220, 467, 65, 65)
const SHOP_GARGOYLE := Rect2(325, 467, 65, 65)
const SHOP_WEREWOLF := Rect2(430, 467, 65, 65)
const SHOP_KILLIAN := Rect2(535, 467, 65, 65)
const SHOP_DRACULA := Rect2(640, 467, 65, 65)
const SHOP_FRANK := Rect2(745, 467, 65, 65)
const SHOP_MUMMY := Rect2(850, 467, 65, 65)
const MUMMY_METER_BUTTON := Rect2(400, 8, 48, 52)
const NIGHTMARE_STRENGTH_BUTTON := Rect2(398, 75, 44, 44)
const NIGHTMARE_FLESH_BUTTON := Rect2(450, 75, 44, 44)
const NIGHTMARE_FOG_BUTTON := Rect2(502, 75, 44, 44)
const NIGHTMARE_BLOOD_MOON_BUTTON := Rect2(398, 127, 44, 44)
const NIGHTMARE_FURY_BUTTON := Rect2(450, 127, 44, 44)
const NIGHTMARE_LONG_SHADOW_BUTTON := Rect2(502, 127, 44, 44)
const NIGHTMARE_SOUL_SIPHON_BUTTON := Rect2(398, 179, 44, 44)
const NIGHTMARE_GRAVE_BARGAIN_BUTTON := Rect2(450, 179, 44, 44)
const NIGHTMARE_LAST_RITES_BUTTON := Rect2(502, 179, 44, 44)
const PORTRAIT_SKELETON := Rect2(360, 70, 520, 520)
const PORTRAIT_MOSS := Rect2(38, 25, 52, 52)
const PORTRAIT_BOG := Rect2(38, 24, 52, 52)
const PORTRAIT_GARGOYLE := Rect2(38, 24, 52, 52)
const PORTRAIT_WEREWOLF := Rect2(37, 6, 54, 54)
const PORTRAIT_KILLIAN := Rect2(341, 0, 564, 564)
const PORTRAIT_DRACULA := Rect2(43, 53, 44, 44)
const PORTRAIT_FRANK := Rect2(42, 5, 44, 48)
const PORTRAIT_MUMMY := Rect2(12, 0, 104, 104)
const SCARE_METER_MAX := 3000
const SCARE_METER_POINTS_PER_SQUARE := 5
const ESCAPE_METER_PENALTY := 0.25
const SCARE_METER_RECT := Rect2(0, -10, 450, 74)
const SCARE_METER_SOURCE := Rect2(0, 115, 2172, 355)
const SCARE_METER_FILL_RECT := Rect2(29, 32, 397, 18)
const BUILD_PADS: Array[Vector2] = [
	Vector2(141, 226), Vector2(329, 178), Vector2(440, 253), Vector2(615, 321), Vector2(846, 210)
]
const BUILD_PADS_2: Array[Vector2] = [
	Vector2(164, 177), Vector2(332, 102), Vector2(400, 253), Vector2(584, 107),
	Vector2(610, 285), Vector2(344, 427), Vector2(650, 425), Vector2(736, 354)
]
const BUILD_PADS_3: Array[Vector2] = [
	Vector2(253, 189), Vector2(785, 111), Vector2(756, 289),
	Vector2(351, 429), Vector2(781, 441)
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
const ROUTE_3_UP: Array[Vector2] = [
	Vector2(-35, 178), Vector2(145, 198), Vector2(285, 250), Vector2(475, 271),
	Vector2(580, 237), Vector2(690, 176), Vector2(815, 139), Vector2(995, 52)
]
const ROUTE_3_DOWN: Array[Vector2] = [
	Vector2(-35, 178), Vector2(145, 198), Vector2(285, 250), Vector2(475, 271),
	Vector2(590, 308), Vector2(700, 365), Vector2(825, 405), Vector2(995, 474)
]

var ghosts: Array[Dictionary] = []
var placed: Array[Dictionary] = []
var projectiles: Array[Dictionary] = []
var howls: Array[Dictionary] = []
var route_length := 0.0
var route_length_2_up := 0.0
var route_length_2_down := 0.0
var route_length_3_up := 0.0
var route_length_3_down := 0.0
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
var scare_meter_points := 0
var selected_monster := "skeleton"
var dracula_active := false
var dracula_distance := -60.0
var dracula_hit_ids: Dictionary = {}
var dracula_route_id := 0
var frank_phase := "idle"
var frank_elapsed := 0.0
var frank_blast_targets: Array[Vector2] = []
var mummy_phase := "idle"
var mummy_elapsed := 0.0
var nightmare_upgrades: Array[String] = []
var nightmare_used_levels: Dictionary = {}
var last_rites_used_this_wave := false
var projectile_audio: AudioStreamPlayer
var lightning_audio: AudioStreamPlayer
var ambience_audio: AudioStreamPlayer
var werewolf_audio: AudioStreamPlayer
var gravewrought_audio: AudioStreamPlayer
var sky_lightning_timer := 4.0
var sky_lightning_elapsed := -1.0
var sky_lightning_x := 500.0
var boss_mode := false
var boss_spawned := false
var boss_defeated := false
var boss_intro_elapsed := 0.0
var boss_attack_cooldown := GRAVEWAIL_COOLDOWN
var boss_gravewail_elapsed := -1.0
var boss_gravewail_hit := false
var boss_level := 0
var game_lost := false


func _ready() -> void:
	projectile_audio = AudioStreamPlayer.new()
	projectile_audio.stream = PROJECTILE_WHOOSH
	projectile_audio.volume_db = -8.0
	projectile_audio.max_polyphony = 8
	add_child(projectile_audio)
	lightning_audio = AudioStreamPlayer.new()
	lightning_audio.stream = LIGHTNING_STRIKE_SOUND
	lightning_audio.volume_db = -5.0
	add_child(lightning_audio)
	ambience_audio = AudioStreamPlayer.new()
	ambience_audio.stream = GRAVEYARD_AMBIENCE
	ambience_audio.volume_db = -16.0
	ambience_audio.finished.connect(_on_ambience_finished)
	add_child(ambience_audio)
	werewolf_audio = AudioStreamPlayer.new()
	werewolf_audio.stream = WEREWOLF_GROWL_SOUND
	werewolf_audio.volume_db = -6.0
	werewolf_audio.max_polyphony = 4
	add_child(werewolf_audio)
	gravewrought_audio = AudioStreamPlayer.new()
	gravewrought_audio.stream = GRAVEWROUGHT_SCREAM_SOUND
	gravewrought_audio.volume_db = -5.0
	add_child(gravewrought_audio)
	for i in range(ROUTE.size() - 1):
		route_length += ROUTE[i].distance_to(ROUTE[i + 1])
	for i in range(ROUTE_2_UP.size() - 1):
		route_length_2_up += ROUTE_2_UP[i].distance_to(ROUTE_2_UP[i + 1])
	for i in range(ROUTE_2_DOWN.size() - 1):
		route_length_2_down += ROUTE_2_DOWN[i].distance_to(ROUTE_2_DOWN[i + 1])
	for i in range(ROUTE_3_UP.size() - 1):
		route_length_3_up += ROUTE_3_UP[i].distance_to(ROUTE_3_UP[i + 1])
	for i in range(ROUTE_3_DOWN.size() - 1):
		route_length_3_down += ROUTE_3_DOWN[i].distance_to(ROUTE_3_DOWN[i + 1])
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
		scare_meter_points = 0
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
	mummy_phase = "idle"
	mummy_elapsed = 0.0
	boss_mode = false
	boss_spawned = false
	boss_defeated = false
	boss_intro_elapsed = 0.0
	boss_attack_cooldown = GRAVEWAIL_COOLDOWN
	boss_gravewail_elapsed = -1.0
	boss_gravewail_hit = false
	boss_level = 0
	game_lost = false
	last_rites_used_this_wave = false
	if not keep_monsters:
		for kind in ["strength", "flesh", "fog"]:
			nightmare_used_levels.erase(nightmare_usage_key(display_level(), kind))
	selected_pad = -1
	spawn_clock = 0.0
	spawned = 0
	scared = 0
	escaped = 0
	time_passed = 0.0
	sky_lightning_timer = randf_range(4.0, 9.0)
	sky_lightning_elapsed = -1.0
	wave_intro_elapsed = 0.0
	_update_level_ambience()
	queue_redraw()


func display_level() -> int:
	return int((current_level - 1) / WAVES_PER_LEVEL) + 1


func display_wave() -> int:
	return (current_level - 1) % WAVES_PER_LEVEL + 1


func active_build_pads() -> Array[Vector2]:
	return build_pads_for_level(display_level())


func build_pads_for_level(level_number: int) -> Array[Vector2]:
	match level_number:
		2: return BUILD_PADS_2
		3: return BUILD_PADS_3
		_: return BUILD_PADS


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
	var speed := float(LEVEL_SPEED[kind - 1]) + float(LEVEL_BONUS_SPEED[current_level - 1])
	if display_level() == 2:
		speed *= 1.10
	return speed


func wave_complete() -> bool:
	if game_lost:
		return false
	if boss_mode:
		return boss_defeated and ghosts.is_empty() and projectiles.is_empty() and howls.is_empty() and not dracula_active and frank_phase == "idle" and mummy_phase == "idle"
	return spawned >= level_enemy_count() and ghosts.is_empty() and projectiles.is_empty() and howls.is_empty() and not dracula_active and frank_phase == "idle" and mummy_phase == "idle"


func start_boss_battle() -> void:
	ghosts.clear()
	projectiles.clear()
	howls.clear()
	dracula_active = false
	dracula_hit_ids.clear()
	frank_phase = "idle"
	frank_blast_targets.clear()
	mummy_phase = "idle"
	mummy_elapsed = 0.0
	boss_mode = true
	boss_level = display_level()
	boss_spawned = false
	boss_defeated = false
	boss_intro_elapsed = 0.0
	boss_attack_cooldown = boss_attack_interval()
	boss_gravewail_elapsed = -1.0
	boss_gravewail_hit = false
	wave_intro_elapsed = WAVE_INTRO_DURATION
	for monster in placed:
		var kind := str(monster.get("kind", "moss"))
		if not monster.has("max_hp"):
			monster["max_hp"] = monster_max_hp_for(kind)
		if not monster.has("hp"):
			monster["hp"] = int(monster["max_hp"])
		monster["hit_flash"] = 0.0
	queue_redraw()


func can_summon_dracula() -> bool:
	return not game_lost and scare_meter_points >= DRACULA_COST and not dracula_active and frank_phase == "idle" and mummy_phase == "idle" and not wave_complete()


func summon_dracula() -> bool:
	if not can_summon_dracula():
		return false
	scare_meter_points = 0
	dracula_active = true
	dracula_distance = -60.0
	dracula_route_id = 0
	dracula_hit_ids.clear()
	queue_redraw()
	return true


func can_summon_frank() -> bool:
	return not game_lost and scare_meter_points >= FRANK_COST and frank_phase == "idle" and mummy_phase == "idle" and not dracula_active and not wave_complete()


func summon_frank() -> bool:
	if not can_summon_frank():
		return false
	scare_meter_points = 0
	frank_phase = "portal_opening"
	frank_elapsed = 0.0
	frank_blast_targets.clear()
	queue_redraw()
	return true


func can_summon_mummy() -> bool:
	return not game_lost and scare_meter_points >= MUMMY_COST and mummy_phase == "idle" and frank_phase == "idle" and not dracula_active and not wave_complete()


func summon_mummy() -> bool:
	if not can_summon_mummy():
		return false
	scare_meter_points = 0
	mummy_phase = "sarcophagus"
	mummy_elapsed = 0.0
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
			var boss_reward := GRAVEWROUGHT_REWARD
			if boss_level == 2:
				boss_reward = SOUL_REAPER_REWARD
			elif boss_level == 3:
				boss_reward = DROWNED_KING_REWARD
			boss_reward = nightmare_reward(boss_reward)
			scare_points += boss_reward
			scare_meter_points = mini(SCARE_METER_MAX, scare_meter_points + boss_reward)
		else:
			var reward := nightmare_reward(int(SCARE_REWARD[int(enemy["kind"]) - 1]))
			scare_points += reward
			scare_meter_points = mini(SCARE_METER_MAX, scare_meter_points + reward)
		if nightmare_upgrade_active("siphon"):
			for monster in placed:
				var max_hp := int(monster.get("max_hp", 1))
				monster["hp"] = mini(max_hp, int(monster.get("hp", max_hp)) + maxi(1, int(round(max_hp * NIGHTMARE_SOUL_SIPHON_HEAL_RATIO))))


func register_enemy_escape() -> void:
	if nightmare_upgrade_active("rites") and not last_rites_used_this_wave:
		last_rites_used_this_wave = true
		queue_redraw()
		return
	escaped += 1
	var retained_points := float(scare_meter_points) * (1.0 - ESCAPE_METER_PENALTY)
	# Keep the meter aligned to its five-point visual segments.
	scare_meter_points = maxi(0, int(floor(retained_points / float(SCARE_METER_POINTS_PER_SQUARE))) * SCARE_METER_POINTS_PER_SQUARE)
	queue_redraw()


func trigger_boss_escape_loss() -> void:
	game_lost = true
	escaped += 1
	placed.clear()
	ghosts.clear()
	projectiles.clear()
	howls.clear()
	dracula_active = false
	dracula_hit_ids.clear()
	frank_phase = "idle"
	frank_blast_targets.clear()
	mummy_phase = "idle"
	mummy_elapsed = 0.0
	selected_pad = -1
	queue_redraw()


func _process(delta: float) -> void:
	time_passed += delta
	_update_level_ambience()
	if game_lost:
		queue_redraw()
		return
	_advance_sky_lightning(delta)
	wave_intro_elapsed = minf(wave_intro_elapsed + delta, WAVE_INTRO_DURATION)
	if boss_mode:
		boss_intro_elapsed = minf(boss_intro_elapsed + delta, BOSS_INTRO_DURATION)
		if boss_intro_elapsed >= BOSS_INTRO_DURATION and not boss_spawned and not boss_defeated:
			var boss_hp := GRAVEWROUGHT_HP
			var boss_speed := GRAVEWROUGHT_SPEED
			var boss_kind := 7
			if boss_level == 2:
				boss_hp = SOUL_REAPER_HP
				boss_speed = SOUL_REAPER_SPEED
				boss_kind = 8
			elif boss_level == 3:
				boss_hp = DROWNED_KING_HP
				boss_speed = DROWNED_KING_SPEED
				boss_kind = 9
			ghosts.append({"id": 10000, "kind": boss_kind, "is_boss": true, "route_id": 0, "distance": 0.0, "flee": 0.0, "phase": 0.0, "hp": boss_hp, "max_hp": boss_hp, "speed": boss_speed, "hit_flash": 0.0})
			boss_spawned = true
	elif wave_intro_elapsed >= WAVE_INTRO_DURATION and spawned < level_enemy_count():
		spawn_clock -= delta
		if spawn_clock <= 0.0:
			var enemy_kind := enemy_kind_for_spawn(spawned)
			var enemy_hp := enemy_hp_for_kind(enemy_kind)
			ghosts.append({"id": spawned, "kind": enemy_kind, "route_id": spawned % 2 if display_level() >= 2 else 0, "distance": 0.0, "flee": 0.0, "phase": float(spawned) * 1.7, "hp": enemy_hp, "max_hp": enemy_hp, "speed": enemy_speed_for_kind(enemy_kind), "hit_flash": 0.0})
			spawned += 1
			spawn_clock = float(LEVEL_SPAWN_INTERVAL[current_level - 1])

	for i in range(ghosts.size() - 1, -1, -1):
		var ghost: Dictionary = ghosts[i]
		ghost["hit_flash"] = maxf(0.0, float(ghost["hit_flash"]) - delta)
		ghost["slow_timer"] = maxf(0.0, float(ghost.get("slow_timer", 0.0)) - delta)
		if ghost["flee"] > 0.0:
			ghost["flee"] = float(ghost["flee"]) - delta
			ghost["distance"] = maxf(0.0, float(ghost["distance"]) - float(ghost["speed"]) * 2.4 * delta)
			if ghost["flee"] <= 0.0:
				ghosts.remove_at(i)
		else:
			var speed_multiplier := MUMMY_SPEED_MULTIPLIER if float(ghost["slow_timer"]) > 0.0 else 1.0
			if nightmare_upgrade_active("fog"):
				speed_multiplier *= NIGHTMARE_FOG_SPEED_MULTIPLIER
			ghost["distance"] = float(ghost["distance"]) + float(ghost["speed"]) * speed_multiplier * delta
			if ghost["distance"] >= route_length_for(int(ghost.get("route_id", 0))):
				if bool(ghost.get("is_boss", false)):
					trigger_boss_escape_loss()
					return
				else:
					ghosts.remove_at(i)
					register_enemy_escape()

	var attacks_allowed := not encounter_resolved()
	if not attacks_allowed:
		stop_active_attacks()
	for monster in placed:
		monster["cooldown"] = maxf(0.0, float(monster["cooldown"]) - delta)
		monster["howl_time"] = maxf(0.0, float(monster.get("howl_time", 0.0)) - delta)
		monster["hit_flash"] = maxf(0.0, float(monster.get("hit_flash", 0.0)) - delta)
		if not attacks_allowed:
			continue
		var kind: String = str(monster.get("kind", "moss"))
		var monster_pos: Vector2 = active_build_pads()[int(monster["pad"])]
		if kind == "killian":
			var wildcard_targets := killian_target_candidates(monster)
			if monster["cooldown"] <= 0.0 and not wildcard_targets.is_empty():
				var wildcard_target := choose_killian_target(wildcard_targets)
				set_monster_facing(monster, (wildcard_target["position"] as Vector2) - monster_pos)
				throw_projectile({
					"position": monster_pos + Vector2(0, -29),
					"target_type": str(wildcard_target["type"]),
					"target_id": int(wildcard_target.get("id", -1)),
					"target_pad": int(wildcard_target.get("pad", -1)),
					"rotation": 0.0,
					"damage": monster_damage_for(kind),
					"kind": kind
				})
				monster["cooldown"] = nightmare_cooldown(KILLIAN_COOLDOWN)
			continue
		var nearest: Dictionary = {}
		var base_range := WEREWOLF_RANGE if kind == "werewolf" else (140.0 if kind == "gargoyle" else (125.0 if kind == "bog" else SCARE_RANGE))
		var nearest_distance := nightmare_range(base_range)
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
			set_monster_facing(monster, direction)
			if monster["cooldown"] <= 0.0:
				if kind == "werewolf":
					howls.append({"origin": werewolf_mouth_position(monster_pos, str(monster["facing"])), "target_id": int(nearest["id"]), "elapsed": 0.0, "damage": monster_damage_for(kind)})
					if is_instance_valid(werewolf_audio):
						werewolf_audio.pitch_scale = randf_range(0.96, 1.04)
						werewolf_audio.play()
					monster["howl_time"] = HOWL_DURATION
					monster["cooldown"] = nightmare_cooldown(WEREWOLF_COOLDOWN)
				else:
					throw_projectile({
						"position": monster_pos + Vector2(0, -29),
						"target_id": int(nearest["id"]),
						"rotation": 0.0,
						"damage": monster_damage_for(kind),
						"kind": kind
					})
					var base_cooldown := 1.35 if kind == "gargoyle" else (1.2 if kind == "bog" else SCARE_COOLDOWN)
					monster["cooldown"] = nightmare_cooldown(base_cooldown)

	for i in range(projectiles.size() - 1, -1, -1):
		var projectile: Dictionary = projectiles[i]
		var target_type := str(projectile.get("target_type", "enemy"))
		var target: Dictionary = {}
		var target_pos := Vector2.ZERO
		if target_type == "monster":
			var target_pad := int(projectile.get("target_pad", -1))
			var target_index := monster_index_at_pad(target_pad)
			if target_index < 0:
				projectiles.remove_at(i)
				continue
			target = placed[target_index]
			target_pos = active_build_pads()[target_pad] + Vector2(0, -24)
		else:
			target = ghost_by_id(int(projectile["target_id"]))
			if target.is_empty() or float(target["flee"]) > 0.0:
				projectiles.remove_at(i)
				continue
			target_pos = point_on_route(float(target["distance"]), int(target.get("route_id", 0))) + Vector2(0, -19)
		var projectile_pos: Vector2 = projectile["position"]
		projectile["position"] = projectile_pos.move_toward(target_pos, PROJECTILE_SPEED * delta)
		projectile["rotation"] = float(projectile["rotation"]) + PROJECTILE_SPIN * delta
		if (projectile["position"] as Vector2).distance_to(target_pos) < 12.0:
			if target_type == "monster":
				damage_monster_at_pad(int(projectile.get("target_pad", -1)), int(projectile.get("damage", PROJECTILE_DAMAGE)))
			elif str(projectile.get("kind", "")) == "mummy":
				target["slow_timer"] = MUMMY_SLOW_DURATION
			else:
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
				damage_enemy(enemy, nightmare_damage(DRACULA_DAMAGE))
		if dracula_distance >= route_length_for(dracula_route_id) + 60.0:
			if display_level() >= 2 and dracula_route_id == 0:
				dracula_route_id = 1
				dracula_distance = -60.0
			else:
				dracula_active = false
				dracula_hit_ids.clear()

	_advance_frank(delta)
	_advance_mummy(delta)
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
					damage_enemy(enemy, nightmare_damage(FRANK_DAMAGE))
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


func _advance_mummy(delta: float) -> void:
	if mummy_phase == "idle":
		return
	mummy_elapsed += delta
	match mummy_phase:
		"sarcophagus":
			if mummy_elapsed >= MUMMY_SARCOPHAGUS_TIME:
				mummy_phase = "rise"
				mummy_elapsed = 0.0
		"rise":
			if mummy_elapsed >= MUMMY_RISE_TIME:
				mummy_phase = "cast"
				mummy_elapsed = 0.0
				for enemy in ghosts:
					if float(enemy.get("flee", 0.0)) > 0.0:
						continue
					throw_projectile({"position": MUMMY_ORIGIN + Vector2(0, -48), "target_id": int(enemy["id"]), "rotation": randf_range(0.0, TAU), "damage": 0, "kind": "mummy"})
		"cast":
			if mummy_elapsed >= MUMMY_CAST_TIME:
				mummy_phase = "linger"
				mummy_elapsed = 0.0
		"linger":
			if mummy_elapsed >= MUMMY_LINGER_TIME:
				mummy_phase = "sink"
				mummy_elapsed = 0.0
		"sink":
			if mummy_elapsed >= MUMMY_SINK_TIME:
				mummy_phase = "close"
				mummy_elapsed = 0.0
		"close":
			if mummy_elapsed >= MUMMY_CLOSE_TIME:
				mummy_phase = "idle"
				mummy_elapsed = 0.0


func encounter_resolved() -> bool:
	if boss_mode:
		return boss_defeated
	if spawned < level_enemy_count():
		return false
	for enemy in ghosts:
		if float(enemy.get("flee", 0.0)) <= 0.0:
			return false
	return true


func stop_active_attacks() -> void:
	projectiles.clear()
	howls.clear()
	dracula_active = false
	dracula_hit_ids.clear()
	frank_phase = "idle"
	frank_blast_targets.clear()
	mummy_phase = "idle"
	mummy_elapsed = 0.0


func throw_projectile(data: Dictionary) -> void:
	projectiles.append(data)
	if is_instance_valid(projectile_audio):
		projectile_audio.play()


func _update_level_ambience() -> void:
	if not is_instance_valid(ambience_audio):
		return
	var should_play := display_level() == 1 and not game_lost
	if should_play and not ambience_audio.playing:
		ambience_audio.play()
	elif not should_play and ambience_audio.playing:
		ambience_audio.stop()


func _on_ambience_finished() -> void:
	if display_level() == 1 and not game_lost and is_instance_valid(ambience_audio):
		ambience_audio.play()


func _advance_sky_lightning(delta: float) -> void:
	if display_level() != 1:
		sky_lightning_elapsed = -1.0
		return
	if sky_lightning_elapsed >= 0.0:
		sky_lightning_elapsed += delta
		if sky_lightning_elapsed >= 0.65:
			sky_lightning_elapsed = -1.0
			# A minimum gap over 20 seconds caps lightning at three events per minute.
			sky_lightning_timer = randf_range(20.5, 32.0)
		return
	sky_lightning_timer -= delta
	if sky_lightning_timer <= 0.0:
		sky_lightning_x = randf_range(140.0, 825.0)
		sky_lightning_elapsed = 0.0
		if is_instance_valid(lightning_audio):
			lightning_audio.stream = LIGHTNING_STRIKE_SOUND if randi() % 2 == 0 else LIGHTNING_STRIKE_CLOSE_SOUND
			lightning_audio.pitch_scale = randf_range(0.94, 1.06)
			lightning_audio.play()


func nightmare_upgrade_active(kind: String) -> bool:
	return nightmare_upgrades.has(kind)


func nightmare_usage_key(level_number: int, kind: String) -> String:
	return "%d:%s" % [level_number, kind]


func nightmare_damage(base_damage: int) -> int:
	return int(round(float(base_damage) * (NIGHTMARE_STRENGTH_MULTIPLIER if nightmare_upgrade_active("strength") else 1.0)))


func nightmare_reward(base_reward: int) -> int:
	return int(round(float(base_reward) * (NIGHTMARE_BLOOD_MOON_REWARD_MULTIPLIER if nightmare_upgrade_active("blood_moon") else 1.0)))


func nightmare_cooldown(base_cooldown: float) -> float:
	return base_cooldown * (NIGHTMARE_FURY_COOLDOWN_MULTIPLIER if nightmare_upgrade_active("fury") else 1.0)


func nightmare_range(base_range: float) -> float:
	return base_range * (NIGHTMARE_LONG_SHADOW_RANGE_MULTIPLIER if nightmare_upgrade_active("shadow") else 1.0)


func monster_purchase_cost(kind: String) -> int:
	return int(ceil(float(MONSTER_COST[kind]) * (NIGHTMARE_GRAVE_BARGAIN_COST_MULTIPLIER if nightmare_upgrade_active("bargain") else 1.0)))


func monster_damage_for(kind: String) -> int:
	return nightmare_damage(int(MONSTER_DAMAGE.get(kind, PROJECTILE_DAMAGE)))


func monster_max_hp_for(kind: String) -> int:
	var base_hp := int(MONSTER_HP.get(kind, 180))
	return int(round(float(base_hp) * (NIGHTMARE_FLESH_MULTIPLIER if nightmare_upgrade_active("flesh") else 1.0)))


func select_nightmare_upgrade(kind: String) -> bool:
	if nightmare_upgrades.has(kind) or nightmare_upgrades.size() >= 9 or scare_meter_points < SCARE_METER_MAX or not ["strength", "flesh", "fog", "blood_moon", "fury", "shadow", "siphon", "bargain", "rites"].has(kind):
		return false
	nightmare_upgrades.append(kind)
	scare_meter_points = 0
	if kind == "flesh":
		_apply_undying_flesh_to_placed_monsters()
	queue_redraw()
	return true


func activate_nightmare_upgrade(kind: String) -> bool:
	# Nightmare upgrades are passive for the remainder of the run once selected.
	return nightmare_upgrades.has(kind)


func _apply_undying_flesh_to_placed_monsters() -> void:
	for monster in placed:
		var monster_kind := str(monster.get("kind", "moss"))
		var old_max := int(monster.get("max_hp", MONSTER_HP.get(monster_kind, 180)))
		var new_max := int(round(float(MONSTER_HP.get(monster_kind, 180)) * NIGHTMARE_FLESH_MULTIPLIER))
		monster["max_hp"] = new_max
		monster["hp"] = mini(new_max, int(monster.get("hp", old_max)) + new_max - old_max)


func choose_or_activate_nightmare_upgrade(kind: String) -> bool:
	if nightmare_upgrades.has(kind):
		return activate_nightmare_upgrade(kind)
	return select_nightmare_upgrade(kind)


func _advance_gravewrought(delta: float) -> void:
	if not boss_mode or not boss_spawned or boss_defeated:
		return
	var boss := ghost_by_id(10000)
	if boss.is_empty() or float(boss.get("flee", 0.0)) > 0.0:
		return
	if boss_level == 3:
		_advance_drowned_king(delta, boss)
		return
	if boss_gravewail_elapsed < 0.0:
		boss_attack_cooldown -= delta
		if boss_attack_cooldown <= 0.0:
			boss_gravewail_elapsed = 0.0
			boss_gravewail_hit = false
			if boss_level == 1 and is_instance_valid(gravewrought_audio):
				gravewrought_audio.play()
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
			var attack_range := SOUL_LIGHTNING_RANGE if boss_level == 2 else GRAVEWAIL_RADIUS
			if boss_pos.distance_to(monster_pos) > attack_range:
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


func boss_attack_interval() -> float:
	if boss_level == 2:
		return SOUL_LIGHTNING_COOLDOWN
	if boss_level == 3:
		return DROWNED_KING_ATTACK_COOLDOWN
	return GRAVEWAIL_COOLDOWN


func _advance_drowned_king(delta: float, boss: Dictionary) -> void:
	boss_attack_cooldown -= delta
	if boss_attack_cooldown > 0.0:
		return
	boss_attack_cooldown = DROWNED_KING_ATTACK_COOLDOWN
	var boss_pos := point_on_route(float(boss["distance"]), int(boss.get("route_id", 0)))
	var candidate_pads: Array[int] = []
	for monster in placed:
		var pad := int(monster["pad"])
		if boss_pos.distance_to(active_build_pads()[pad]) <= DROWNED_KING_ATTACK_RANGE:
			candidate_pads.append(pad)
	candidate_pads.shuffle()
	var target_count := mini(2, candidate_pads.size())
	for target_index in range(target_count):
		throw_projectile({
			"position": boss_pos + Vector2(0, -58),
			"target_type": "monster",
			"target_pad": candidate_pads[target_index],
			"rotation": randf_range(0.0, TAU),
			"damage": DROWNED_KING_PROJECTILE_DAMAGE,
			"kind": "drowned_king"
		})


func route_length_for(route_id: int = 0) -> float:
	if display_level() == 3:
		return route_length_3_down if route_id == 1 else route_length_3_up
	if display_level() == 2:
		return route_length_2_down if route_id == 1 else route_length_2_up
	return route_length


func point_on_route(distance: float, route_id: int = 0) -> Vector2:
	var route: Array[Vector2] = ROUTE
	if display_level() == 3:
		route = ROUTE_3_DOWN if route_id == 1 else ROUTE_3_UP
	elif display_level() == 2:
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


func set_monster_facing(monster: Dictionary, direction: Vector2) -> void:
	if absf(direction.x) > absf(direction.y):
		monster["facing"] = "right" if direction.x > 0.0 else "left"
	else:
		monster["facing"] = "front" if direction.y > 0.0 else "back"


func killian_target_candidates(killian: Dictionary) -> Array[Dictionary]:
	var candidates: Array[Dictionary] = []
	var killian_pad := int(killian["pad"])
	var killian_pos: Vector2 = active_build_pads()[killian_pad]
	for enemy in ghosts:
		if float(enemy["flee"]) > 0.0:
			continue
		var enemy_pos := point_on_route(float(enemy["distance"]), int(enemy.get("route_id", 0)))
		if killian_pos.distance_to(enemy_pos) <= nightmare_range(KILLIAN_RANGE):
			candidates.append({"type": "enemy", "id": int(enemy["id"]), "position": enemy_pos})
	# Killian only becomes violent when an enemy is close enough to provoke him.
	# Friendly fire is part of that attack roll, never an independent behavior.
	if candidates.is_empty():
		return candidates
	for ally in placed:
		var ally_pad := int(ally["pad"])
		if ally_pad == killian_pad:
			continue
		var ally_pos: Vector2 = active_build_pads()[ally_pad]
		# Account for the visible body radius of placed monsters when measuring
		# Killian's 160-pixel range against their build-pad centers.
		if killian_pos.distance_to(ally_pos) <= nightmare_range(KILLIAN_RANGE) + 20.0:
			candidates.append({"type": "monster", "pad": ally_pad, "position": ally_pos})
	return candidates


func choose_killian_target(candidates: Array[Dictionary]) -> Dictionary:
	var enemy_targets: Array[Dictionary] = []
	var monster_targets: Array[Dictionary] = []
	for candidate in candidates:
		if str(candidate.get("type", "enemy")) == "monster":
			monster_targets.append(candidate)
		else:
			enemy_targets.append(candidate)
	var preferred := enemy_targets if randf() < KILLIAN_ENEMY_TARGET_CHANCE else monster_targets
	var fallback := monster_targets if preferred == enemy_targets else enemy_targets
	var available: Array[Dictionary] = preferred if not preferred.is_empty() else fallback
	if available.is_empty():
		return {}
	return available[randi() % available.size()]


func damage_monster_at_pad(pad_index: int, damage: int) -> void:
	var monster_index := monster_index_at_pad(pad_index)
	if monster_index < 0:
		return
	var monster: Dictionary = placed[monster_index]
	var kind := str(monster.get("kind", "moss"))
	var max_hp := int(monster.get("max_hp", MONSTER_HP.get(kind, 180)))
	monster["max_hp"] = max_hp
	monster["hp"] = maxi(0, int(monster.get("hp", max_hp)) - damage)
	monster["hit_flash"] = 0.28
	if int(monster["hp"]) == 0:
		placed.remove_at(monster_index)


func werewolf_mouth_position(monster_pos: Vector2, facing: String) -> Vector2:
	match facing:
		"right": return monster_pos + Vector2(17, -37)
		"left": return monster_pos + Vector2(-17, -37)
		"back": return monster_pos + Vector2(0, -50)
		_: return monster_pos + Vector2(0, -36)


func advance_after_complete() -> void:
	if display_wave() == WAVES_PER_LEVEL and display_level() <= 3 and not boss_mode:
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
	var cost := monster_purchase_cost(kind)
	if scare_points < cost:
		return false
	scare_points -= cost
	selected_monster = kind
	var max_hp := monster_max_hp_for(kind)
	placed.append({"pad": selected_pad, "kind": kind, "facing": "front", "cooldown": 0.0, "howl_time": 0.0, "hp": max_hp, "max_hp": max_hp, "hit_flash": 0.0})
	selected_pad = -1
	queue_redraw()
	return true


func try_remove_monster(pad_index: int) -> bool:
	var monster_index := monster_index_at_pad(pad_index)
	if monster_index < 0:
		return false
	var kind := str(placed[monster_index].get("kind", "moss"))
	var removal_cost := monster_purchase_cost(kind) * 2
	if scare_points < removal_cost:
		return false
	scare_points -= removal_cost
	placed.remove_at(monster_index)
	selected_pad = pad_index
	queue_redraw()
	return true


func _unhandled_input(event: InputEvent) -> void:
	if game_lost:
		if event is InputEventKey and event.pressed and not event.echo:
			if event.keycode == KEY_R:
				reset_level()
			elif event.keycode >= KEY_1 and event.keycode <= KEY_9:
				start_level(event.keycode - KEY_1 + 1, false)
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if MUMMY_METER_BUTTON.has_point(event.position):
			summon_mummy()
			return
		var clicked_upgrade := nightmare_kind_at_position(event.position)
		if not clicked_upgrade.is_empty():
			choose_or_activate_nightmare_upgrade(clicked_upgrade)
			return
		if SHOP_SKELETON.has_point(event.position):
			try_place_monster("skeleton")
			return
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
		if SHOP_KILLIAN.has_point(event.position):
			try_place_monster("killian")
			return
		if SHOP_DRACULA.has_point(event.position):
			summon_dracula()
			return
		if SHOP_FRANK.has_point(event.position):
			summon_frank()
			return
		if SHOP_MUMMY.has_point(event.position):
			summon_mummy()
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
		elif event.keycode >= KEY_1 and event.keycode <= KEY_9:
			start_level(event.keycode - KEY_1 + 1, false)
		elif event.keycode == KEY_Q:
			try_place_monster("moss")
		elif event.keycode == KEY_A:
			try_place_monster("skeleton")
		elif event.keycode == KEY_W:
			try_place_monster("bog")
		elif event.keycode == KEY_G:
			try_place_monster("gargoyle")
		elif event.keycode == KEY_H:
			try_place_monster("werewolf")
		elif event.keycode == KEY_K:
			try_place_monster("killian")
		elif event.keycode == KEY_E:
			summon_dracula()
		elif event.keycode == KEY_F:
			summon_frank()
		elif event.keycode == KEY_M:
			summon_mummy()
		elif event.keycode == KEY_Z:
			choose_or_activate_nightmare_upgrade("strength")
		elif event.keycode == KEY_X:
			choose_or_activate_nightmare_upgrade("flesh")
		elif event.keycode == KEY_C:
			choose_or_activate_nightmare_upgrade("fog")
		elif event.keycode == KEY_V:
			for kind in nightmare_upgrades:
				activate_nightmare_upgrade(kind)
		elif event.keycode == KEY_T:
			scare_points += 500
			scare_meter_points = mini(SCARE_METER_MAX, scare_meter_points + 500)
			queue_redraw()


func pad_occupied(index: int) -> bool:
	for monster in placed:
		if monster["pad"] == index:
			return true
	return false


func _draw() -> void:
	var level_background := BACKGROUND
	if display_level() == 2:
		level_background = BACKGROUND_2
	elif display_level() == 3:
		level_background = BACKGROUND_3
	draw_texture_rect(level_background, Rect2(Vector2.ZERO, SIZE), false)
	_draw_moving_clouds()
	if display_level() == 1:
		draw_texture_rect(TOMBSTONE_JAY, Rect2(82, 324, 76, 70), false)
		draw_texture_rect(TOMBSTONE_FRED, Rect2(432, 94, 76, 70), false)
		draw_texture_rect(TOMBSTONE_SCOTT, Rect2(347, 348, 76, 70), false)
		draw_texture_rect(TOMBSTONE_TOM, Rect2(661, 315, 76, 70), false)
		draw_texture_rect(TOMBSTONE_MIKE, Rect2(742, 350, 76, 70), false)
		draw_texture_rect(TOMBSTONE_CHUCK, Rect2(820, 122, 76, 70), false)
		_draw_mausoleum_candle()
	elif display_level() == 2:
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
		# Bosses render in a dedicated foreground pass after every battlefield
		# character and effect, so they can never disappear behind another sprite.
		if is_boss:
			continue
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
		if monster.has("hp") and (boss_mode or int(monster["hp"]) < int(monster["max_hp"])):
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
			"skeleton": projectile_texture = SKELETON_PROJECTILE
			"bog": projectile_texture = BOG_PROJECTILE
			"gargoyle": projectile_texture = GARGOYLE_PROJECTILE
			"killian": projectile_texture = KILLIAN_MACHETE
			"drowned_king": projectile_texture = DROWNED_KING_PROJECTILE
			"mummy": projectile_texture = MUMMY_BANDAGE
		var projectile_size := 48.0 if ["drowned_king", "mummy"].has(str(projectile.get("kind", "moss"))) else 32.0
		draw_texture_rect(projectile_texture, Rect2(Vector2.ONE * projectile_size * -0.5, Vector2.ONE * projectile_size), false)
		draw_set_transform(Vector2.ZERO)
	if dracula_active:
		var flight_pos := point_on_route(clampf(dracula_distance, 0.0, route_length_for(dracula_route_id)), dracula_route_id)
		flight_pos.y += sin(time_passed * 11.0) * 2.0
		var flight_direction := dracula_direction_at(clampf(dracula_distance, 0.0, route_length_for(dracula_route_id)), dracula_route_id)
		var cape_frame := int(floor(time_passed * 7.0)) % 2
		draw_texture_rect(dracula_texture(flight_direction, cape_frame), Rect2(flight_pos + Vector2(-48, -70), Vector2(96, 96)), false)
	_draw_frank()
	_draw_mummy()
	_draw_lightning()
	_draw_boss_foreground()

	var font := ThemeDB.fallback_font
	_draw_top_status(font)
	_draw_scare_meter(font)
	_draw_nightmare_upgrades()
	draw_rect(Rect2(0, 449, 960, 91), Color(0.03, 0.07, 0.10, 0.94))
	_draw_shop_card(SHOP_SKELETON, "skeleton", SKELETON_FRONT, PORTRAIT_SKELETON, "SKELETON", "15 damage", font)
	_draw_shop_card(SHOP_MOSS, "moss", MOSS_FRONT, PORTRAIT_MOSS, "MOSS MONSTER", "30 damage", font)
	_draw_shop_card(SHOP_BOG, "bog", BOG_FRONT, PORTRAIT_BOG, "BOG GUARDIAN", "60 damage", font)
	_draw_shop_card(SHOP_GARGOYLE, "gargoyle", GARGOYLE_FRONT, PORTRAIT_GARGOYLE, "GARGOYLE", "90 damage", font)
	_draw_shop_card(SHOP_WEREWOLF, "werewolf", WEREWOLF_FRONT, PORTRAIT_WEREWOLF, "WEREWOLF", "120 howl", font)
	_draw_shop_card(SHOP_KILLIAN, "killian", KILLIAN_FRONT, PORTRAIT_KILLIAN, "KILLIAN CLOWN", "2x100 wild", font)
	_draw_dracula_card(font)
	_draw_frank_card(font)
	_draw_mummy_card(font)
	_draw_hover_tooltips(font)
	if wave_complete():
		draw_rect(Rect2(293, 222, 375, 96), Color(0.03, 0.07, 0.12, 0.92))
		if boss_mode:
			draw_string(font, Vector2(324, 261), "LEVEL %d COMPLETE" % boss_level, HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(1.0, 0.84, 0.25))
			var next_text := "Click here or N: begin Level %d" % (boss_level + 1) if boss_level < 3 else "Click here or N: restart"
			draw_string(font, Vector2(324, 292), next_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
		elif display_wave() == WAVES_PER_LEVEL and display_level() <= 3:
			draw_string(font, Vector2(324, 261), "WAVE %d COMPLETE" % display_wave(), HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click here or N: BOSS BATTLE", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(1.0, 0.58, 0.46))
		elif current_level < LEVEL_COUNT:
			draw_string(font, Vector2(324, 261), "WAVE %d COMPLETE" % display_wave(), HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click here or N: next wave  |  R: replay", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
		else:
			draw_string(font, Vector2(324, 261), "SWAMP CLEARED", HORIZONTAL_ALIGNMENT_LEFT, -1, 25, Color(0.94, 0.97, 0.89))
			draw_string(font, Vector2(324, 292), "Click to restart", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color(0.66, 0.85, 0.73))
	_draw_wave_intro()
	_draw_boss_intro()
	_draw_loss_screen()


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


func _draw_scare_meter(_font: Font) -> void:
	# Layer 1: a dark backing that is exactly the size of the open channel.
	draw_rect(SCARE_METER_FILL_RECT, Color(0.025, 0.008, 0.012, 0.94))
	# Layer 2: keep the bar's top edge fixed and extend its previous height
	# downward by 40%. The frame is drawn last, so both rails stay stationary.
	var maximum_squares := int(SCARE_METER_MAX / SCARE_METER_POINTS_PER_SQUARE)
	var filled_squares := scare_meter_square_count()
	var segment_width := roundf(SCARE_METER_FILL_RECT.size.y * 0.65)
	var bar_height := roundf(segment_width * 1.40)
	var travel_width := SCARE_METER_FILL_RECT.size.x - segment_width
	# A soft pulse behind the filled portion gives the red bar an eerie glow.
	if filled_squares > 0:
		var last_segment_x := SCARE_METER_FILL_RECT.position.x
		if maximum_squares > 1:
			last_segment_x += travel_width * float(filled_squares - 1) / float(maximum_squares - 1)
		var filled_width := last_segment_x - SCARE_METER_FILL_RECT.position.x + segment_width
		var glow_alpha := 0.18 + sin(time_passed * 3.5) * 0.05
		draw_rect(Rect2(SCARE_METER_FILL_RECT.position - Vector2(2, 2), Vector2(filled_width + 4, bar_height + 4)), Color(1.0, 0.02, 0.03, glow_alpha))
	for square_index in range(filled_squares):
		var square_x := SCARE_METER_FILL_RECT.position.x
		if maximum_squares > 1:
			square_x += travel_width * float(square_index) / float(maximum_squares - 1)
		draw_rect(Rect2(Vector2(square_x, SCARE_METER_FILL_RECT.position.y), Vector2(segment_width, bar_height)), Color(0.92, 0.015, 0.025, 1.0))
	# Seal the final segment against the right rail at the exact unlock value.
	if filled_squares >= maximum_squares:
		draw_rect(Rect2(SCARE_METER_FILL_RECT.position, Vector2(SCARE_METER_FILL_RECT.size.x, bar_height)), Color(0.92, 0.015, 0.025, 1.0))
	# Layer 3: transparent-channel frame and portraits always render over the fill.
	draw_texture_rect_region(SCARE_METER_FRAME, SCARE_METER_RECT, SCARE_METER_SOURCE)


func _draw_nightmare_upgrades() -> void:
	if scare_meter_points >= SCARE_METER_MAX and nightmare_upgrades.size() < 9:
		draw_rect(Rect2(386, 61, 172, 174), Color(0.025, 0.018, 0.035, 0.94))
		draw_rect(Rect2(386, 61, 172, 174), Color(0.62, 0.28, 0.78, 0.95), false, 2.0)
	for item in nightmare_upgrade_items():
		var kind: String = item[0]
		var rect: Rect2 = item[1]
		var texture: Texture2D = item[2]
		var unlocked := nightmare_upgrades.has(kind)
		var selectable := scare_meter_points >= SCARE_METER_MAX and not unlocked
		if not unlocked and not selectable:
			continue
		var tint := Color.WHITE
		var outline := Color(0.32, 0.95, 0.70, 1.0) if unlocked else Color(0.72, 0.32, 0.96, 0.95)
		draw_circle(rect.get_center(), 24.0, Color(0.08, 0.02, 0.10, 0.92))
		draw_texture_rect(texture, rect, false, tint)
		draw_arc(rect.get_center(), 23.0, 0.0, TAU, 32, outline, 2.0)
	_draw_nightmare_tooltip()


func nightmare_upgrade_items() -> Array:
	return [
		["strength", NIGHTMARE_STRENGTH_BUTTON, NIGHTMARE_STRENGTH],
		["flesh", NIGHTMARE_FLESH_BUTTON, NIGHTMARE_FLESH],
		["fog", NIGHTMARE_FOG_BUTTON, NIGHTMARE_FOG],
		["blood_moon", NIGHTMARE_BLOOD_MOON_BUTTON, NIGHTMARE_BLOOD_MOON],
		["fury", NIGHTMARE_FURY_BUTTON, NIGHTMARE_FURY],
		["shadow", NIGHTMARE_LONG_SHADOW_BUTTON, NIGHTMARE_LONG_SHADOW],
		["siphon", NIGHTMARE_SOUL_SIPHON_BUTTON, NIGHTMARE_SOUL_SIPHON],
		["bargain", NIGHTMARE_GRAVE_BARGAIN_BUTTON, NIGHTMARE_GRAVE_BARGAIN],
		["rites", NIGHTMARE_LAST_RITES_BUTTON, NIGHTMARE_LAST_RITES]
	]


func nightmare_kind_at_position(position: Vector2) -> String:
	for item in nightmare_upgrade_items():
		var kind: String = item[0]
		var rect: Rect2 = item[1]
		if rect.has_point(position) and (nightmare_upgrades.has(kind) or scare_meter_points >= SCARE_METER_MAX):
			return kind
	return ""


func _draw_nightmare_tooltip() -> void:
	var kind := nightmare_kind_at_position(get_global_mouse_position())
	if kind.is_empty():
		return
	var title := "MONSTROUS STRENGTH"
	var description := "All monsters deal 50% more damage for the rest of the game."
	if kind == "flesh":
		title = "UNDYING FLESH"
		description = "All monsters gain 50% maximum health for the rest of the game."
	elif kind == "fog":
		title = "GRAVEYARD FOG"
		description = "All enemies move 35% slower for the rest of the game."
	elif kind == "blood_moon":
		title = "BLOOD MOON"
		description = "All scare-point rewards increase by 50%."
	elif kind == "fury":
		title = "RELENTLESS FURY"
		description = "All monsters attack 25% faster."
	elif kind == "shadow":
		title = "LONG SHADOW"
		description = "All monsters gain 30% attack range."
	elif kind == "siphon":
		title = "SOUL SIPHON"
		description = "Each scared enemy heals every monster by 10%."
	elif kind == "bargain":
		title = "GRAVE BARGAIN"
		description = "All monster purchase costs are reduced by 25%."
	elif kind == "rites":
		title = "LAST RITES"
		description = "The first enemy escape of each wave is prevented."
	var unlocked := nightmare_upgrades.has(kind)
	var status := "Click to unlock permanently." if not unlocked else "Active for the remainder of the game."
	var panel := Rect2(570, 120, 370, 65)
	draw_rect(panel, Color(0.025, 0.018, 0.035, 0.96))
	draw_rect(panel, Color(0.55, 0.34, 0.72, 0.95), false, 2.0)
	var font := ThemeDB.fallback_font
	draw_string(font, panel.position + Vector2(12, 19), title, HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color(0.92, 0.79, 1.0))
	draw_string(font, panel.position + Vector2(12, 39), description, HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.91, 0.94, 0.90))
	draw_string(font, panel.position + Vector2(12, 56), status, HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.54, 0.88, 0.70))


func _draw_top_status(font: Font) -> void:
	var shown_level := boss_level if boss_mode else display_level()
	var location_names := ["GRAVEYARD", "GRAVEYARD II", "SWAMP"]
	var location_name: String = location_names[clampi(shown_level - 1, 0, location_names.size() - 1)]
	draw_string(font, Vector2(780, 18), "LEVEL %d: %s" % [shown_level, location_name], HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(0.94, 0.97, 0.89))
	draw_string(font, Vector2(780, 35), "SCARE POINTS: %d" % scare_points, HORIZONTAL_ALIGNMENT_LEFT, -1, 12, Color(1.0, 0.88, 0.42))
	var total := 1 if boss_mode else level_enemy_count()
	var green_count := (1 if boss_defeated else 0) if boss_mode else mini(scared, total)
	var red_count := (1 if game_lost else 0) if boss_mode else mini(escaped, total - green_count)
	for enemy_index in range(total):
		var column := enemy_index % 10
		var row := int(enemy_index / 10)
		var color := Color(0.39, 0.42, 0.45, 0.95)
		if enemy_index < green_count:
			color = Color(0.20, 0.84, 0.39, 1.0)
		elif enemy_index < green_count + red_count:
			color = Color(0.88, 0.16, 0.18, 1.0)
		draw_rect(Rect2(780 + column * 14, 42 + row * 11, 10, 8), Color(0.02, 0.03, 0.04, 0.9))
		draw_rect(Rect2(781 + column * 14, 43 + row * 11, 8, 6), color)


func scare_meter_square_count() -> int:
	return clampi(int(scare_meter_points / SCARE_METER_POINTS_PER_SQUARE), 0, int(SCARE_METER_MAX / SCARE_METER_POINTS_PER_SQUARE))


func _draw_boss_intro() -> void:
	if not boss_mode or boss_intro_elapsed >= BOSS_INTRO_DURATION:
		return
	var fade_out := clampf((BOSS_INTRO_DURATION - boss_intro_elapsed) / 0.7, 0.0, 1.0)
	var title_alpha := minf(clampf(boss_intro_elapsed / 0.55, 0.0, 1.0), fade_out)
	var name_alpha := minf(clampf((boss_intro_elapsed - 0.8) / 0.55, 0.0, 1.0), fade_out)
	draw_rect(Rect2(0, 55, SIZE.x, 394), Color(0.10, 0.01, 0.05, 0.62 * title_alpha))
	_draw_intro_title("BOSS BATTLE", 230.0, 88, Color(1.0, 0.92, 0.88), Color(1.0, 0.08, 0.18), title_alpha)
	if name_alpha > 0.0:
		var boss_title := "THE GRAVEWROUGHT"
		var title_color := Color(0.84, 0.72, 1.0)
		var title_glow := Color(0.54, 0.12, 0.88)
		if boss_level == 2:
			boss_title = "SOUL REAPER"
			title_color = Color(1.0, 0.66, 0.20)
			title_glow = Color(1.0, 0.24, 0.02)
		elif boss_level == 3:
			boss_title = "THE SWAMP KING"
			title_color = Color(0.52, 1.0, 0.48)
			title_glow = Color(0.02, 0.55, 0.36)
		_draw_intro_title(boss_title, 326.0, 52, title_color, title_glow, name_alpha)


func _draw_loss_screen() -> void:
	if not game_lost:
		return
	draw_rect(Rect2(Vector2.ZERO, SIZE), Color(0.015, 0.0, 0.01, 0.88))
	_draw_intro_title("YOU LOSE", 230.0, 94, Color(1.0, 0.88, 0.82), Color(1.0, 0.01, 0.04), 1.0)
	_draw_intro_title("THE END", 327.0, 76, Color(0.72, 0.48, 1.0), Color(0.32, 0.04, 0.72), 1.0)
	var restart_text := "PRESS R TO RESTART"
	var restart_width := FOUL_FIEND.get_string_size(restart_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 30).x
	draw_string(FOUL_FIEND, Vector2((SIZE.x - restart_width) * 0.5, 382), restart_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 30, Color(0.88, 0.74, 0.72))


func _draw_gravewrought_shockwaves() -> void:
	if boss_gravewail_elapsed < 0.0:
		return
	if boss_level == 2:
		var boss := ghost_by_id(10000)
		if boss.is_empty() or float(boss.get("flee", 0.0)) > 0.0:
			return
		var boss_pos := point_on_route(float(boss["distance"]), int(boss.get("route_id", 0)))
		var bob := sin(time_passed * 5.0 + float(boss["phase"])) * 2.2
		var left_eye := boss_pos + Vector2(-5.0, -87.0 + bob)
		var right_eye := boss_pos + Vector2(5.0, -87.0 + bob)
		_draw_soul_lightning_from_eyes(left_eye, right_eye, boss_pos)
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


func _draw_soul_lightning_from_eyes(left_eye: Vector2, right_eye: Vector2, boss_pos: Vector2) -> void:
	for target_index in range(placed.size()):
		var monster: Dictionary = placed[target_index]
		var target := active_build_pads()[int(monster["pad"])] + Vector2(0, -24)
		if boss_pos.distance_to(target) > SOUL_LIGHTNING_RANGE:
			continue
		_draw_eye_bolt(left_eye, target, target_index * 2)
		_draw_eye_bolt(right_eye, target, target_index * 2 + 1)


func _draw_eye_bolt(origin: Vector2, destination: Vector2, bolt_seed: int) -> void:
	var points := PackedVector2Array()
	var direction := destination - origin
	var perpendicular := direction.normalized().orthogonal()
	var segment_count := 9
	for segment_index in range(segment_count + 1):
		var progress := float(segment_index) / float(segment_count)
		var point := origin.lerp(destination, progress)
		if segment_index > 0 and segment_index < segment_count:
			var jitter := sin(float(segment_index * 13 + bolt_seed * 19) + time_passed * 24.0) * 7.0
			point += perpendicular * jitter
		points.append(point)
	draw_polyline(points, Color(1.0, 0.18, 0.01, 0.34), 7.0)
	draw_polyline(points, Color(1.0, 0.56, 0.08, 0.96), 3.0)
	draw_polyline(points, Color(1.0, 0.94, 0.62, 1.0), 1.0)


func _draw_boss_foreground() -> void:
	var boss := ghost_by_id(10000)
	if boss.is_empty():
		return
	var pos := point_on_route(float(boss["distance"]), int(boss.get("route_id", 0)))
	var bob := sin(time_passed * 5.0 + float(boss["phase"])) * 2.2
	var fleeing: bool = float(boss["flee"]) > 0.0
	var tint := Color(0.75, 1.0, 1.0, 0.58) if fleeing else (Color(1.0, 0.65, 0.65) if boss["hit_flash"] > 0.0 else Color.WHITE)
	var sprite_rect := Rect2(pos + Vector2(-70, -118 + bob), Vector2(140, 140))
	var boss_texture: Texture2D
	if int(boss["kind"]) == 8:
		boss_texture = SOUL_REAPER_ATTACK if boss_gravewail_elapsed >= 0.0 and not fleeing else SOUL_REAPER_IDLE
	elif int(boss["kind"]) == 9:
		boss_texture = drowned_king_texture()
	else:
		boss_texture = GRAVEWROUGHT_GRAVEWAIL if boss_gravewail_elapsed >= 0.0 and not fleeing else GRAVEWROUGHT_IDLE
	draw_texture_rect(boss_texture, sprite_rect, false, tint)
	if not fleeing:
		var health_ratio := float(boss["hp"]) / float(boss["max_hp"])
		draw_rect(Rect2(pos + Vector2(-51, -130 + bob), Vector2(102, 9)), Color(0.10, 0.04, 0.08, 0.50))
		draw_rect(Rect2(pos + Vector2(-50, -129 + bob), Vector2(100.0 * health_ratio, 7)), Color(0.84, 0.12, 0.28, 0.50))


func drowned_king_texture() -> Texture2D:
	# The Swamp King deliberately uses only his first pose; the previous
	# three-frame cycle created an unwanted dripping animation.
	return DROWNED_KING_1


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
	if display_level() != 1 or sky_lightning_elapsed < 0.0:
		return
	var flash := 0.0
	if sky_lightning_elapsed < 0.10:
		flash = 0.24
	elif sky_lightning_elapsed > 0.22 and sky_lightning_elapsed < 0.38:
		flash = 0.40
	if flash <= 0.0:
		return
	draw_rect(Rect2(0, 0, SIZE.x, 449), Color(0.69, 0.78, 1.0, flash * 0.32))
	var x := sky_lightning_x
	draw_polyline(PackedVector2Array([Vector2(x, 0), Vector2(x - 9, 14), Vector2(x + 2, 21), Vector2(x - 12, 37), Vector2(x - 4, 45), Vector2(x - 17, 68), Vector2(x - 10, 79)]), Color(0.80, 0.87, 1.0, flash * 1.8), 2.0)


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


func _draw_mummy() -> void:
	if mummy_phase == "idle":
		return
	var sarcophagus_rect := Rect2(MUMMY_ORIGIN + Vector2(-54, -72), Vector2(108, 108))
	draw_texture_rect(MUMMY_SARCOPHAGUS, sarcophagus_rect, false)
	if mummy_phase == "sarcophagus" or mummy_phase == "close":
		return
	var reveal := 1.0
	if mummy_phase == "rise":
		reveal = clampf(mummy_elapsed / MUMMY_RISE_TIME, 0.0, 1.0)
	elif mummy_phase == "sink":
		reveal = 1.0 - clampf(mummy_elapsed / MUMMY_SINK_TIME, 0.0, 1.0)
	if reveal <= 0.0:
		return
	var visible_height := 96.0 * reveal
	draw_texture_rect_region(MUMMY_FRONT, Rect2(MUMMY_ORIGIN.x - 48.0, MUMMY_ORIGIN.y - 38.0 - visible_height, 96.0, visible_height), Rect2(0, 0, 128, 128.0 * reveal))


func texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return MOSS_BACK
		"right": return MOSS_RIGHT
		"left": return MOSS_LEFT
		_: return MOSS_FRONT


func skeleton_texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return SKELETON_BACK
		"right": return SKELETON_RIGHT
		"left": return SKELETON_LEFT
		_: return SKELETON_FRONT


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


func killian_texture_for_facing(facing: String) -> Texture2D:
	match facing:
		"back": return KILLIAN_BACK
		"right": return KILLIAN_RIGHT
		"left": return KILLIAN_LEFT
		_: return KILLIAN_FRONT


func monster_texture_for_facing(kind: String, facing: String) -> Texture2D:
	match kind:
		"skeleton": return skeleton_texture_for_facing(facing)
		"bog": return bog_texture_for_facing(facing)
		"gargoyle": return gargoyle_texture_for_facing(facing)
		"werewolf": return werewolf_texture_for_facing(facing)
		"killian": return killian_texture_for_facing(facing)
		_: return texture_for_facing(facing)


func _draw_portrait(rect: Rect2, texture: Texture2D, source: Rect2, tint: Color) -> void:
	var portrait_rect := Rect2(rect.position + Vector2(4, 4), Vector2(57, 57))
	draw_rect(portrait_rect, Color(0.04, 0.06, 0.08, 1.0))
	draw_texture_rect_region(texture, Rect2(portrait_rect.position + Vector2(2, 2), Vector2(53, 53)), source, tint)
	draw_rect(portrait_rect, Color(0.40, 0.51, 0.48), false, 1.0)


func _draw_shop_card(rect: Rect2, kind: String, texture: Texture2D, source: Rect2, _title: String, _subtitle: String, _font: Font) -> void:
	var selected := selected_pad >= 0 and not pad_occupied(selected_pad)
	var affordable := selected_pad >= 0 and not pad_occupied(selected_pad) and scare_points >= monster_purchase_cost(kind)
	draw_rect(rect, Color(0.13, 0.23, 0.20, 1.0) if selected else Color(0.10, 0.15, 0.17, 1.0))
	draw_rect(rect, Color(0.72, 0.95, 0.59) if selected else Color(0.33, 0.46, 0.40), false, 2.0)
	_draw_portrait(rect, texture, source, Color.WHITE if affordable else Color(0.55, 0.55, 0.55))


func monster_tooltip_at_position(position: Vector2) -> Dictionary:
	var regular_monsters := [
		[SHOP_SKELETON, "SKELETON", "skeleton", SCARE_RANGE, SCARE_COOLDOWN, "Throws a spinning bone."],
		[SHOP_MOSS, "MOSS MONSTER", "moss", SCARE_RANGE, SCARE_COOLDOWN, "Throws a seed clump."],
		[SHOP_BOG, "BOG GUARDIAN", "bog", 125.0, 1.2, "Throws a heavy swamp projectile."],
		[SHOP_GARGOYLE, "GARGOYLE", "gargoyle", 140.0, 1.35, "Throws a stone projectile."],
		[SHOP_WEREWOLF, "WEREWOLF", "werewolf", WEREWOLF_RANGE, WEREWOLF_COOLDOWN, "Howl sends damaging shockwaves."],
		[SHOP_KILLIAN, "KILLIAN CLOWN", "killian", KILLIAN_RANGE, KILLIAN_COOLDOWN, "With an enemy nearby, may hit an ally."]
	]
	for item in regular_monsters:
		var rect: Rect2 = item[0]
		if rect.has_point(position):
			var kind: String = item[2]
			return {"rect": rect, "title": item[1], "line1": "%d points  |  %d damage  |  %d health" % [monster_purchase_cost(kind), monster_damage_for(kind), monster_max_hp_for(kind)], "line2": "%d px range  |  %.2f sec attack" % [int(nightmare_range(float(item[3]))), nightmare_cooldown(float(item[4]))], "line3": item[5]}
	if SHOP_DRACULA.has_point(position):
		return {"rect": SHOP_DRACULA, "title": "DRACULA", "line1": "%d meter points  |  %d contact damage" % [DRACULA_COST, DRACULA_DAMAGE], "line2": "One-use special: flies along every route.", "line3": "Damages every enemy he contacts."}
	if SHOP_FRANK.has_point(position):
		return {"rect": SHOP_FRANK, "title": "FRANKENSTEIN", "line1": "%d meter points  |  %d lightning damage" % [FRANK_COST, FRANK_DAMAGE], "line2": "One-use special: damages all enemies.", "line3": "Rises through an electrical portal."}
	if SHOP_MUMMY.has_point(position):
		return {"rect": SHOP_MUMMY, "title": "THE MUMMY", "line1": "%d meter points  |  global slowdown" % MUMMY_COST, "line2": "One-use special: targets every enemy.", "line3": "Bandages halve movement speed for 10 seconds."}
	return {}


func _draw_hover_tooltips(font: Font) -> void:
	var mouse := get_global_mouse_position()
	var monster_info := monster_tooltip_at_position(mouse)
	if not monster_info.is_empty():
		var source_rect: Rect2 = monster_info["rect"]
		var panel_x := clampf(source_rect.get_center().x - 145.0, 8.0, SIZE.x - 298.0)
		var panel := Rect2(panel_x, 370, 290, 76)
		draw_rect(panel, Color(0.025, 0.04, 0.045, 0.97))
		draw_rect(panel, Color(0.42, 0.70, 0.59, 0.96), false, 2.0)
		draw_string(font, panel.position + Vector2(10, 18), str(monster_info["title"]), HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color(0.93, 0.98, 0.91))
		draw_string(font, panel.position + Vector2(10, 36), str(monster_info["line1"]), HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(1.0, 0.86, 0.42))
		draw_string(font, panel.position + Vector2(10, 52), str(monster_info["line2"]), HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.76, 0.88, 0.83))
		draw_string(font, panel.position + Vector2(10, 68), str(monster_info["line3"]), HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.70, 0.78, 0.75))
		return
	if not SCARE_METER_RECT.has_point(mouse):
		return
	var panel := Rect2(18, 62, 270, 48)
	draw_rect(panel, Color(0.025, 0.018, 0.035, 0.97))
	draw_rect(panel, Color(0.68, 0.28, 0.34, 0.96), false, 2.0)
	draw_string(font, panel.position + Vector2(10, 19), "SCARE METER: %d / %d" % [scare_meter_points, SCARE_METER_MAX], HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color(1.0, 0.83, 0.72))
	var meter_help := "Nightmare Upgrade ready—choose a remaining icon." if scare_meter_points >= SCARE_METER_MAX and nightmare_upgrades.size() < 9 else "Fill the meter completely to unlock another upgrade."
	draw_string(font, panel.position + Vector2(10, 38), meter_help, HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color(0.78, 0.82, 0.86))


func _draw_dracula_card(_font: Font) -> void:
	var usable := can_summon_dracula()
	var outline := Color(0.95, 0.45, 0.52) if usable else Color(0.42, 0.29, 0.33)
	draw_rect(SHOP_DRACULA, Color(0.27, 0.10, 0.15) if usable else Color(0.14, 0.10, 0.13))
	draw_rect(SHOP_DRACULA, outline, false, 2.0)
	_draw_portrait(SHOP_DRACULA, DRACULA_DOWN_1, PORTRAIT_DRACULA, Color.WHITE if usable else Color(0.55, 0.55, 0.55))


func _draw_frank_card(_font: Font) -> void:
	var usable := can_summon_frank()
	var outline := Color(0.52, 0.77, 1.0) if usable else Color(0.30, 0.39, 0.46)
	draw_rect(SHOP_FRANK, Color(0.10, 0.17, 0.25) if usable else Color(0.09, 0.13, 0.17))
	draw_rect(SHOP_FRANK, outline, false, 2.0)
	_draw_portrait(SHOP_FRANK, FRANK_FRONT, PORTRAIT_FRANK, Color.WHITE if usable else Color(0.55, 0.55, 0.55))


func _draw_mummy_card(_font: Font) -> void:
	var usable := can_summon_mummy()
	var outline := Color(0.96, 0.78, 0.38) if usable else Color(0.43, 0.38, 0.27)
	draw_rect(SHOP_MUMMY, Color(0.24, 0.18, 0.08) if usable else Color(0.15, 0.13, 0.09))
	draw_rect(SHOP_MUMMY, outline, false, 2.0)
	_draw_portrait(SHOP_MUMMY, MUMMY_FRONT, PORTRAIT_MUMMY, Color.WHITE if usable else Color(0.55, 0.55, 0.55))
