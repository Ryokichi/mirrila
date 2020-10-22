extends "res://src/projectiles/projectile.gd"


func _ready():
	speed = 140
	pass


func apply_damage(boss):
	boss.take_damage(12)
	pass
