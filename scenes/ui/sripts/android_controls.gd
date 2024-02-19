extends CanvasLayer

#сигналы, которые соеденены со скриптом вызыва паузы и и со скриптом персонажа. Сигнал работает при нажатие
#и при при отпускании кнопок
signal an_left_s(BOOL:bool)
signal an_right_s(BOOL:bool)
signal an_use_s(BOOL:bool)
signal an_menu_s()

func _ready():
	$right.scale = SC.current_aspect
	$interact.scale = SC.current_aspect
	$left.scale = SC.current_aspect
	$menu.scale = SC.current_aspect

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
