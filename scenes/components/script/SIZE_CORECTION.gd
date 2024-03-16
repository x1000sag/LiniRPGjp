extends Node

signal update_aspect

#оригенальное соотношеніе сторонъ
const x = 16.0
const y = 9.0

var current_aspect: Vector2

#мобильныя устройства 18х9
const mobile1 = Vector2(x/18.0, y/9.0)
#мобильныя устройства 20х9
const mobile2 = Vector2(x/20.0, y/9.0)
#мобильныя устройства 3х2
const mobile3 = Vector2(x/3.0, x/2.0)
#мобильныя устройства 19.5х9
const mobile4 = Vector2(x/19.5, y/9.0)
#компьютеры 16х9
const pc1 = Vector2(x/16.0, y/9.0)
#компьютеры 16х10
const pc2 = Vector2(x/16.0, y/10.0)
#компьютеры 5х4
const pc3 = Vector2(x/5.0, y/4.0)
#компьютеры 4х3
const pc4 = Vector2(x/4.0, y/3.0)

func _ready():
#установка соотношенія сторонъ по умолчанію
	var resolution = DisplayServer.screen_get_size()
	if !G.is_played:
		current_aspect = pc1
		match float(resolution.x) / float(resolution.y):
			18.0/9.0:
				current_aspect = mobile1
			20.0/9.0:
				current_aspect = mobile2
			3.0/2.0:
				current_aspect = mobile3
			19.5/9.0:
				current_aspect = mobile4
			16.0/9.0:
				current_aspect = pc1
			16.0/10.0:
				current_aspect = pc2
			5.0/4.0:
				current_aspect = pc3
			4.0/3.0:
				current_aspect = pc4
