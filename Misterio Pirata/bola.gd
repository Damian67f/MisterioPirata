extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var pariente = body.get_parent()
	if pariente.is_in_group("enemigo"):
		print("lo detecta en su area")
		pariente.Destruir()
