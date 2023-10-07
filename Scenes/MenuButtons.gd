extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Start_pressed():
	get_node("Start").move(Vector2(-576,0))
	get_node("8)/VideoContainer/VideoPlayer").play()
	get_node("8)").move(Vector2(0,0))

func _on_Back2_pressed():
	get_node("Start").move(Vector2(0,0))
	get_node("8)/VideoContainer/VideoPlayer").stop()
	get_node("8)").move(Vector2(576,0))

func _on_Settings_pressed():
	get_node("Start").move(Vector2(-576,0))
	get_node("Settings").move(Vector2(0,0))

func _on_Back_pressed():
	get_node("Start").move(Vector2(0,0))
	get_node("Settings").move(Vector2(576,0))


func _on_Quit_pressed():
	get_tree().quit()

