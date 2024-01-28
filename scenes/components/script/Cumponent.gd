extends Node

@onready var Menu = preload("res://scenes/ui/esc_menu.tscn")
@onready var child=Menu.instantiate()

func _input(event):
	if !get_parent().has_node("Esc_Menu") and !get_parent().has_node("Window_button"):
		if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
			Menu = preload("res://scenes/ui/esc_menu.tscn")
			child=Menu.instantiate()	
			get_parent().add_child(child)
			
