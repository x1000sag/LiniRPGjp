extends CanvasLayer

@onready var text = $dialog/NinePatchRect/RichTextLabel
@onready var dialog_ui = $dialog
#очередь фраз
@onready var queue : Array
#теги для диалога(список фраз нужные для диалога)
@onready var phrases = {
	"test": ["_test_", "_test_item_"]
}

func start_dialog(dialog : String):
	dialog_ui.visible = true
#	добавление в очередь фразы по тегу
	queue.assign(phrases[dialog])
#	Установка первой фразы
	if queue.size() != 0:
			text.text = queue[0]
			queue.erase(text.text)

func _physics_process(delta):
#	переход на следующую фразу
	if Input.is_action_just_pressed("click") and dialog_ui.visible:
		if queue.size() != 0:
			text.text = queue[0]
			queue.erase(text.text)
		else:
			dialog_ui.visible = false
			text.text = ""
