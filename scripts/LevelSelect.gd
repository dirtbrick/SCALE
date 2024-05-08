extends Control

onready var P=$Levels/Path2D/PathFollow2D

func _ready():
	pass

func _on_level1_pressed():
	SceneTransition.change_scene("res://scenes/Home.tscn")

var gotoisle2 = false
var gotoisle3 = false


func _on_level2_pressed():
	gotoisle2 = true

func _on_level3_pressed():
	gotoisle3 = true

func _process(delta):	
	if gotoisle2 == true or gotoisle3 == true:
		P.unit_offset += 0.01
	
	# if on isle 2
	if P.unit_offset >= 0.57:
		P.scale=Vector2(-1,1)
		P.h_offset=100
		gotoisle2 = false
	
	# if on 
	if P.unit_offset >= 1.0:
		gotoisle3 = false

