extends CanvasLayer
@export var next_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_end_shader_transition) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _end_shader_transition(dial_param: String):
	if dial_param == "End":
		var tween = create_tween()
		tween.tween_property($Sprite2D.material, "shader_parameter/height", .65, 2)
		await tween.finished
		get_tree().change_scene_to_packed(next_scene);
