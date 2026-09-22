extends Node2D

const BACKGROUND: Texture2D = preload("res://assets/backgrounds/graveyard-round-02-v2-960x540.png")
const DOOR_CENTER := Vector2(840, 221)
const PULSE_PERIOD := 4.2

var elapsed := 0.0


func _process(delta: float) -> void:
	elapsed += delta
	queue_redraw()


func pulse_strength() -> float:
	return 0.5 + 0.5 * sin(TAU * elapsed / PULSE_PERIOD - PI * 0.5)


func _draw() -> void:
	draw_texture_rect(BACKGROUND, Rect2(0, 0, 960, 540), false)
	var pulse := pulse_strength()
	# Layered translucent circles let the orange light breathe without obscuring the arch.
	draw_circle(DOOR_CENTER, 42.0, Color(1.0, 0.38, 0.05, 0.035 + pulse * 0.045))
	draw_circle(DOOR_CENTER, 28.0, Color(1.0, 0.46, 0.08, 0.055 + pulse * 0.08))
	draw_circle(DOOR_CENTER + Vector2(0, 12), 17.0, Color(1.0, 0.57, 0.16, 0.07 + pulse * 0.12))
	draw_circle(DOOR_CENTER + Vector2(0, 30), 26.0, Color(1.0, 0.36, 0.06, 0.025 + pulse * 0.05))
