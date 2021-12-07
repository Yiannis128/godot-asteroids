extends Area2D

var move_dir : Vector2 = Vector2.ZERO

func _ready() -> void:
    connect("area_entered", area_entered)

func area_entered(area : Area2D) -> void:
    queue_free()

func _physics_process(delta: float) -> void:
    position += move_dir * delta
