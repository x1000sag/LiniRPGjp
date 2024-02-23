extends Area2D

var came_from:int

func _on_body_entered(body):
	if %MainCharacter/AnimationPlayer/AnimationTree["parameters/idle/blend_position"] == 1:
		%Camera.position.x += 1700
		came_from = 1
	elif %MainCharacter/AnimationPlayer/AnimationTree["parameters/idle/blend_position"] == -1:
		came_from = -1

func _on_body_exited(body):
	if %MainCharacter/AnimationPlayer/AnimationTree["parameters/idle/blend_position"] == -1:
		%Camera.position.x -= 1700
	elif %MainCharacter/AnimationPlayer/AnimationTree["parameters/idle/blend_position"] == 1 and came_from == -1:
		%Camera.position.x += 1700

