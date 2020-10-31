extends KinematicBody2D


onready var gameUI = get_tree().get_root().get_node('Level/GameUI/Interface')
var heroes_list = null


func _ready():
	heroes_list = get_owner().get_heroes()
	pass 


func is_boss():
	return true


func take_damage(damage):
	var life = self.current_health - damage
	life = 0 if (life < 0) else life
	self.update_health(life)
	pass


func update_health(value):
	if (value > self.max_health):
		value = self.max_health
	self.current_health = value
	gameUI.update_boss_helth(value)
	pass
