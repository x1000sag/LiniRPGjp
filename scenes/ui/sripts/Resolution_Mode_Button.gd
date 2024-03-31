extends Control

@onready var option_button = $HBoxContainer2/OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"16 x 9" : SC.pc1,
	"16 x 10" : SC.pc2,
	"5 x 4" : SC.pc3,
	"4 x 3" : SC.pc4,
	"18 x 9" : SC.mobile1,
	"20 x 9" : SC.mobile2,
	"3 x 2" : SC.mobile3,
	"19.5 x 9" : SC.mobile4
}

func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_items()
#загрузить сохраннённый индексъ и вставить его въ option_button.select(index), где index загруженъ изъ файла
	
func add_resolution_items() -> void:	
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)
		
func on_resolution_selected(index : int) -> void:
	SC.current_aspect = RESOLUTION_DICTIONARY.values()[index]
	SC.emit_signal("update_aspect")
#въ этой функціи сохранить index
