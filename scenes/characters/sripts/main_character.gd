extends CharacterBody2D

@export var speed:int
@onready var ray:RayCast2D = $RayCast2D
var colider = null
var an_right:bool
var an_interact:bool
var an_left:bool

func _input(event):
	if Input.is_action_just_pressed("interact"):
		pass

func _physics_process(delta):
	if Input.is_action_pressed("right") or an_right:
		velocity.x = 1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
	elif Input.is_action_pressed("left") or an_left:
		velocity.x = -1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
	move_and_collide(velocity*speed)
	velocity = Vector2.ZERO
	if ray.is_colliding():
		colider = ray.get_collider()
		colider.highlight(true)
		if Input.is_action_just_pressed("interact") or an_interact and colider.has_method("interacted"):
			colider.interacted(self)
	else:
		if colider != null:
			colider.highlight(false)
		colider = null



func _on_android_controls_an_left_s(BOOL):
	an_left = BOOL


func _on_android_controls_an_right_s(BOOL):
	an_right = BOOL


func _on_android_controls_an_use_s(BOOL):
	an_interact = BOOL
