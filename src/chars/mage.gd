extends "res://src/chars/character.gd"

export (PackedScene) var magic_ball

func _ready():
	my_class = "Mage"
	attack_range_rad = 40
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	max_health = 120
	current_health = max_health
	set_max_health()
	pass


func _process(_delta):
	
	pass

func _input(_event):
	
	pass

func lanca_magia():
	var projectile = magic_ball.instance()
	projectile.position = global_position
	projectile.va_para_inimigo(get_parent().get_node('Boss').global_position)
	get_owner().add_child(projectile)
	pass
	
func attack_enemy(_target):
	$Animation.play(self.stateAndOrientation)
	pass
