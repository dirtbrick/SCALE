extends MarginContainer

onready var label = $MarginContainer/Label
onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 1000

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()

func display_text(text_to_disp: String):
	print("text",text_to_disp)
	text = text_to_disp
	label.text = text
	"""
	yield(self,"resized")
	rect_min_size.x = min(rect_size.x,MAX_WIDTH)
	
	if rect_size.x > MAX_WIDTH:
		label.autowrap=true
		yield(self,"resized") # wait for x
		yield(self,"resized") # wait for y
		rect_min_size.y = rect_size.y
	rect_global_position.x -= rect_size.x/2
	rect_global_position.y -= rect_size.y + 24"""
	label.text=""
	_display_letter()

func _display_letter():
	label.text += text[letter_index]
	letter_index += 1
	if letter_index >= text.length():
		emit_signal("finished_displaying")
		return
	match text[letter_index]:
		"!",".",",","?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)
			
func _ready():
	pass



func _on_LetterDisplayTimer_timeout():
	_display_letter()
