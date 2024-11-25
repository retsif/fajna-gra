extends Node



func _on_button_pressed():
	get_tree().change_scene_to_file("res://sceny/poziom1.tscn")
	
	


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://sceny/poziom2.tscn")


func _on_quit_button_down():
	get_tree().quit()
