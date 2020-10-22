extends "res://src/chars/character.gd"


export (PackedScene) var the_arrow


func _ready():
	attack_range_rad = 42
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass

func _process(delta):
	
	pass

func _input(event):
	if (event.is_action_pressed('KEY_F')):
		$Animation.play("attack_up")
	pass

func dispara():
	var projectile = the_arrow.instance()
	projectile.position = self.global_position
	projectile.va_para_inimigo(get_parent().get_node('Boss').global_position)
	get_owner().add_child(projectile)
	pass

func get_boss_pos():
	var pos = get_parent().get_node('Boss').get_global_position()
	print (pos)
	pass
