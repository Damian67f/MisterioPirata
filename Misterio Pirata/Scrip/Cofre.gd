extends Node2D

var Activado: bool = true

func _Eliminar():
	queue_free()
	
func _process(_delta) -> void:
	for body in $Area2D.get_overlapping_bodies():
		if Activado == true:
			if ControlDeJuego._EstadoLlave() == true:
				if body.is_in_group("Jugador"):
					if Input.is_action_just_pressed("Usar"):
						ControlDeJuego._ActivarBandera()
						ControlDeJuego._DescartarLlave()
						Activado = false
						$Animacion.play("Abrir")
						await ($Animacion.animation_finished)
						body._EquiparEspada()						
						await (get_tree().create_timer(2)).timeout
						$Area2D/CollisionShape2D.disabled = false
						ControlDeJuego._DesactivarCraneo()
						$AudioStreamPlayer2D.play()
	
