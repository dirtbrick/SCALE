extends Control


onready var submit = $SubmitButtonContainer
onready var answercontainer = $AnswersContainer
onready var answers = [$AnswersContainer/VBoxContainer/HFlowContainer/Answer1, $AnswersContainer/VBoxContainer/HFlowContainer/Answer2, $AnswersContainer/VBoxContainer/HFlowContainer2/Answer3, $AnswersContainer/VBoxContainer/HFlowContainer2/Answer4]
onready var questions = [$QuestionsContainer/NinePatchRect/Base, $QuestionsContainer/NinePatchRect/Argument, $QuestionsContainer/NinePatchRect/Exponent]
onready var showConfirmButton = false

onready var score = 0

var problems = [
	{
		"base": "B",
		"argument": " ",
		"exponent": "C",
		"choice1": "A",
		"choice2": "B",
		"choice3": "C",
		"choice4": "D",
		"answer": "A"
	},
	{
		"base": " ",
		"argument": "A",
		"exponent": "C",
		"choice1": "A",
		"choice2": "B",
		"choice3": "C",
		"choice4": "D",
		"answer": "B"
	},
	{
		"base": "B",
		"argument": "A",
		"exponent": " ",
		"choice1": "A",
		"choice2": "B",
		"choice3": "C",
		"choice4": "D",
		"answer": "C"
	},
	{
		"base": 2,
		"argument": 2,
		"exponent": " ",
		"choice1": 1,
		"choice2": 2,
		"choice3": 3,
		"choice4": 4,
		"answer": 1
	},
	{
		"base": 1,
		"argument": 1,
		"exponent": " ",
		"choice1": 1,
		"choice2": 2,
		"choice3": 3,
		"choice4": 4,
		"answer": 1
	}]
var idx = 0
var selected

signal submitted

func _ready():
	problems.shuffle()
	play()

func reset()->void:
	questions[0].text = str(problems[idx]["base"])
	questions[1].text = "(" + str(problems[idx]["argument"]) + ")"
	questions[2].text = str(problems[idx]["exponent"])
	answers[0].text = str(problems[idx]["choice1"])
	answers[1].text = str(problems[idx]["choice2"])
	answers[2].text = str(problems[idx]["choice3"])
	answers[3].text = str(problems[idx]["choice4"])

func play():
	for i in range(len(problems)):
		idx = i
		reset()
		yield(self, "submitted")
func _process(delta):
	if showConfirmButton:
		submit.anchor_bottom = 0.875
		answercontainer.anchor_bottom = 0.875
	else:
		submit.anchor_top = 1
		answercontainer.anchor_top = 1

func _on_Answer2_pressed():
	showConfirmButton = true
	selected = "choice2"
func _on_Answer3_pressed():
	showConfirmButton = true
	selected = "choice3"
func _on_Answer4_pressed():
	showConfirmButton = true
	selected = "choice4"
func _on_SubmitButton_pressed():
	emit_signal("submitted")
	if problems[idx]["answer"]==problems[idx][selected]:
		score += 1
	else:
		score -=1


func _on_Answer1_toggled(button_pressed) -> void:
	var text = answers[0].text
	if button_pressed:
		if str(problems[idx]["base"]) == " ":
			questions[0].text=text
		elif str(problems[idx]["argument"]) == " ":
			questions[0].text=text
		elif str(problems[idx]["exponent"]) == " ":
			questions[0].text=text

	else:
		reset()
	
	showConfirmButton = true
	selected = "choice1"
