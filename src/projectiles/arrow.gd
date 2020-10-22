extends "res://src/projectiles/projectile.gd"


func _ready():
	speed = 180
	pass

func apply_damage(boss):
	boss.take_damage(8)
	pass
