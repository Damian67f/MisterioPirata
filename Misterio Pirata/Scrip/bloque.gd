extends Node2D

var Numero:int = 0
var Sprite:Vector2
@export var Velocidad:int
var Movimiento:bool = true

func _ready() -> void:
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
	await (get_tree().create_timer(5)).timeout
	$AnimationPlayer.play("Mover")
	await ($AnimationPlayer.animation_finished)
	await (get_tree().create_timer(5)).timeout
	$AnimationPlayer.play_backwards("Mover")
	await ($AnimationPlayer.animation_finished)
	_Mover()
	
	
			
		
	
			
