extends Node2D
class_name Customer

@onready var body = $Visuals/Body
@onready var face = $Visuals/Face
@onready var hand_left = $Visuals/HandLeft
@onready var hand_right = $Visuals/HandRight
@onready var anim_player = $AnimationPlayer

func set_sprites(data: CustomerData) -> void:
	body.texture = data.get_body_texture()
	face.texture = data.get_face_texture()
	hand_left.texture = data.get_hand_texture()
	hand_right.texture = data.get_hand_texture()

func play_move_anim() -> void:
	anim_player.play("move")  
