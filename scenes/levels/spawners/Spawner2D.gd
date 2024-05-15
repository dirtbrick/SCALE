extends Position2D

export var spawn_scene: PackedScene

var random = RandomNumberGenerator.new()

func spawn(_spawn_scene := spawn_scene) -> void:
  # Creates a new instance of the _spawn_scene
	var spawn := _spawn_scene.instance() as Button

	add_child(spawn)

  # Prevents the Spawner2D transform from affecting the new instance
	spawn.set_as_toplevel(true)

  # Move the new instance to the Spawner2D position
	#variace
	var size = get_viewport().get_visible_rect().size.x
	var x=random.randi_range(size*0.1,size-(size*0.1))
	print(size*0.1,size-(size*0.1))
	spawn.rect_global_position = Vector2(x,global_position.y)
