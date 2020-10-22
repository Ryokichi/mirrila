extends Node2D


var boss_pos = null
var speed = 150


func _physics_process(delta):
	if (boss_pos != null):
		translate((boss_pos - global_position).normalized() * delta * speed)
		pass
	pass

func _on_CollArea_body_entered(body):
	set_physics_process(false)
	$AnimationPlayer.play('hit')
	yield($AnimationPlayer, "animation_finished")
	queue_free()
	if (body.is_boss()):
		self.apply_damage(body)
	pass
	
func va_para_inimigo(pos):
	boss_pos = pos
	look_at(pos)
	pass

func apply_damage(boss):
	print ('existe projetil que necessita sobrescrever metodo  aplicar dano')
	pass
