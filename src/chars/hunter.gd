extends "res://src/chars/character.gd"


export (PackedScene) var the_arrow


func _ready():
	my_class = "Hunter"
	attack_range_rad = 42
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	max_health = 120
	current_health = max_health
	set_max_health()
	pass

func _process(_delta):
	
	pass

func _input(event):
	if (event.is_action_pressed('KEY_F')):
		$Animation.play("attack_up")
	pass


func attack_enemy(_target):
	$Animation.play(stateAndOrientation)
	pass


func dispara():
	var projectile = the_arrow.instance()
	projectile.position = global_position
	projectile.va_para_inimigo(get_parent().get_node('Boss').global_position)
	get_owner().add_child(projectile)
	pass

func get_boss_pos():
	var _pos = get_parent().get_node('Boss').get_global_position()
	pass
