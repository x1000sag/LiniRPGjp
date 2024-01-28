extends Node2D

@onready var Menu = preload("res://scenes/ui/Window_button.tscn")
@onready var child=Menu.instantiate()
@onready var option_button = $HBoxContainer/OptionButton as OptionButton
signal Back_to_pause_menu

const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Window mode",
	"Borderless",
	"Borderless full-Screen"
]


func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)

func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)	 



func _on_button_pressed():
	queue_free()
	
	
	

