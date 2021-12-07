extends Node

@export var spawn_rate : float = 2
var spawn_rate_left : float = 0

@export_node_path(Node) var target_path : NodePath = ""
var target : Node = null

var asteroid_scene : PackedScene = preload("res://objects/Asteroid.tscn")
var asteroid_speed : float = 150
var spawn_distance_offset : float = 500

func _ready() -> void:
    randomize()
    spawn_rate_left = spawn_rate
    target = get_node_or_null(target_path)

func _process(delta : float) -> void:
    if target == null:
        return

    # If spawn_rate_left hits 0, then spawn an asteroid, and reset the timer.
    if spawn_rate_left <= 0:
        spawn_asteroid()
        spawn_rate_left = spawn_rate
    
    # If the spawn_rate_left is higher than 0, then decrement it.
    if spawn_rate_left > 0:
        spawn_rate_left -= delta

func get_new_asteroid_position() -> Vector2:
    # Get the size of the screen.
    var size : Vector2 = get_viewport().size
    
    var rand_ang : float = randf_range(0, 2 * PI)
    var center : Vector2 = size / 2
    
    var spawn_offset : Vector2 = Vector2.RIGHT.rotated(rand_ang) * spawn_distance_offset
    var spawn_location : Vector2 = center + spawn_offset
    
    return spawn_location

func spawn_asteroid() -> void:
    if target == null:
        return

    # Spawn the asteroid.
    var asteroid : Node = asteroid_scene.instantiate()
    
    # Find a random position to spawn the asteroid to.
    asteroid.position = get_new_asteroid_position()
    
    # Set the asteroid move_dir towards target.
    var offset : Vector2 = target.position - asteroid.position
    asteroid.move_dir = offset.normalized() * asteroid_speed
    
    # Add the asteroid to the scene.
    add_sibling(asteroid) 
