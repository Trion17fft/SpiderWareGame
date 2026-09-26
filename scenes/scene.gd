extends Node2D


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	Global.lives = 5
	Global.minigames_done = 0
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func  _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/why_are_you_there.tscn")
	
func _on_shop_pressed() -> void:
	pass
