extends interactive_class_area

func dialog_ended():
	GD.dialog_ended.disconnect(dialog_ended)
	GD.emit_signal("start_choice", option_set)
	GD.dialog_ended.connect(to_cutscene)

func to_cutscene():
	get_tree().change_scene_to_file("res://scenes/locations_and_cutscenes/cut_scene1.tscn")
