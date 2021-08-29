extends Node

var spell_1 = preload("res://src/effects/Spell_1.tscn")



func _ready():
#	GlobalParameters.connect("spell_animation", self, "_on_spell_casted")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_spell_casted():
	print("print mais printoso")
	pass
