extends RigidBody3D

@export var thrust: float = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("thrust"):
		apply_central_force(basis.y * delta * thrust)
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0,0.0, 100) * delta)
		
		
	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0,0.0, -100) * delta)

func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		print("You win!")
	if "Hazard" in body.get_groups():
		print("You crashed! Try Again")
