extends CanvasLayer

var game_state = Enums.GameState.PLAYING

var ball_prefab = preload("res://ball.tscn")
var ball

@export var player: CharacterBody2D

var left_score: int = 0
var right_score: int = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	ball = ball_prefab.instantiate()
	add_child(ball)

func _process(delta):
	pass

func reset():
	ball.queue_free()
	await get_tree().create_timer(2.0).timeout
	ball = ball_prefab.instantiate()
	add_child(ball)

func _unhandled_input(event: InputEvent):

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_ded_body_entered(body):
	player.reset()
	reset()
