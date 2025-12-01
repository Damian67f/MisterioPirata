extends Node2D

func _process(_delta) -> void:
	if ControlDeJuego._VerificarCraneo() == false:
		$StaticBody2D/CollisionShape2D.disabled = false
	
	if ControlDeJuego._VerificarCraneo() == true:
		$StaticBody2D/CollisionShape2D.disabled = true
