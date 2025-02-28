extends Node

@export var button : PackedScene;
@export_file() var next_scene
var tween;
var save_files_onscreen := false;

func _ready() -> void:
	$cars.position = Vector2(-2000,-2000);
	$tittle.position = Vector2(-2000,-2000);
	$subtittle.position = Vector2(-2000,-2000);
	$"cool button".position = Vector2(-2000, -2000);
	$"save_files lmao".position = Vector2(-2000, -2000);
	$cars.play("default");
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC);
	tween.tween_property($tittle, "position", Vector2(0,15),5).from(Vector2(1500, 900));
	await tween.finished;
	tween.kill();
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO);
	tween.tween_property($cars, "position", Vector2(807,257),3).from(Vector2(-1000,-1000));
	await tween.finished;
	tween.kill();
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE);
	tween.tween_property($subtittle, "position", Vector2(0,580),4).from(Vector2(0,-200));
	await tween.finished;
	tween.kill();
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE);
	tween.tween_property($"cool button", "position", Vector2(174,312),2).from(Vector2(0,-200));

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("super cool enter") and tween:
		tween.custom_step(200);

func _process(delta: float) -> void:
	if save_files_onscreen and Input.is_action_pressed("scroll_up") and $"save_files lmao".position.y < 0:
		$"save_files lmao".position.y += 2;
	elif save_files_onscreen and Input.is_action_pressed("scroll_down") and $"save_files lmao".position.y > -(218 + $"save_files lmao".get_child_count() * 200):
		$"save_files lmao".position.y -= 2;

func _on_cool_button_pressed() -> void:
	populate_save_file_buttons(randi_range(100,200));
	if tween:
		tween.kill();
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO);
	tween.tween_property($"cool button", "position", Vector2(-1000, 0),1);
	await tween.finished;
	tween.kill();
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC);
	tween.tween_property($"save_files lmao", "position", Vector2(0, 0),4).from(Vector2(-1000,0));
	await tween.finished;
	tween.kill();
	save_files_onscreen = true;

func populate_save_file_buttons(count := 1):
	for i in range(count):
		var new_button = button.instantiate();
		new_button.change_text("file "+str(i+1));
		new_button.global_position = Vector2(174, 218 + 180*i);
		$"save_files lmao".add_child(new_button)
		new_button.connect("pressed", go_to_next_scene);

func go_to_next_scene():
	get_tree().change_scene_to_file(next_scene)
