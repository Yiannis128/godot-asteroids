extends Control

func _process(delta: float) -> void:
    $Score.text = str(PlayerStats.player_score)
