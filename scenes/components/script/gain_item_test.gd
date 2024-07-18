extends interactive_class_area

func interacted(_player):
	if !PD.items.has("item_govna"):
		PD.items.merge(I.item_govna)
	elif PD.items.has("item_govna"):
		PD.items.merge(I.vysokshee_gavno)
		PD.items["vysokshee_gavno"].count += 1
	print(PD.items)
