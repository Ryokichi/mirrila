extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#
#	pass

func _on_btn_new_game_pressed():
	return get_tree().change_scene("res://src/scenes/level_selection.tscn")
	pass


func _on_teste_pressed():
	return get_tree().change_scene("res://src/scenes/levels/level_testes.tscn")
	pass
