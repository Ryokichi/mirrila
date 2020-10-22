extends Node2D


var time_until_game_begin = 1
var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ParametrosGlobais.game_active = false
	pass


func _physics_process(delta):
	if (!ParametrosGlobais.game_active):
		if (time_until_game_begin > 0):
			time_until_game_begin -= delta
		else:
			ParametrosGlobais.game_active = true
			begin_attack()
	pass

func begin_attack():
	game_started = true
	pass
