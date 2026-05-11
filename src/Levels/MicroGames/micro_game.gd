extends Node2D

class_name MicroGame

signal ended

func close_microgame():
	ended.emit()
	queue_free()
