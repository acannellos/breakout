extends Node2D

@export var line_color: Color = Color(1, 1, 1)
@export var line_length: int = 4
@export var line_spacing: int = 10
@export var y_position: int = 0

func _draw():
	var current_x = 0
	while current_x < get_viewport_rect().size.x:
		draw_line(Vector2(current_x, y_position), Vector2(current_x + line_length, y_position), line_color, 1)
		current_x += line_spacing
