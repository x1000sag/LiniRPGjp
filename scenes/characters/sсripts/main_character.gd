extends CharacterBody2D

@export var speed:int
@onready var ray:RayCast2D = $RayCast2D
var colider = null

func _input(event):
	if Input.is_action_just_pressed("interact"):
		pass

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = 1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
	elif Input.is_action_pressed("left"):
		velocity.x = -1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
	move_and_collide(velocity*speed)
	velocity = Vector2.ZERO
	if ray.is_colliding():
		colider = ray.get_collider()
		colider.highlight(true)
		if Input.is_action_just_pressed("interact") and colider.has_method("interacted"):
			colider.interacted(self)
	else:
		if colider != null:
			colider.highlight(false)
		colider = null

