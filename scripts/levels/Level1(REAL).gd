extends Control

# change to JSON
onready var problems = [
	{
		"base": "B",
		"argument": "?",
		"exponent": "C",
		"choice1": "Argument",
		"choice2": "Base",
		"choice3": "Exponent",
		"choice4": "Skip",
		"answer": "Argument"
	},
	{
		"base": "?",
		"argument": "A",
		"exponent": "C",
		"choice1": "Argument",
		"choice2": "Base",
		"choice3": "Exponent",
		"choice4": "Skip",
		"answer": "Base"
	},
	{
		"base": "B",
		"argument": "A",
		"exponent": "?",
		"choice1": "Argument",
		"choice2": "Base",
		"choice3": "Exponent",
		"choice4": "Skip",
		"answer": "Exponent"
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
onready var pausebox = preload("res://scenes/ui/PauseBox.tscn")
onready var lvlcomplete = preload("res://scenes/ui/LevelComplete.tscn")
onready var choices = [$MarginContainer/GridContainer/A,$MarginContainer/GridContainer/B, $MarginContainer/GridContainer/C, $MarginContainer/GridContainer/D]
onready var question = $VBoxContainer/Question
onready var confirm = $ConfirmButton
onready var scorelabel = $HUDs/ScoreLabel
signal next_question

# dynamic
onready var idx = 0 # global loop iterator ;-; for now
var score
var answer

func _ready():
	score = 0
	pause_mode = Node.PAUSE_MODE_PROCESS
	if Global.show_confirm: confirm.visible = true
	else: confirm.visible = false
	start()
	
# [PLANNED PROCESS] > display elements > listen buttons > update
# listen > show_confirm_button > submit > check_answer > update_score

func start()->void:
	update_disp()
	idx = -1 # cheeky offset
	for i in problems:
		idx += 1
		yield(self,"next_question")
	show_results()

func update_disp()->void:
	var base = str(problems[idx]["base"])
	var argument = str(problems[idx]["argument"])
	var exponent = str(problems[idx]["exponent"])
	choices[0].text = str(problems[idx]["choice1"])
	choices[1].text = str(problems[idx]["choice2"])
	choices[2].text = str(problems[idx]["choice3"])
	choices[3].text = str(problems[idx]["choice4"])
	question.text = "LOG_"+base+" ("+argument+") = "+exponent
	confirm.visible = false
	scorelabel.text = "Score: "+str(score)

func try_show_confirm_button() -> bool:
	if Global.show_confirm:
		confirm.visible = true
		return true
	return false

func check_answers():
	if answer == problems[idx]["answer"]:
		score += 10
	emit_signal("next_question")
	update_disp()

func submit_answer(choice):
	answer = problems[idx][choice]
	var isshown = try_show_confirm_button()
	if isshown == false:
		check_answers()

func show_results():
	var new = lvlcomplete.instance()
	add_child(new)
	yield(new,"tree_exited")
	SceneTransition.change_scene("res://scenes/LevelSelect.tscn")
	if score > 0:
		Global.level_stars[0] = int(floor(float(score/10)/float(len(problems))*3))
	if Global.unlocked_levels < 2:
		Global.unlocked_levels = 2

# [Buttons] =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

func _on_PauseButton_pressed():
	var new = pausebox.instance()
	get_tree().paused = true
	add_child(new)
func _on_A_pressed(): submit_answer("choice1")
func _on_B_pressed(): submit_answer("choice2")
func _on_C_pressed(): submit_answer("choice3")
func _on_D_pressed(): submit_answer("choice4")

func _on_ConfirmButton_pressed():
	check_answers()
