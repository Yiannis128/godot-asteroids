class_name Asteroid
extends Area2D

var move_dir : Vector2 = Vector2.ZERO

func _ready() -> void:
    connect("area_entered", area_entered)

func area_entered(area : Area2D) -> void:
    if area.get_parent() is PlayerShip:
        return
    
    if !(area is Asteroid):
        PlayerStats.player_score += 1
    
    queue_free()

func _physics_process(delta: float) -> void:
    position += move_dir * delta
