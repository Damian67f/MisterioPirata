extends CharacterBody2D

var Vida:int = 4
var Sprite: Vector2
var Gravedad:int = 90
@export var Velocidad:int
var Pantalla
var tiempo
var Daño:bool = true
var Movimiento:bool = true

func _ready() -> void:
	ControlDeJuego._ActualizarVida(Vida)
	# Pantalla = get_viewport_rect().size
	add_to_group("Jugador")

func _physics_process(delta):
	if Movimiento == true:
		_Mover(delta)
	_Atacar1()
	_Atacar2()
	_VerificarVida()
	

func _Mover(Tiempo):
	velocity.y += Gravedad
	Sprite = Vector2.ZERO
	if is_on_floor() and Input.is_action_pressed("Derecha"):
		Sprite.x += 1
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Caminar")
	if is_on_floor() and Input.is_action_pressed("Izquierda"):
		Sprite.x -= 1
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Caminar")
	
	if is_on_floor() and Input.is_action_just_pressed("Salto"):
		$AudioStreamPlayer2D.play()
		velocity.y -= 5 * Velocidad
		
	if not is_on_floor() and Input.is_action_pressed("Derecha"):
		Sprite.x += 1
	if not is_on_floor() and Input.is_action_pressed("Izquierda"):
		Sprite.x -= 1
	
	
	Sprite = Sprite.normalized() * Velocidad
	
	if Sprite.length() > 0:
		$AnimatedSprite2D.play("Caminar")
		position += Sprite * Tiempo
		# position = position.clamp(Vector2.ZERO,Pantalla)
		
	if Sprite.length() == 0 && $AnimatedSprite2D.animation == "Caminar":
		$AnimatedSprite2D.stop()
	
	
		
	move_and_slide()
		
	
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "vacio":
		ControlDeJuego._RestaurarVariables()
		get_tree().call_deferred("reload_current_scene")
		
	
	
	if area.is_in_group("Pinches"):
		if Daño == true:
			Daño = false
			Vida -= 1
			ControlDeJuego._ActualizarVida(Vida)
			modulate = Color.RED
			await (get_tree().create_timer(0.3)).timeout
			modulate = Color.WHITE
			await (get_tree().create_timer(0.1)).timeout
			$AnimationPlayer.play("RecibirDaño")
			await ($AnimationPlayer.animation_finished)
			await  (get_tree().create_timer(1)).timeout
			Daño = true
		





func _PresionarIzquierda() -> void:
	Sprite.x -= 1
	Sprite = Sprite.normalized() * Velocidad
	if Sprite.length() > 0:		
		position += Sprite * tiempo
		position = position.clamp(Vector2.ZERO,Pantalla)
		
func _RecibirAtaque():
	if Daño == true:
			Daño = false
			Vida -= 1
			ControlDeJuego._ActualizarVida(Vida)
			modulate = Color.RED
			await (get_tree().create_timer(0.3)).timeout
			modulate = Color.WHITE
			await (get_tree().create_timer(0.1)).timeout
			$AnimationPlayer.play("RecibirDaño")
			await ($AnimationPlayer.animation_finished)
			await  (get_tree().create_timer(1)).timeout
			Daño = true
			
func _Atacar1():
	if Input.is_action_just_pressed("Usar"):
		if $AnimatedSprite2D.flip_h == true:
			if Input.is_action_just_pressed("Usar"):
				$AnimatedSprite2D.play("Atacar")
				await (get_tree().create_timer(0.1)).timeout
				$Bola.position.x = -18.0
				await (get_tree().create_timer(0.1)).timeout
				$Bola.position.x = 0.0
				$AnimatedSprite2D.animation = "Caminar"
				
func _Atacar2():
	if Input.is_action_just_pressed("Usar"):
		if $AnimatedSprite2D.flip_h == false:
			if Input.is_action_just_pressed("Usar"):
				$AnimatedSprite2D.play("Atacar")
				await (get_tree().create_timer(0.1)).timeout
				$Bola.position.x = 11.0
				await (get_tree().create_timer(0.1)).timeout
				$Bola.position.x = 0.0
				$AnimatedSprite2D.animation = "Caminar"
				
func  _VerificarVida():
	if Vida == 0:
		Movimiento = false
		$AnimatedSprite2D.animation = "Muerto"
		ControlDeJuego._RestaurarVariables()
		await (get_tree().create_timer(2)).timeout
		get_tree().change_scene_to_file("res://Escenas/titulo.tscn")
				

				
	
