extends Node2D

# Reference to the bricks scene
const BrickScene = preload("res://brick.tscn")

# Define the start position
var start_position: Vector2 = Vector2(20, 60)  # Adjust the start position as needed

func _ready():
	createBrickRows()

func createBrickRows():
	var spacing = 10
	var num_rows = 4
	var row_width = 100  # Width of the bricks.tscn scene

	var current_x = start_position.x
	var current_y = start_position.y
	while num_rows > 0:
		while (current_x + row_width + spacing + start_position.x) < get_viewport_rect().size.x:
			var brick = BrickScene.instantiate()
			brick.position = Vector2(current_x, current_y)
			add_child(brick)
			current_x += row_width + spacing
		current_x = start_position.x
		current_y += spacing * 4
		num_rows -= 1

