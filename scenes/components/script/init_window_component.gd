extends Node

@onready var Menu = preload("res://scenes/ui/esc_menu.tscn")
@onready var child=Menu.instantiate()
var an_menu:bool
# переменная, нужная для управления с телефонов

func _input(event):
#открытие паузы
	if !get_parent().has_node("Esc_Menu") and !get_parent().has_node("Window_button"):
		if (event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE) or an_menu:
			Menu = preload("res://scenes/ui/esc_menu.tscn")
			child=Menu.instantiate()
			get_parent().add_child(child)
			G.paused = true
	elif get_parent().has_node("Window_button"):
		if (event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE) or an_menu:
			Menu = preload("res://scenes/ui/esc_menu.tscn")
			child=Menu.instantiate()
			get_parent().add_child(child)
			get_parent().get_node("Window_button").queue_free()
	elif get_parent().has_node("Esc_Menu"):
		if (event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE) or an_menu:
			get_parent().get_node("Esc_Menu").queue_free()
			G.paused = false
	an_menu = false

#управление с телефона
func _on_android_controls_an_menu_s():
	an_menu = true
