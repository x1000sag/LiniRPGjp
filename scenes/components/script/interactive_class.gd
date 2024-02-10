extends Area2D
class_name interactive_class_area

#взаимодействие с интерактивными объектами происходит на втором слое "interactive"!

@export var phrase:String
@onready var sprite:Sprite2D = $Sprite2D
var highlighted:bool = false

func _ready():
	GD.dialog_ended.connect(dialog_ended)

#Нужна для подсветки объёкта; вызывается гг
func highlight(active:bool):
	highlighted = active

#функция при взаимодействии с предметом
func interacted(player):
	%dialog.start_dialog(phrase)
#вызывается после диалога
func dialog_ended():
	pass

#подсвечивание при приближении гг
func _physics_process(_delta):
	if highlighted:
		sprite.visible = true
	else:
		sprite.visible = false
	highlighted = false
