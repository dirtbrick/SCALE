# use animation player instead,, this thingcannot handle fast user inputs
extends Control

onready var P=$Levels/AspectRatioContainer/GridContainer/Path2D/PathFollow2D
onready var back = $Levels/Back
onready var tree = $Levels/Tree
onready var level1 = $Levels/AspectRatioContainer/GridContainer/level1
onready var level2 = $Levels/AspectRatioContainer/GridContainer/level2
onready var level3 = $Levels/AspectRatioContainer/GridContainer/level3
onready var lvl2_lock = $Levels/AspectRatioContainer/GridContainer/level2/NinePatchRect
onready var lvl3_lock = $Levels/AspectRatioContainer/GridContainer/level3/NinePatchRect
onready var lvl2_star_slot = $Levels/AspectRatioContainer/GridContainer/level2/ReferenceRect
onready var lvl3_star_slot = $Levels/AspectRatioContainer/GridContainer/level3/ReferenceRect

var islenum := 1
var moveup := false
var movedown := false
var stopat := 1


signal finished_moving

func _ready():
	update_unlocks()

func update_unlocks():
	var unlocked_levels = Global.unlocked_levels
	for star in range(len(Global.level_stars)):
		if Global.level_stars[star] > 0:
			print("something")
			show_star(star)
	if unlocked_levels >= 2:
		level2.disabled = false
		lvl2_star_slot.visible = true
		level2.modulate = Color(1,1,1,1)
		lvl2_lock.queue_free()
		#reference for when we plan to animate the unlock process
		#lvl2_lock.region_rect = Rect2(486,455,224,314) 
		
	if unlocked_levels >= 3:
		level3.disabled = false
		lvl3_star_slot.visible = true
		level3.modulate = Color(1,1,1,1)
		lvl3_lock.queue_free()
		#lvl3_lock.region_rect = Rect2(486,455,224,314)

func move(destination:int):
	if islenum < destination: 
		moveup = true
		movedown = false
	elif islenum > destination:
		movedown = true
		moveup = false
	stopat = destination


func _process(delta):
	if moveup == true:
		P.unit_offset += 0.01
	elif movedown == true:
		P.unit_offset -= 0.01
	
	if P.unit_offset <= 0 and stopat == 1:
		islenum = 1
		moveup = false
		movedown = false
		emit_signal("finished_moving")
	
	# if on isle 2
	if P.unit_offset >= 0.51 and P.unit_offset <= 0.52 and stopat == 2:
		islenum = 2
		moveup = false
		movedown = false
		emit_signal("finished_moving")
	if P.unit_offset >= 1.0 and stopat == 3:
		islenum = 3
		moveup = false
		movedown = false
		emit_signal("finished_moving")

# [Buttons]=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

func _on_Back_pressed():
	SceneTransition.change_scene("res://scenes/Home.tscn")
func _on_Tree_pressed():
	SceneTransition.change_scene("res://scenes/Tree.tscn")
func _on_level1_pressed():
	move(1)
	yield(self, "finished_moving")
	SceneTransition.change_scene("res://scenes/levels/Level1(REAL).tscn")
func _on_level2_pressed():
	move(2)
	yield(self, "finished_moving")
	SceneTransition.change_scene("res://scenes/levels/Level1(REAL).tscn")
func _on_level3_pressed():
	move(3)

	
func _on_Back_button_down():ButtonAnimations.animate(back,ButtonAnimations.RBOUNCE)
func _on_Back_button_up(): ButtonAnimations.animate(back,ButtonAnimations.BOUNCE)

func _on_level1_button_down(): ButtonAnimations.animate(level1,ButtonAnimations.RSQUISH)
func _on_level1_button_up(): ButtonAnimations.animate(level1,ButtonAnimations.SQUISH)


func _on_Tree_button_down(): ButtonAnimations.animate(tree,ButtonAnimations.RBOUNCE)
func _on_Tree_button_up(): ButtonAnimations.animate(tree,ButtonAnimations.BOUNCE)

# [Conditional]=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
func show_star(lvnum: int): # show a star if level is completed once
	var levels = [$Levels/AspectRatioContainer/GridContainer/level1/ReferenceRect2]
	var star = levels[lvnum - 1]
	star.visible = true
	#ButtonAnimations.animate(star,ButtonAnimations.POPOUT)



