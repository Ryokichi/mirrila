extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$delay_antes_intro.start();
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		pass
	pass


func _on_delay_antes_intro_timeout():
	$intro_animation.play("default")
	pass


func _on_intro_animation_animation_finished():
	$delay_apos_intro.start()
	pass # Replace with function body.

func _on_delay_apos_intro_timeout():
	get_tree().change_scene("res://src/scenes/main_menu.tscn")
	pass # Replace with function body.
