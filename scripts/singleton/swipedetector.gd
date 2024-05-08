extends Camera2D

func _ready():
	pass

var length = 100
var startPos:Vector2
var curPos:Vector2
var swiping = false
signal swipe_left
signal swipe_right
signal swipe_up
signal swipe_down

var threshold = 50

# TODO: delete print functions on release
func _process(_delta):
	if Input.is_action_just_pressed("press"):
		if !swiping:
			swiping = true
			startPos = get_global_mouse_position()
			print("Start: ",startPos)
	if Input.is_action_pressed("press"):
		if swiping:
			curPos = get_global_mouse_position()
			if startPos.distance_to(curPos) >= length:
				if abs(startPos.y-curPos.y) <= threshold:
					if startPos.x-curPos.x < 0:
						emit_signal("swipe_right")
						print("right",startPos.y-curPos.y)
					else:
						print("left",startPos.y-curPos.y)
						emit_signal("swipe_left")
					swiping = false
				elif abs(startPos.x-curPos.x) <= threshold:
					if startPos.y - curPos.y > 0:
						emit_signal("swipe_up")
					else:
						emit_signal("swipe_down")
					swiping = false
	else:
		swiping = false
