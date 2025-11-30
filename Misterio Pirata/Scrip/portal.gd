extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.play("ActivarBandera")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		if ControlDeJuego._VerBandera() == true:
			get_tree().change_scene_to_file("res://Escenas/final.tscn")
