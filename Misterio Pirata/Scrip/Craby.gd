extends Node2D

var Numero:int = 0
var Sprite:Vector2
@export var Velocidad:int
var Movimiento:bool = true

func _ready() -> void:
	add_to_group("enemigo")
	print("esta en el grupo: ",is_in_group("enemigo"))
	_Mover()

func _process(_delta) -> void:
	pass

func _Mover0():
	Sprite = Vector2.ZERO
	
	if Numero == 0:
		Numero = 0
		Movimiento = true
	
	if Numero == 100:
		Numero = 100
		Movimiento = false
	
	if Movimiento == true:
		await (get_tree().create_timer(2)).timeout
		if Movimiento == true:			
			Numero += 1
			Sprite.x += 1
			position += Sprite * Velocidad
			
			
		if Movimiento == false:
			await (get_tree().create_timer(2)).timeout
			Numero -= 1
			Sprite.x -= 1
			position += Sprite * Velocidad
			
func _Mover():
	$CharacterBody2d/Animacion.flip_h = true
	await (get_tree().create_timer(3)).timeout
	$CharacterBody2d/Animacion.play("Mover")
	$AnimationPlayer.play("Mover")
	await ($AnimationPlayer.animation_finished)
	$CharacterBody2d/Animacion.pause()
	await (get_tree().create_timer(3)).timeout
	$CharacterBody2d/Animacion.flip_h = false
	$CharacterBody2d/Animacion.play("Mover")
	$AnimationPlayer.play_backwards("Mover")
	await ($AnimationPlayer.animation_finished)
	$CharacterBody2d/Animacion.pause()
	await (get_tree().create_timer(3)).timeout
	_Mover()			
		
	
			


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		body._RecibirAtaque()
		
		
func Destruir():
	queue_free()
