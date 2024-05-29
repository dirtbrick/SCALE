# currently incomplete, could be deleted
extends Node2D

onready var LVL1 = preload("res://scenes/levels/Level1(REAL).tscn")

func _ready():
	add_child(LVL1.instance())
