extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer.play("Wave")
	yield($AnimationPlayer, 'animation_finished')
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("Wave")
