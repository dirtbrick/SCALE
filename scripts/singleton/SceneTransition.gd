extends CanvasLayer

func _ready():
	pass

signal anim_finished

enum {
	WAVE, SCOPE
}

#-=-=-=- temporary for specfic timings, pls change sometime [TvT] - lj -=-=-=-=-=-=-=
""" #Example use case
SceneTransition.animate_change_scene("res://scenes/Tutorial.tscn",SceneTransition.SCOPE)
SceneTransition.animate_change_scene("res://scenes/Tutorial.tscn",SceneTransition.SCOPE,
[SceneTransition.add(),
yield(SceneTransition.play("ScopeIN1"),"completed"),
SceneTransition.change(),
yield(SceneTransition.play("ScopeIN2"),"completed"),
SceneTransition.remove()])
"""
var a
var t

func add():
	add_child(a)
func remove():
	remove_child(a)
func play(animation): 
	a.play([animation])
	yield(self,"anim_finished")
func change():
	get_tree().change_scene(t)

func animate_change_scene(target:String, transition:= WAVE, animation:= [])->void:
	t= target
	match transition:
		WAVE:
			a = load("res://scenes/ui/Wave.tscn").instance()
		SCOPE:
			a = load("res://scenes/ui/Scope.tscn").instance()
	
	
#-=-=-=-=-=-=--=-=-=-=-=-=--=-=-=-=-=-=--=-=-=-=-=-=--=-=-=-=-=-=--=-=-=-=-=-=-
func change_scene(target: String, transition:= WAVE, animation:= [""]) -> void:
	match transition:
		WAVE:
			a = load("res://scenes/ui/Wave.tscn").instance()
		SCOPE:
			a = load("res://scenes/ui/Scope.tscn").instance()
	match animation:
		[""]:
			self.add_child(a)
			yield(self,"anim_finished")
			get_tree().change_scene(target)
			a.play()
			yield(self,"anim_finished")
			self.remove_child(a)
		_:
			self.add_child(a)
			a.play(animation)
			yield(self,"anim_finished")
			get_tree().change_scene(target)
			self.remove_child(a)
