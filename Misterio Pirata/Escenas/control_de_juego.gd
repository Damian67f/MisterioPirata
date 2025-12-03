extends Node

var Llave:bool = false
var Vida:int = 0
var Bandera: bool = false
var Monedas: int = 0
var Craneo:bool = false

func _ready() -> void:
	pass
	
func _ReproducirMusica():
	$AudioStreamPlayer2D.play()
	
func _DetenerMusica():
	$AudioStreamPlayer.stop()
	
func _ObtenerLlave():
	$CanvasLayer.visible = true
	Llave = true
	
func _DescartarLlave():
	$CanvasLayer.visible = false
	
func _EstadoLlave():
	return Llave
	
func _RestaurarVariables():
	Llave = false
	$CanvasLayer.visible = false
	Vida = 0
	Bandera = false
	Monedas = 0
	Craneo = false
	
func _verVida():
	return Vida
	
func _ActualizarVida(dato:int):
	Vida = dato
	
func _VerBandera():	
	return Bandera
	
func _ActivarBandera():
	Bandera = true
	
func _VerificarMonedas():
	return Monedas
	
func _AumentarMonedas():
	Monedas += 1
	
func _VerificarCraneo():
	return Craneo
	
func _ActivarCraneo():
	Craneo = true
	
func _DesactivarCraneo():
	Craneo = false
	
