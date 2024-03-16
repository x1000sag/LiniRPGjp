extends Node

#Вызывается, когда диалог закочился
signal dialog_ended(phrase)
#Вызывается, когда инициируется выбор
signal start_choice(option_set)
signal start_dialog(phrase)

var current_phrase: String
#очередь фраз
@onready var queue : Array
#теги для диалога(список фраз нужные для диалога)
@onready var phrases = {
	"test": ["_test_", "_test_item_"],
	"poluchil_gavno": ["Vi poluchili gavno v kolichestve da"],
	"poslan_otets": ["o net", "vot tak vot"],
	"cutscene1": ["Но Акико, наконец, пришла за ним: белая большая бабочка была её душой.", "Раз я увидел, как опавший цветок вернулся на ветку. Но, увы! То лишь вспорхнула бабочка…", "Я хочу ещё одну сказку!", "На сегодня хватит Айко, тебе пора спать, завтра у нас тяжёлый день.", "А что завтра?", "Твоей маме могло исполниться 32 года.", "Я так скачаю по ней.", "Я тоже, малышка… Доброй ночи!", "Доброй ночи, пап.", "Отец встал и покинул комнату."]
}
@onready var option_sets = {
	"test_set": ["Dai govna, pozhaluysta", "Poshel nah, otets. Ну или расскажи сказку"]
}

func who_talks(text):
	match text:
		"o net":
			return "Otets"
		"vot tak vot":
			return "Ayko"
		"Но Акико, наконец, пришла за ним: белая большая бабочка была её душой.":
			return "Отец"
		"Раз я увидел, как опавший цветок вернулся на ветку. Но, увы! То лишь вспорхнула бабочка…":
			return "Отец"
		"Я хочу ещё одну сказку!":
			return "Айко"
		"На сегодня хватит Айко, тебе пора спать, завтра у нас тяжёлый день.":
			return "Отец"
		"А что завтра?":
			return "Айко"
		"Твоей маме могло исполниться 32 года.":
			return "Отец"
		"Я так скачаю по ней.":
			return "Айко"
		"Я тоже, малышка… Доброй ночи!":
			return "Отец"
		"Доброй ночи, пап.":
			return "Айко"
	return ""
		
func option_pressed(option):
	match option:
		"Dai govna, pozhaluysta":
			PD.items.merge(I.vysokshee_gavno)
			PD.items["vysokshee_gavno"].count += 1
			start_dialog.emit("poluchil_gavno")
		"Poshel nah, otets. Ну или расскажи сказку":
			start_dialog.emit("poslan_otets")
