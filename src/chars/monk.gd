extends "res://src/chars/character.gd"




func _ready():
	base_time_basic_attack = 2
	time_basic_attack = base_time_basic_attack
	attack_range_rad = 20
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass
	

func _process(delta):
	
#	if (time_basic_attack > 0):
#		time_basic_attack -= delta
#	else:
#		time_basic_attack = base_time_basic_attack
#		stateAndOrientation = "attack_right"
#		self.attack_enemy()
	pass


func _on_Animation_animation_finished(anim_name):
	if ('attack_' in anim_name):
		set_state('idle_')
		$Animation.play(self.stateAndOrientation)
	pass

func attack_enemy():
	$Animation.play(self.stateAndOrientation)
	pass

func animate_hit():
	$Hit.play_animation("monk_hit")
	pass
