tool
extends RichTextEffect
class_name RichTextLogarithm

var bbcode:="_"

# Override _process_custom_fx to apply the custom effect
func _process_custom_fx(char_fx):
	var offset = Vector2(0, 15)
	char_fx.offset = offset
	
	return true
