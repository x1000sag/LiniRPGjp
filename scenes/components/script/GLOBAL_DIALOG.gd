extends Node
#В РАБОТЕ! @x1000sa
signal dialog_ended
#очередь фраз
@onready var queue : Array
#теги для диалога(список фраз нужные для диалога)
@onready var phrases = {
	"test": ["_test_", "_test_item_"]
}
