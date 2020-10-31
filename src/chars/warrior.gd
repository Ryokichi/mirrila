extends "res://src/chars/character.gd"


func _ready():
	my_class = "Warrior"
	max_health = 120
	current_health = max_health
	set_max_health()
	base_time_basic_attack = 2
	time_basic_attack = base_time_basic_attack
	attack_range_rad = 20
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass


func _on_Animation_animation_finished(anim_name):
	if ('attack_' in anim_name):
		set_state('idle_')
	pass


func animate_hit():
	$Hit.global_position = target_hit_pos
	$Hit.play_animation("warrior_hit")
	pass
