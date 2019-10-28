extends Label

func update_score():
	text = "Score: " + str(get_parent().score)