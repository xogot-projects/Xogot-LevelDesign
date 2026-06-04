extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		var canvas_layer: UserInterface = get_tree().get_first_node_in_group("CanvasLayer")
		canvas_layer.game_over()
