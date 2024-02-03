extends CanvasLayer

signal an_left_s(BOOL:bool)
signal an_right_s(BOOL:bool)
signal an_use_s(BOOL:bool)
signal an_menu_s()



func _on_right_button_down():
	emit_signal("an_right_s", true)


func _on_right_button_up():
	emit_signal("an_right_s", false)



func _on_interact_button_down():
	emit_signal("an_use_s", true)


func _on_interact_button_up():
	emit_signal("an_use_s", false)



func _on_left_button_down():
	emit_signal("an_left_s", true)


func _on_left_button_up():
	emit_signal("an_left_s", false)



func _on_menu_pressed():
	emit_signal("an_menu_s")
