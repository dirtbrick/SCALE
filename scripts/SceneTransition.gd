extends CanvasLayer

func change_scene(target: String) -> void:
	$"/root/SceneTransition".visible = true
	$AnimationPlayer.play("Wave")
	yield($AnimationPlayer, 'animation_finished')
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("Wave")
	yield($AnimationPlayer, 'animation_finished')
	$"/root/SceneTransition".visible = false
