class_name BaseObstacle 
extends Area3D

@export var can_rotate: bool = true


const ROTATION_SPEED: float = 200.0

var counter: int = 0


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	counter += 1
	
	
func _process(delta: float) -> void:
	if can_rotate:
		rotation_degrees.z += ROTATION_SPEED * delta


func game_over() -> void:
	var canvas_layer: UserInterface = get_tree().get_first_node_in_group("CanvasLayer")
	canvas_layer.game_over()


func decrease_lives(lives_to_remove: float) -> void:
	var player: Node3D = get_tree().get_first_node_in_group("Player")
	player.lives -= lives_to_remove
	
	if player.lives <= 0:
		game_over()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		_collided_with_player()

func _collided_with_player() -> void:
	pass

	
