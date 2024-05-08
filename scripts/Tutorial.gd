extends Control

func _ready():
	pass

const lines: Array = [#array of string
	"gddtydfhcghvghv",
	"iubivgjvghbib",
	"bh",
	"uyvghvghvyivyvyivyjvyivyuvyudtufyufuyfyuctyd6u"
]

func _on_Tortol_pressed():
	DialogManager.start_dialog(get_global_transform().origin,lines)
