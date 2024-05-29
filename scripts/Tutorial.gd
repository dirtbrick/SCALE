extends Control

onready var progressbar = $VBoxContainer/Panel/MarginContainer/VBoxContainer/TextureProgress
onready var prevbutton = $VBoxContainer/UsefulContainer/NextButton
onready var nextbutton = $VBoxContainer/UsefulContainer/HBoxContainer/PrevButton
onready var page1 = $VBoxContainer/Panel/MarginContainer/VBoxContainer/MarginContainer
export (int, 100) var tabs := 1

var page = 1
var maxpage = 5

func _ready():
	progressbar.value = int((float(page)/float(maxpage)) * 100)


func flip_page(pagenum: int):
	#print("Before: ",page)
	progressbar.value = int((float(pagenum)/float(maxpage)) * 100)
	page = pagenum
	if page == 1:
		page1.visible = true
	else:
		page1.visible = false
	#print("After: ", page)

# [Buttons] =-=-==-=-=-==-=-=-==-=--=-=-=-=-=-=-
func _on_NinePatchRect_pressed(): SceneTransition.change_scene("res://scenes/Home.tscn")
func _on_PrevButton_pressed(): flip_page(page - 1 if page > 1 else 1)
func _on_NextButton_pressed(): flip_page(page + 1 if page < maxpage else maxpage)
