extends StaticBody2D

func destroy():
	Events.bricked.emit()
	queue_free()
