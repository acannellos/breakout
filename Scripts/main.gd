extends CanvasLayer

var game_state = Enums.GameState.PLAYING

var ball_prefab = preload("res://ball.tscn")
var ball

@export var count: Label
@export var score: Label
@export var lives: Label
@export var player: CharacterBody2D

var paddle_count: int = 0
var score_count: int = 0
var life_count: int = 3

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	ball = ball_prefab.instantiate()
	add_child(ball)
	
	Events.paddled.connect(_on_paddled)
	Events.bricked.connect(_on_bricked)

func _on_paddled():
	paddle_count += 1
	count.text = str(paddle_count)

func _on_bricked():
	score_count += 10
	score.text = str(score_count)

func reset():
	
	paddle_count = 0
	count.text = str(paddle_count)
	
	life_count -= 1
	lives.text = str(life_count)
	
	ball.queue_free()
	await get_tree().create_timer(2.0).timeout
	ball = ball_prefab.instantiate()
	add_child(ball)
	player.reset()

func _unhandled_input(event: InputEvent):

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_ded_body_entered(body):
	reset()
