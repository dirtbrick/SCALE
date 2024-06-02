extends Control

onready var panel = "Home"
# Homescreen
onready var ANIMATION = $AnimationPlayer
onready var PANEL1 = $Panel
onready var NAVIGATION = $Navigation

func _ready():
	pass

func _on_Camera2D_swipe_down():
	pass # Replace with function body.

#need fix, rn this works for either left or right
func _on_Camera2D_swipe_left():
	#if panel != "HomePanel":
	#	ANIMATION.play("HomePanelRight")
	#	panel = "HomePanel"
	pass


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
	print("fgdsfsd")
	var tween = create_tween()
	var node = $MarginContainer
	tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	node.anchor_top = -1
	tween.tween_property(node, "anchor_top", 0, 0.7)
func _on_QUIT_pressed():
	$MarginContainer.visible = true
	get_tree().paused = true

#IDK WHY THIS DOESN'T WORK BROOO 
# tried:
# 1.  yes and no button on the same margincontainer it only turns the whole poppup invisible
# 2. yes in another margin container, no in the upper margin conatiner, it only quits whether you press yes or no
# 3. 
func _on_Yes_pressed():
	get_tree().quit()
func _on_No_pressed():
	get_tree().paused = false
	$MarginContainer.visible = false
