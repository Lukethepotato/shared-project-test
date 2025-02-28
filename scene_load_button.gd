extends Button
@export_file() var next_scene
var tween;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_pressed() -> void:
	tween = create_tween()
	tween.tween_property($"../CanvasLayer/Sprite2D".material, "shader_parameter/height", .65, 2)
	await tween.finished
	print("work!!!")
	get_tree().change_scene_to_file(next_scene) # Replace with function body.
