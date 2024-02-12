extends interactive_class_area

var item_govna:Dictionary ={
	"item_govna":{
		"disc":"vonyaet",
		"rare": "not really",
		"phase":"begining"
	}
}
var vysokshee_gavno:Dictionary={
	"vysokshee_gavno":{
		"disc":"uzhe ne ochen",
		"rare": "Davolno",
		"phase":"old",
		"count": 0
	}
}


func interacted(_player):
	if !PD.items.has("item_govna"):
		PD.items.merge(item_govna)
	elif PD.items.has("item_govna"):
		PD.items.merge(vysokshee_gavno)
		PD.items["vysokshee_gavno"].count += 1
	print(PD.items)
