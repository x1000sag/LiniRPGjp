extends interactive_class_area

func dialog_ended():
	GD.dialog_ended.disconnect(dialog_ended)
	GD.emit_signal("start_choice", option_set)
