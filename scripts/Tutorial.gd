extends Control

func _ready():
	#DialogManager.start_dialog(get_global_transform().origin,lines)
	pass
const lines: Array = [#array of string
	"Hello! Remember exponentiation?",
	"[2^3=?] This equation tells yoou to multiply 2 by itself 3 times!",
	"[2^3=2*2*2=8] Got it?",
	"In seaweed terms, exponentiation simply tells you to eat seaweed a number of times to feel full!",
	"Now then what is logarithm?",
	"[log_2(8)=?] This equation asks you, how many 2 should I multiply by itself to get 8?",
	"Well.. 2*2=4, but it is not 8. So multiply again.. 4*2=8. We got it. How may twos did we use?",
	"That's right 3! so [log_2(8)=3]",
	"In other words, logarithms asks you, if I get full with 8 seaweeds, how many 2 bunched up seaweeds should you give me?"
]


