# For storing global variables
extends Node

# todo: save and load this from file
onready var show_confirm := false
onready var level_stars := [0] # add more element per new level 
onready var unlocked_levels := 1
onready var total_score := 0


func _ready():
	pass
