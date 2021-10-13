extends KinematicBody2D

const MAX_SPEED = 35
const ACCELERATION = 1000

onready var state = "idle_"
onready var orientation = "down"
onready var newState = "idle_"
onready var newOrientation = "down"
onready var stateAndOrientation = "idle_down"
onready var old_stateAndOrientation = ""
onready var my_class = null
onready var motion = Vector2.ZERO
onready var new_destiny = Vector2.ZERO
onready var target_hit_pos = Vector2.ZERO
onready var target = null
onready var max_health = 100
onready var current_health = max_health
onready var attack_range_rad = 5
onready var base_time_basic_attack = 1
onready var time_basic_attack = base_time_basic_attack

func _ready():
	$Animation.play(self.stateAndOrientation)
	pass

func _draw():
#	draw_circle(Vector2(0,-11), attack_range_rad, Color(.867, .91, .247,  0.2))
	pass

func _process(_delta):
	update()
	pass

func _physics_process(delta):
	if (new_destiny != Vector2.ZERO):
		set_orientation_to_point(new_destiny)
		move_and_slide((new_destiny - global_position).normalized() * MAX_SPEED)
		pass
	if (target != null):
		if (time_basic_attack > 0):
			time_basic_attack -= delta
		else:
			time_basic_attack = base_time_basic_attack
			set_state("attack_")
			attack_enemy(target)
	pass
	
func _on_Attack_Range_body_entered(enemy_body):
	if (target):
		return
		
	target = enemy_body
	new_destiny = Vector2.ZERO
	set_state('idle_')
	set_orientation_to_point(target.global_position)
	pass


func _on_Attack_Range_body_exited(body):
	if (body == target):
		target = null
	pass


func set_max_health():
	$Health_Bar/Progress.max_value = max_health
	$Health_Bar/Progress.value = max_health
	pass

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
	pass


func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	pass

func get_class():
	return my_class
	

func move_to_point(point):
	new_destiny = point
	set_state('walk_')
	pass

func attack_enemy(_target):
	$RayCast.cast_to = (_target.global_position - global_position)
	$RayCast.force_raycast_update()
	target_hit_pos = $RayCast.get_collision_point()
	pass

func take_heal(amount, spell_id):
	current_health += amount
	if (current_health > max_health):
		current_health = max_health

	if (spell_id == 1):
		$SpellEffect/Effect_1.emitting = true
	
	update_health(current_health)
	pass

func take_damage(amount):
	current_health -= amount
	if (current_health  < 0):
		current_health = 0
	update_health(current_health)
	pass

func set_orientation_to_point(dest):
	var angle = (dest - global_position).angle()
	var abs_angle = abs(angle)
	
	var look_to = "down" if (angle > 0) else "up"
	if (abs_angle > 3*PI/4 || abs_angle < PI/4):
		look_to = 'left' if (abs_angle > 3*PI/4) else 'right'
	set_orientation(look_to)
	pass

func set_orientation(ori):
	if (self.orientation != ori):
		self.orientation = ori
		updade_StateAndOrientation()
	pass

func set_state(stt):
	if (self.state != stt):
		self.state = stt
		updade_StateAndOrientation()
	pass


func update_health(health):
	$Health_Bar/Progress.value = health
	pass

func updade_StateAndOrientation():
	self.old_stateAndOrientation = self.stateAndOrientation
	self.stateAndOrientation = self.state + self.orientation
	if (self.stateAndOrientation != old_stateAndOrientation):
		play_current_animation()
	pass

func is_alive():
	return (state != "dead")

func play_current_animation():
	$Animation.play(self.stateAndOrientation)
	pass

func _on_BodyArea_input_event(_viewport, event, _shape_idx):
	if (event.is_pressed() && event.button_index == BUTTON_LEFT):
		GlobalSignals.emit_signal('set_ally_selected', self)
	pass
