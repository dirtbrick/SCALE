extends Node

onready var text_box_scene = preload("res://scenes/ui/TextBox.tscn")

var dialog_lines: Array = [] # should be array of strings
var current_line_index = 0

var text_box
var text_box_position: Vector2

var is_dialog_active = false
var can_advance_line = false

func start_dialog(position: Vector2, lines: Array): #array string
	if is_dialog_active:
		return
	
	dialog_lines = lines
	text_box_position = position
	_show_text_box()
	
	is_dialog_active = true


func _show_text_box():
	text_box = text_box_scene.instance()
	text_box.connect("finished_displaying",self,"_on_text_box_finished_displaying")
	get_tree().root.add_child(text_box)
	text_box.get_global_transform().origin = text_box_position
	text_box.display_text(dialog_lines[current_line_index])
	can_advance_line = false
	

func _on_text_box_finished_displaying():
	can_advance_line = true
func _unhandled_input(event):
	if (
		event.is_action_pressed("advance_dialog") &&
		is_dialog_active &&
		can_advance_line
	):
		text_box.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			return
		_show_text_box()
