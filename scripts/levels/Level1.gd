extends Control


onready var submit = $SubmitButtonContainer
onready var answers = $AnswersContainer
onready var question = $QuestionsContainer/NinePatchRect/GridContainer
onready var showConfirmButton = false

onready var positions:=[$QuestionsContainer/NinePatchRect/GridContainer/Label4,$QuestionsContainer/NinePatchRect/GridContainer/Label6, $QuestionsContainer/NinePatchRect/GridContainer/Label9]

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
var n
var selected

signal submitted

func _ready():
	problems.shuffle()
	play()

func play():
	for i in range(len(problems)):
		n = problems[i]
		question.get_child(3).text = str(n["base"])
		question.get_child(5).text = str(n["argument"])
		question.get_child(8).text = str(n["exponent"])
		answers.get_child(0).get_child(0).get_child(0).text = str(n["choice1"])
		answers.get_child(0).get_child(0).get_child(1).text = str(n["choice2"])
		answers.get_child(0).get_child(1).get_child(0).text = str(n["choice3"])
		answers.get_child(0).get_child(1).get_child(1).text = str(n["choice4"])
		yield(self, "submitted")
func _process(delta):
	if showConfirmButton:
		submit.anchor_bottom = 0.875
		answers.anchor_bottom = 0.875
	else:
		submit.anchor_top = 1
		answers.anchor_top = 1


func _on_Answer1_pressed():
	var newparent = $".".get_position_in_parent()
	var button = answers.get_child(0).get_child(0).get_child(0)
	move_child(button,newparent)
	if str(n["base"]) == " ":
		button.rect_global_position = Vector2(positions[0].rect_global_position.x-positions[0].rect_size.x/2,positions[0].rect_global_position.y+positions[0].rect_size.y)
	elif str(n["argument"]) == " ":
		button.rect_global_position = positions[1]
	elif str(n["exponent"]) == " ":
		button.rect_global_position = positions[2]
	
	showConfirmButton = true
	selected = "choice1"
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
	if n["answer"]==n[selected]:
		score += 1
	else:
		score -=1
