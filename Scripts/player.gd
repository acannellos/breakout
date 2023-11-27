extends CharacterBody2D

@export var speed: float = 600.0
@export var reset_pos: Vector2 = Vector2(400,560)

func _ready():
	reset()

func reset():
	position = reset_pos

func _physics_process(delta):

	velocity.x = Input.get_axis("left", "right") * speed
	move_and_slide()
