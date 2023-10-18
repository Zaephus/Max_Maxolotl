extends Node2D

#@export var foodPrefab : PackedScene
#@export_range(0, 30) var foodAmount : int

#@export var bounds : Vector2

func _ready():
	pass
#	for i in foodAmount:
#		var instance = foodPrefab.instantiate()
#		add_child(instance)
#		var randX = randi_range(-bounds.x, bounds.x)
#		var randY = randi_range(-bounds.y, bounds.y)
#		instance.position = Vector2(randX, randY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
