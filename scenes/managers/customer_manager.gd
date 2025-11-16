extends Node
class_name CustomerManager

@export var spawn_positions: Array[Marker2D]
# Not needed anymore due to generate_random func
@export var customer_sprites: Array[CustomerData] 
@export var customer_scene: PackedScene

func _ready() -> void:
	spawn_customer()

func spawn_customer() -> void:
	var customer: Customer = customer_scene.instantiate()
	add_child(customer)
	"""
	# Populate customer sprites with 5 randomly generated customers
	for i in 5: 
		customer_sprites.append(generate_random())
	print(customer_sprites.size())
	"""
	# Get Random sprite
	var sprite_data: CustomerData = generate_random()  #customer_sprites.pick_random()
	customer.set_sprites(sprite_data)
	
	# Get random spawning pos
	var random_start_pos: Marker2D = spawn_positions.pick_random()
	customer.position = random_start_pos.position
	customer.play_move_anim()
	
	# Move the customer
	var tween: Tween = create_tween()
	tween.tween_property(customer, "position", customer.position + Vector2.RIGHT * 1350, 5.0)
	tween.finished.connect(func(): customer.queue_free())

const COLORS = ["blue", "green", "pink", "yellow", "purple", "red"]
const BODY_TYPES = ["circle", "rhombus", "square", "squircle"]
const HAND_TYPES = ["closed", "open", "peace", "point", "rock", "thumb"]
const FACES = ["face_a", "face_b", "face_c", "face_d", "face_e", "face_f",
"face_g", "face_h", "face_i", "face_j", "face_k", "face_l",]
const BASE_PATH = "res://Idle Tycoon Assets/Sprites/Characters/"

func generate_random() -> CustomerData:
	var data = CustomerData.new()
	var color = COLORS.pick_random()
	var body_type = BODY_TYPES.pick_random()
	var hand_type = HAND_TYPES.pick_random()
	var face = FACES.pick_random()
	
	data.body_sprite_path = BASE_PATH + "%s_body_%s.png" %  [color, body_type]
	data.hand_sprite_path = BASE_PATH + "%s_hand_%s.png" %  [color, hand_type]
	data.face_sprite_path = BASE_PATH + "%s.png" % face

	return data


func _on_spawn_timer_timeout():
	spawn_customer()
