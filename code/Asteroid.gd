extends Area2D

func _ready() -> void:
    connect("area_entered", area_entered)

func area_entered(area : Area2D) -> void:
    queue_free()

