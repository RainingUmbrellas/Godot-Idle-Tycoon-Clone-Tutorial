extends Node2D
class_name Cashier

@export var move_speed:= 50.0

@onready var animation_player = $AnimationPlayer


func move_to_customer() -> void:
	# Create tween
	# Move
	animation_player.play("move")
	
func move_to_item_position() -> void:
	# Create tween
	# Move to item counter pos
	# Start cook time
	animation_player.play("idle") 
