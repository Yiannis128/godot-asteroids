extends Node

var player_score : int = 0

func player_dead() -> void:
    PlayerStats.player_score = 0
    get_tree().reload_current_scene()
