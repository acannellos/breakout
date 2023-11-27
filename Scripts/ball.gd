extends CharacterBody2D

@export var reset_pos1: Vector2 = Vector2(200,300)
@export var reset_pos2: Vector2 = Vector2(600,300)
@export var start_speed: float = 200.0
@export var paddle_angle_factor := 10
var vel := Vector2.ZERO
var direction: int = 0

var max_speed: float = 2000.0

@onready var wall = $sounds/wall
@onready var floor = $sounds/floor

var can_move: bool = true

func _ready():
	
	set_up_direction(Vector2.UP)
	set_direction()


func set_direction():
	direction = randi() % 2
	if direction == 0:
		position = reset_pos1
		vel.x = start_speed
		vel.y = start_speed
	else:
		position = reset_pos2
		vel.x = -start_speed
		vel.y = start_speed

func _physics_process(delta):

	set_velocity(vel)
	move_and_slide()

	if is_on_ceiling() or is_on_floor():
		vel.y = -vel.y
		print("ceiling hit")
		floor.play()

		for slide in get_slide_collision_count():
			var collision = get_slide_collision(slide)
			var collider = collision.get_collider()
			#var groups = collider.get_groups()
			print(collider.is_in_group("Player"))
			if collider.is_in_group("Player"):
#				if abs(vel.x * 1.1) <= max_speed and abs(vel.y * 1.1) <= max_speed:
#					vel *= 1.1
				vel.x = (transform.origin.x - collision.get_collider().position.x) * paddle_angle_factor
			return

	if is_on_wall():
		vel.x = -vel.x
		print("wall hit")
		wall.play()
