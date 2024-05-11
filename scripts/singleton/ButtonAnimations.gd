# base for reusable button animations
extends Button
class_name ButtonAnimation

enum{BOUNCE, RBOUNCE}

func _ready():
	pass # Replace with function body.

func animate(node: Button, animation) -> bool:
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
			node.rect_scale = Vector2(1.0,1.0)
			node.rect_rotation = 0
			tween.tween_property(node, "rect_scale", Vector2(0.8,0.8), 0.5)
			tween.parallel().tween_property(node, "rect_rotation", 15.0, 0.5)
	return true
