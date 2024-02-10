extends CanvasLayer

@onready var text = $dialog/NinePatchRect/RichTextLabel
@onready var dialog_ui = $dialog

func start_dialog(dialog : String):
	dialog_ui.visible = true
#	добавление в очередь фразы по тегу
	GD.queue.assign(GD.phrases[dialog])
#	Установка первой фразы
	if GD.queue.size() != 0:
			text.text = GD.queue[0]
			GD.queue.erase(text.text)

func _physics_process(delta):
#	переход на следующую фразу
	if Input.is_action_just_pressed("click") and dialog_ui.visible:
		if GD.queue.size() != 0:
			text.text = GD.queue[0]
			GD.queue.erase(text.text)
		else:
			dialog_ui.visible = false
			text.text = ""
