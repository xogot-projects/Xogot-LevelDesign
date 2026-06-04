# Spike block wide script
extends BaseObstacle


func _collided_with_player() -> void:
	decrease_lives(3)
