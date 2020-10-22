extends Node2D


onready var gameUI = get_tree().get_root().get_node('Level/GameUI/Interface')


func _ready():
	pass 


#func _process(delta):
#	pass

func is_boss():
	return true


func update_health(value):
	if (value > self.max_health):
		value = self.max_health
	self.current_health = value
	gameUI.update_boss_helth(value)
	pass
