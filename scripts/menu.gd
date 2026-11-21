extends Control


func _ready() -> void:
	$ButtonsContainer/PlayButton.grab_focus()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/learning_center_course.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
