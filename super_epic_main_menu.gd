extends Node

var tween;


func _ready() -> void:
	$cars.position = Vector2(-2000,-2000);
	$tittle.position = Vector2(-2000,-2000);
	$subtittle.position = Vector2(-2000,-2000);
	$"cool button".position = Vector2(-2000, -2000);
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
	if event.is_action_pressed("super cool enter"):
		pass


func _process(delta: float) -> void:
	pass
