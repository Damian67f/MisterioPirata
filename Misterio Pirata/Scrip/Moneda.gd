extends Node2D

var Numero:int = 0
var Sprite:Vector2
@export var Velocidad:int
var Movimiento:bool = true

func _ready() -> void:	
	_Mover()




			
func _Mover():
		$CharacterBody2d/Animacion.play("Mover")	
		
	
			


func _on_area_2d_body_entered(body: Node2D) -> void:	
	if body.is_in_group("Jugador"):	
		if Movimiento == true:
			Movimiento = false
			$CharacterBody2d/Animacion.visible = false
			$AudioStreamPlayer2D.play()
			ControlDeJuego._AumentarMonedas()
			await (get_tree().create_timer(0.5)).timeout
			Destruir()
		
		
		
		
		
func Destruir():
	queue_free()
