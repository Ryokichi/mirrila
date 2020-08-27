extends Node

var solto =  load("res://assets/cursor/cursor_normal.png")
var pressionado = load("res://assets/cursor/cursor_pressionado.png")


func _ready():
#	Input.set_custom_mouse_cursor(solto)
#	Input.set_custom_mouse_cursor(pressionado,Input.CURSOR_CAN_DROP)
#	Input.set_custom_mouse_cursor(pressionado,Input.CURSOR_IBEAM)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	pass
