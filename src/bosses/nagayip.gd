extends "res://src/bosses/boss.gd"

var max_health = 100000
var current_health = max_health

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("idle")
	self.gameUI.set_max_boss_health(self.max_health)
	self.gameUI.update_boss_helth(self.current_health)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func take_damage(damage):
	var life = self.current_health - damage
	life = 0 if (life < 0) else life
	self.update_health(life)
	pass
