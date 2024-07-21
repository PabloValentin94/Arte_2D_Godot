extends CharacterBody2D

const movement_speed = 300.0

func _ready() -> void:
	
	print(Input.get_axis("ui_left", "ui_right"), "\n")
	
	print(Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"))

func _physics_process(_delta) -> void:
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * movement_speed

	move_and_slide()
