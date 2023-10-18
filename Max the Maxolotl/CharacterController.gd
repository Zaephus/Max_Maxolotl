extends CharacterBody2D

@export_range(1000, 10000) var speed : float = 2000.0

@export var body : Node2D
@export var trigger : Area2D
@export var label : Label
@export var animSprite : AnimatedSprite2D

var score : int = 0

func _ready():
	#var trigger = get_node("CollisionShape2D/Area2D")
	trigger.area_entered.connect(_on_body_entered)
	trigger.area_exited.connect(_on_body_exited)

func _physics_process(delta):
	
	var horizontal = Input.get_axis("Move Left", "Move Right")
	var vertical = Input.get_axis("Move Up", "Move Down")
	
	var direction = Vector2(horizontal, vertical).normalized()
	
	if direction != Vector2.ZERO:
		_move(delta, direction)
	else:
		animSprite.pause()

func _move(delta, direction):
	animSprite.play()
	velocity = direction * speed * delta
	body.look_at(direction + position)
	body.rotation_degrees += 90
	
	move_and_slide()

func _on_body_entered(body: Node2D):
	if body.is_in_group("Food"):
		body.get_parent().queue_free()
		score += 1
		label.text = "Score: " + str(score)

func _on_body_exited(body: Node2D):
	pass
