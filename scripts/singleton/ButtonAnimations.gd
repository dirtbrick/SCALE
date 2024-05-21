# base for reusable button animations
extends Button
class_name ButtonAnimation

enum{BOUNCE, RBOUNCE, SQUISH, RSQUISH}

var pixel_diff
var default

func _ready():
	pass # Replace with function body.

func animate(node: Button, animation) -> void:
	var tween:=create_tween()
	match animation:
		BOUNCE:
			tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
			node.rect_scale = Vector2(0.8,0.8)
			node.rect_rotation = -15.0
			tween.tween_property(node, "rect_scale", Vector2.ONE, 0.5)
			tween.parallel().tween_property(node, "rect_rotation", 0.0, 0.5)
		RBOUNCE:
			tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
			node.rect_scale = Vector2.ONE
			node.rect_rotation = 0
			tween.tween_property(node, "rect_scale", Vector2(0.8,0.8), 0.5)
			tween.parallel().tween_property(node, "rect_rotation", 15.0, 0.5)
		RSQUISH:
			tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
			pixel_diff = node.rect_size-(node.rect_size*0.8)
			default = node.rect_position 
			node.rect_scale = Vector2.ONE
			node.rect_position = Vector2(default.x,default.y)
			tween.tween_property(node, "rect_scale", Vector2(0.8,0.8),0.5)
			tween.parallel().tween_property(node, 'rect_position',Vector2(default.x+pixel_diff.x/2,default.y+pixel_diff.y/2),0.5)
		SQUISH:
			tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
			node.rect_scale = Vector2(0.8,0.8)
			node.rect_position = Vector2(default.x+pixel_diff.x/2,default.y+pixel_diff.y/2)
			tween.tween_property(node, "rect_scale", Vector2.ONE,0.5)
			tween.parallel().tween_property(node, 'rect_position', Vector2(default.x,default.y),0.5)
