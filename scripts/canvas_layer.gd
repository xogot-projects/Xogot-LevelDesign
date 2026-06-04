class_name UserInterface
extends CanvasLayer

@export var target_scene: PackedScene

var coins: int
var target_coins: int

@onready var coins_label: Label = $CoinsPanel/HBoxContainer/CoinsLabel
@onready var game_over_panel: Panel = $GameOverPanel
@onready var you_win_panel: Panel = $YouWinPanel
@onready var coins_container: Node3D = $"../Containers/CoinsContainer"


func _ready() -> void:
	target_coins = coins_container.get_child_count()
	
	var coins_array: Array[Node] = get_tree().get_nodes_in_group("Coin")
	for coin: Coin in coins_array:
		coin.coin_collected.connect(_on_coin_coin_collected)

func _on_coin_coin_collected() -> void:
	coins += 1
	coins_label.text = "x " + str(coins)
	
	if coins == target_coins:
		_finish_game_session(you_win_panel)


func game_over() -> void:
	_finish_game_session(game_over_panel)
	
	
func _finish_game_session(panel_to_show: Panel) -> void:
	panel_to_show.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true


func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_next_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(target_scene)
