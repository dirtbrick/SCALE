tool
extends Label

onready var dynamic_font := DynamicFont.new()
export var fit_height := true

func _ready():
	pass

func _on_Label_fit_resized():
	dynamic_font.font_data = load("res://fonts/lazy_dog.ttf")
	dynamic_font.size = rect_size.y
	set("fonts/font", dynamic_font)
