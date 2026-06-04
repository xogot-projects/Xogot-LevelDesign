class_name Coin
extends Area3D

signal coin_collected

const ROTATION_SPEED: float = 300.0


func _process(delta: float) -> void:
	rotation_degrees.y += ROTATION_SPEED * delta
	

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		#var canvas_layer: UserInterface = get_tree().get_first_node_in_group("CanvasLayer")
		#canvas_layer.update_coins()
		coin_collected.emit()
		
		var coin_audio: AudioStreamPlayer = get_tree().get_first_node_in_group("CoinAudio")
		coin_audio.play()
		
		queue_free()
