extends Control


onready var submit = $SubmitButtonContainer
onready var answers = $AnswersContainer
onready var question = $QuestionsContainer/NinePatchRect/GridContainer
onready var showConfirmButton = false

var problems = {0:{3:'B',5:' ',8:'C','ans':'A'}}

func _ready():
	problems.shuffle()
	play()

func play():
	pass

func _process(delta):
	if showConfirmButton:
		submit.anchor_bottom = 0.875
		answers.anchor_bottom = 0.875
	else:
		submit.anchor_top = 1
		answers.anchor_top = 1


func _on_Answer1_pressed():
	showConfirmButton = true


func _on_Answer2_pressed():
	showConfirmButton = true


func _on_Answer3_pressed():
	showConfirmButton = true


func _on_Answer4_pressed():
	showConfirmButton = true
