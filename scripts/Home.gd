extends Control

onready var panel = "Home"
onready var ANIMATION = $AnimationPlayer
onready var PANEL1 = $Panel
onready var NAVIGATION = $Navigation

func _ready():
	pass

func _on_Camera2D_swipe_down():
	pass # Replace with function body.

#need fix, rn this works for either left or right
func _on_Camera2D_swipe_left():
	if panel != "HomePanel":
		ANIMATION.play("HomePanelRight")
		panel = "HomePanel"
		


func _on_Camera2D_swipe_right():
	if panel != "Home":
		ANIMATION.play_backwards("HomePanelRight")
		panel = "Home"
		print(panel)
		print(panel!="HomePanel")

func _on_Camera2D_swipe_up():
	pass # Replace with function body.


func _on_Home_resized():
	pass
	
	

func _on_Button_pressed():
	SceneTransition.change_scene("res://scenes/LevelSelect.tscn")


func _on_TUTORIAL_pressed():
	SceneTransition.change_scene("res://scenes/Tutorial.tscn")
	"""SceneTransition.animate_change_scene("res://scenes/Tutorial.tscn",SceneTransition.SCOPE)
	SceneTransition.animate_change_scene("res://scenes/Tutorial.tscn",SceneTransition.SCOPE,
	[SceneTransition.add(),
	yield(SceneTransition.play("ScopeIN1"),"completed"),
	SceneTransition.change(),
	yield(SceneTransition.play("ScopeIN2"),"completed"),
	SceneTransition.remove()])"""
func _on_SETTINGS_pressed():
	pass # Replace with function body.
