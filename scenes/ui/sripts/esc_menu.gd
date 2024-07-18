extends CanvasLayer

@onready var Menu = preload("res://scenes/ui/settings_menu.tscn")
@onready var child = Menu.instantiate()

func _on_exit_pressed():
	SAVE.save_file()
	get_tree().quit()

func _on_settings_pressed():
#вызыв натроек
	if !get_parent().has_node("Window_button"):
		Menu = preload("res://scenes/ui/settings_menu.tscn")
		child=Menu.instantiate()
		get_parent().add_child(child)
		queue_free()

func _on_resume_pressed():
	G.paused = false
	queue_free()
