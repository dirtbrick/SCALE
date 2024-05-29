# The Dainn Tree - suggested 
extends Control

onready var back = $Back
onready var tree = $Tree
onready var scorelabel = $ScoreLabel
const default_min_size := 403.575
var score

func _ready():
	score = Global.total_score
	tree.rect_min_size.y = default_min_size + score
	scorelabel.text = "Score: " + str(score)

func _on_Back_button_down(): ButtonAnimations.animate(back,ButtonAnimations.RBOUNCE)
func _on_Back_button_up(): ButtonAnimations.animate(back,ButtonAnimations.BOUNCE)
func _on_Back_pressed(): SceneTransition.change_scene("res://scenes/LevelSelect.tscn")
