extends Node

@onready var FILE = ConfigFile.new()
var app_section = "AppData"
var player_section = "PlayerData"

#app data
var window_mode
var aspect
var is_played:bool = true
#player data

func _ready():
	load_file()

func save_file() -> void:
	FILE.set_value(app_section, "window_mode", window_mode)
	FILE.set_value(app_section, "aspect", aspect)
	FILE.set_value(app_section, "is_played", true)
	FILE.save("user://save.cfg")
	
func load_file() -> void:
	FILE.load("user://save.cfg")
	window_mode = FILE.get_value(app_section, "window_mode", 0)
	aspect = FILE.get_value(app_section, "aspect", Vector2(1,1))
	is_played = FILE.get_value(app_section, "is_played", false)
	SC.current_aspect = aspect
	SC.emit_signal("update_aspect")
	match window_mode:
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
