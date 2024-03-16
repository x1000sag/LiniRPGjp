extends CharacterBody2D

#взаимодействие с интерактивными объектами происходит на втором слое "interactive"!

@export var speed:int
@onready var ray:RayCast2D = $RayCast2D
var colider = null #Нужен для взаимодействия
#нужны для управления с телефона
var an_right:bool
var an_interact:bool
var an_left:bool

func _ready():
	$AnimationPlayer/AnimationTree.active = true
	$AnimationPlayer.active = true
	$Sprite2D.scale = SC.current_aspect
	SC.update_aspect.connect(update_scale)

func update_scale():
	$Sprite2D.scale = SC.current_aspect

func _physics_process(delta):
#движение
	if Input.is_action_pressed("right") or an_right:
		velocity.x = 1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
		$AnimationPlayer/AnimationTree["parameters/walk/blend_position"] = velocity.x
		$AnimationPlayer/AnimationTree["parameters/playback"].travel("walk")
	elif Input.is_action_pressed("left") or an_left:
		velocity.x = -1
		$AnimationPlayer/AnimationTree["parameters/idle/blend_position"] = velocity.x
		$AnimationPlayer/AnimationTree["parameters/walk/blend_position"] = velocity.x
		$AnimationPlayer/AnimationTree["parameters/playback"].travel("walk")
	move_and_collide(velocity*speed*delta)
	if velocity == Vector2.ZERO:
		$AnimationPlayer/AnimationTree["parameters/playback"].travel("idle")
	velocity = Vector2.ZERO
#взаимодействие и подсветка объекта
	if ray.is_colliding():
		colider = ray.get_collider()
		colider.highlight(true)
		if Input.is_action_just_pressed("interact") or an_interact and colider.has_method("interacted"):
			colider.interacted(self)
	else:
		if colider != null:
			colider.highlight(false)
		colider = null

#управление с андроида
func _on_android_controls_an_left_s(BOOL):
	an_left = BOOL
func _on_android_controls_an_right_s(BOOL):
	an_right = BOOL
func _on_android_controls_an_use_s(BOOL):
	an_interact = BOOL
