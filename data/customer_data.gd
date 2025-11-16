extends Resource
class_name CustomerData

@export_file("*.png") var body_sprite_path: String
@export_file("*.png") var face_sprite_path: String
@export_file("*.png") var hand_sprite_path: String

func get_body_texture() -> Texture2D:
	return load(body_sprite_path)

func get_face_texture() -> Texture2D:
	return load(face_sprite_path)

func get_hand_texture() -> Texture2D:
	return load(hand_sprite_path)
