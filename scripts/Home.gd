extends Control

onready var panel = "Home"
onready var ANIMATION = $AnimationPlayer
onready var PANEL1 = $Panel
onready var NAVIGATION = $Navigation
onready var LUDUMATHICA = $RichTextLabel

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
	"""
	yield(ANIMATION, 'animation_finished')
	var MAINMENU = load("res://scenes/MainMenu.tscn")
	self.remove_child(NAVIGATION)
	self.remove_child(LUDUMATHICA)
	NAVIGATION.call_deferred("free")
	var MAINMENUINS = MAINMENU.instance()
	self.add_child(MAINMENUINS)
	ANIMATION.play("WaterTransitionDown")
	"""


func _on_TUTORIAL_pressed():
	SceneTransition.change_scene("res://scenes/Tutorial.tscn")


func _on_SETTINGS_pressed():
	pass # Replace with function body.
