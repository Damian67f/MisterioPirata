extends CanvasLayer


func _on_button_pressed1() -> void:
	get_tree().change_scene_to_file("res://Escenas/IslaGuldan.tscn")


func _on_button_2_pressed2() -> void:
	get_tree().quit()
