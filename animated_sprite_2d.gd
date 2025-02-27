extends AnimatedSprite2D

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start()

func start() -> void:
	position = Vector2(50, 420)
	frame = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	var move_amount = 0
	frame = 0
	if Input.is_action_pressed("ui_right"):
		move_amount += 1
		frame += 1
	position += Vector2(speed*move_amount, 0)
