extends Node2D

const BACKGROUND: Texture2D = preload("res://assets/backgrounds/mausoleum-level-03-v2-960x540.png")
const CANDLES: Array[Vector2] = [
	Vector2(108, 55), Vector2(169, 115), Vector2(330, 116),
	Vector2(218, 220), Vector2(383, 220), Vector2(835, 212),
	Vector2(134, 364), Vector2(354, 375), Vector2(599, 372),
	Vector2(798, 386), Vector2(367, 438), Vector2(911, 440)
]

var elapsed := 0.0


func _process(delta: float) -> void:
	elapsed += delta
	queue_redraw()


func _draw() -> void:
	draw_texture_rect(BACKGROUND, Rect2(0, 0, 960, 540), false)
	for i in range(CANDLES.size()):
		var point := CANDLES[i]
		var flicker := clampf(0.5 + 0.38 * sin(elapsed * 7.3 + i * 2.1) + 0.12 * sin(elapsed * 13.1 + i * 3.7), 0.0, 1.0)
		var sway := roundf(sin(elapsed * 9.1 + i * 1.8))
		draw_circle(point, 7.0 + flicker * 3.0, Color(1.0, 0.38, 0.05, 0.045 + flicker * 0.07))
		draw_circle(point, 2.0 + flicker, Color(1.0, 0.64, 0.16, 0.24 + flicker * 0.38))
		draw_colored_polygon(PackedVector2Array([
			point + Vector2(-1, 1),
			point + Vector2(sway, -3.0 - flicker * 2.0),
			point + Vector2(1, 1)
		]), Color(1.0, 0.84, 0.39, 0.36 + flicker * 0.50))
