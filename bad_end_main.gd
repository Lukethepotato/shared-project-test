extends Node
var tween;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC); # Replace with function body.
	tween.tween_property($RichTextLabel, "position", Vector2(124,26), 2).from(Vector2(1000,100))
	tween.tween_property($"scene load button", "position", Vector2(413,370), 3).from(Vector2(420, 891))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
