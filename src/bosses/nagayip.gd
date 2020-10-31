extends "res://src/bosses/boss.gd"

onready var max_health = 100000
onready var current_health = max_health
onready var base_time_attack_1  = 5
onready var base_time_attack_2  = 10
onready var base_time_attack_3  = 10
onready var count_time_attack_1 = base_time_attack_1
onready var count_time_attack_2 = base_time_attack_2
onready var count_time_attack_3 = base_time_attack_3


func _ready():
	$Animation.play("idle")
	self.gameUI.set_max_boss_health(self.max_health)
	self.gameUI.update_boss_helth(self.current_health)
	pass


func _physics_process(delta):
	if (count_time_attack_1 > 0):
		count_time_attack_1 -= delta
	else:
		attack_type_1()
		count_time_attack_1 = base_time_attack_1
	pass


func attack_type_1():
	var index = draw_one(heroes_list.size())
	heroes_list[index].take_damage(5)
	
	$Animation.play("attack_1")
	pass


func draw_one(qtd):
	return randi()%qtd
	pass

func _on_Animation_animation_finished(anim_name):
	if ("attack_" in anim_name):
		$Animation.play("idle")
	pass
