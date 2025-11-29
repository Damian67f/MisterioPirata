extends Node2D

var Llave:bool = false

func  _ready() -> void:
	$AudioStreamPlayer.play()

func _process(_delta) -> void:
	_VerificarVida()

func _on_camara_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		$Node2D/Camera2D.enabled = true
		
func _VerificarVida():
	if ControlDeJuego._verVida() == 4:
		$Jugador/CanvasLayer/Label.text = "♥♥♥♥"
		
	if ControlDeJuego._verVida() == 3:
		$Jugador/CanvasLayer/Label.text = "♥♥♥"
		
	if ControlDeJuego._verVida() == 2:
		$Jugador/CanvasLayer/Label.text = "♥♥"
		
	if ControlDeJuego._verVida() == 1:
		$Jugador/CanvasLayer/Label.text = "♥"
		
	if ControlDeJuego._verVida() == 0:
		$Jugador/CanvasLayer/Label.text = ""
