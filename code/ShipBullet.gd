class_name ShipBullet
extends Area2D

var speed : float = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    position += Vector2(speed * delta, 0).rotated(rotation)
