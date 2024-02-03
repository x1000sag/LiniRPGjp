extends Area2D
class_name interactive_area

@export var phrase:String
@onready var sprite:Sprite2D = $Sprite2D
var highlighted:bool = false

func highlight(active:bool):
	highlighted = active

func interacted(player):
	$"../dialog".start_dialog(phrase)
	
func _physics_process(delta):
	if highlighted:
		sprite.visible = true
	else:
		sprite.visible = false
	highlighted = false
