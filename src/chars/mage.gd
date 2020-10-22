extends "res://src/chars/character.gd"

export (PackedScene) var magic_ball

func _ready():
	attack_range_rad = 40
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass


func _process(delta):
	
	pass

func _input(event):
	if (event.is_action_pressed('KEY_F')):
		$Animation.play("attack_up")
	pass

func ataca():
	var projectile = magic_ball.instance()
	projectile.position = self.global_position
	projectile.va_para_inimigo(get_parent().get_node('Boss').global_position)
	get_owner().add_child(projectile)
	pass
