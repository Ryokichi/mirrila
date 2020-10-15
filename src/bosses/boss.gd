extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var gameUI = get_parent().get_node('gameUI/Interface')
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_health(value):
	if (value > self.max_health):
		value = self.max_health
	self.current_health = value
	gameUI.update_boss_helth(value)
	pass
