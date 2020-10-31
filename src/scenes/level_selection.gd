extends Node2D

const btn_pos_y = 30
var level_selected = 0
var level_btns = []

func _ready():
#	self.level_btns = [
#		$level_btn_1, 
#		$level_btn_2,
#		$level_btn_3
#	]
#
#	$level_btn_1.rect_position = Vector2(90, 30)
#	$level_btn_2.rect_position = Vector2(110, 30)
#	$level_btn_3.rect_position = Vector2(120, 30)
#
#	self.update_level_btn_position();
	
	pass
	
func update_level_btn_position():
#	for i in self.level_btns.size():
#		var j = i - self.level_selected
#		var x = 90 + j*120
#		self.level_btns[i].rect_global_position = Vector2 (x, 30)
#		self.level_btns[i].set("z", j)
#		print(i)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_preview_level_pressed():
#	if (self.level_selected > 0):
#		self.level_selected -= 1
#
#	update_level_btn_position()
	pass
	

func _on_btn_next_level_pressed():
#	if (self.level_selected < (self.level_btns.size()-1) ):
#		self.level_selected -= 1
#
#	update_level_btn_position()
	pass

func _on_level_btn_1_pressed():
	get_tree().change_scene("res://src/levels/level_1.tscn")
	pass
