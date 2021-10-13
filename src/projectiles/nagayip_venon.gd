extends Node2D

var destination = Vector2(0,0)
var speed = 300
var active = true

func _ready():
	$Target/Animation.play("set_mark")
	pass

func _physics_process(delta):
	
	if (active):
		$Venon.move_and_slide((destination - $Venon.global_position).normalized() * speed)
		print($Venon.global_position.distance_to(destination))
	pass

func change_animation(name):
	$Target/Animation.play(name)
	pass

func set_target(target):
	self.destination = target.global_position
	$Target.global_position  = destination
	$Venon.global_position.x = destination.x
	$Venon.global_position.y = destination.y - 300
	pass
	
func apply_damage():
	#verifica se está na colisão de um char e aplica dano
	pass
