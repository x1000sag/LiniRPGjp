extends CanvasLayer

class_name Escape_menu
@onready var Menu = preload("res://scenes/ui/Window_button.tscn")
@onready var child=Menu.instantiate()


func _on_exit_pressed():
	get_tree().quit()
	

func _on_settings_pressed():

		if !get_parent().has_node("Window_button"):
			Menu = preload("res://scenes/ui/Window_button.tscn")
			child=Menu.instantiate()	
			get_parent().add_child(child)
			queue_free()
			



func _on_resume_pressed():
	queue_free()
