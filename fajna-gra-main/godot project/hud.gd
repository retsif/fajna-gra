extends Node

@onready var licznik_punktow = %licznik_punktow

var points = 0

func add_point():
	points += 1
	print(points)
	licznik_punktow.text = "Punkty: " + str(points)
