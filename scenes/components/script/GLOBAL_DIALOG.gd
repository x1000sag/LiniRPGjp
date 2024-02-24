extends Node

#Вызывается, когда диалог закочился
signal dialog_ended
#Вызывается, когда инициируется выбор
signal start_choice(option_set)
signal start_dialog(phrase)

#очередь фраз
@onready var queue : Array
#теги для диалога(список фраз нужные для диалога)
@onready var phrases = {
	"test": ["_test_", "_test_item_"],
	"poluchil_gavno": ["Vi poluchili gavno v kolichestve da"],
	"poslan_otets": ["o net", "vot tak vot"]
}
@onready var option_sets = {
	"test_set": ["Dai govna, pozhaluysta", "Poshel nah, otets"]
}

func who_talks(text):
	match text:
		"o net":
			return "Otets"
		"vot tak vot":
			return "Ayko"
	return ""
		
func option_pressed(option):
	match option:
		"Dai govna, pozhaluysta":
			PD.items.merge(I.vysokshee_gavno)
			PD.items["vysokshee_gavno"].count += 1
			start_dialog.emit("poluchil_gavno")
		"Poshel nah, otets":
			start_dialog.emit("poslan_otets")
