extends Area2D

var Nombre:String = "Pinches"

func _VerNombre():
	return Nombre
	
func _ready() -> void:
	add_to_group("Pinches")
