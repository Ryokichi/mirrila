extends "res://src/chars/character.gd"



func _ready():
	attack_range_rad = 20
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	._process(delta)
	pass
