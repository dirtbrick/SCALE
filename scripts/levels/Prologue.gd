extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var ticks = 0
func _physics_process(delta):
	if ticks % (60*8) == 0: 
		print(ticks)
		$Position2D.spawn()
	ticks += 1

func _on_Button_pressed():
	SceneTransition.animate_change_scene("res://scenes/levels/Prologue.tscn",SceneTransition.SCOPE)
	SceneTransition.animate_change_scene("res://scenes/levels/Prologue.tscn",SceneTransition.SCOPE,
	[SceneTransition.add(),
	yield(SceneTransition.play("ScopeIN1"),"completed"),
	SceneTransition.change(),
	yield(SceneTransition.play("ScopeIN2"),"completed"),
	SceneTransition.remove()]) # Replace with function body.
