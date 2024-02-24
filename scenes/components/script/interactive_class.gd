extends Area2D
class_name interactive_class_area

#взаимодействие с интерактивными объектами происходит на втором слое "interactive"!

@export var phrase:String
@export var option_set:String
@onready var sprite:Sprite2D = $Sprite2D
var highlighted:bool = false

#Нужна для подсветки объёкта; вызывается гг
func highlight(active:bool):
	highlighted = active

#функция при взаимодействии с предметом
func interacted(_player):
	if GD.queue.size() == 0:
		GD.dialog_ended.connect(dialog_ended)
		%dialog.start_dialog(phrase)
#вызывается после диалога
func dialog_ended():
	GD.dialog_ended.disconnect(dialog_ended)

#подсвечивание при приближении гг
func _physics_process(_delta):
	if highlighted:
		sprite.visible = true
	else:
		sprite.visible = false
	highlighted = false
