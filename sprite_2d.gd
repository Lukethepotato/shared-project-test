extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start() -> void:
	position = Vector2(1060, 440)


func _on_goop_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
