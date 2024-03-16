extends CanvasLayer

@onready var text = $dialog/NinePatchRect/RichTextLabel
@onready var dialog_ui = $dialog
@onready var Name = $dialog/NinePatchRect/Label
@export var dialog_pos_top:bool = false

func _ready():
	GD.start_choice.connect(start_choice)
	GD.start_dialog.connect(start_dialog)
	if dialog_pos_top:
		$dialog/NinePatchRect.position = Vector2.ZERO

func start_dialog(dialog : String):
	GD.current_phrase = ""
	GD.current_phrase = dialog
	dialog_ui.visible = true
#	добавление в очередь фразы по тегу
	GD.queue.assign(GD.phrases[dialog])
#	Установка первой фразы
	if GD.queue.size() != 0:
			text.text = GD.queue[0]
			GD.queue.erase(text.text)
	else:
		GD.emit_signal("dialog_ended")
	Name.text = GD.who_talks(text.text)

func start_choice(option_set):
	$choice/option1/Label.text = GD.option_sets[option_set][0]
	$choice/option2/Label.text = GD.option_sets[option_set][1]
	$choice.visible = true

func _physics_process(_delta):
#	переход на следующую фразу
	if Input.is_action_just_pressed("click") and dialog_ui.visible:
		if GD.queue.size() != 0:
			text.text = GD.queue[0]
			GD.queue.erase(text.text)
			Name.text = GD.who_talks(text.text)
		else:
			dialog_ui.visible = false
			text.text = ""
			GD.emit_signal("dialog_ended")


func _on_option_1_pressed():
	GD.option_pressed($choice/option1/Label.text)
	$choice.visible = false

func _on_option_2_pressed():
	GD.option_pressed($choice/option2/Label.text)
	$choice.visible = false
