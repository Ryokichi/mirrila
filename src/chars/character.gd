extends KinematicBody2D


onready var motion = Vector2.ZERO
onready var orientation = "down"
onready var state = "idle_"
onready var stateAndOrientation = "idle_down"
onready var current_health  = 100
onready var max_health =  100

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play(self.stateAndOrientation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func take_damage(amount):
	pass
	
func update_health(percentage):
	print('o pencentual é: '+str(percentage))
	$health_bar/Progress.value = percentage
	pass
