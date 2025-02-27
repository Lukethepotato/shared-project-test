extends Button
@export var next_scene : PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func go_to_next_scene():
	get_tree().change_scene_to_packed(next_scene);


func _on_pressed() -> void:
	go_to_next_scene() # Replace with function body.
