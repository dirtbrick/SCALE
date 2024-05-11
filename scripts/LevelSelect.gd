# use animation player instead,, this thingcannot handle fast user inputs
extends Control

onready var P=$Levels/AspectRatioContainer/GridContainer/Path2D/PathFollow2D

func _ready():
	pass

var islenum := 1
var moveup := false
var movedown := false
var stopat := 1

func move(destination:int):
	if islenum < destination: 
		moveup = true
		movedown = false
	else:
		movedown = true
		moveup = false
	stopat = destination

func _on_Back_pressed():
	SceneTransition.change_scene("res://scenes/Home.tscn")
func _on_level1_pressed():
	move(1)
func _on_level2_pressed():
	move(2)
func _on_level3_pressed():
	move(3)

func _process(delta):	
	if moveup == true:
		P.unit_offset += 0.01
	elif movedown == true:
		P.unit_offset -= 0.01
	
	if P.unit_offset <= 0 and stopat == 1:
		islenum = 1
		moveup = false
		movedown = false
	
	# if on isle 2
	if P.unit_offset >= 0.51 and P.unit_offset <= 0.52 and stopat == 2:
		islenum = 2
		moveup = false
		movedown = false
		
	if P.unit_offset >= 1.0 and stopat == 3:
		islenum = 3
		moveup = false
		movedown = false




func _on_Back_button_down():
	pass # Replace with function body.
