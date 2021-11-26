extends CharacterBody2D

@export var turn_speed : float = 3

@export var fire_cooldown : float = 0.75
var fire_cooldown_left : float = 0
const bulletPackedScene : PackedScene = preload("res://objects/ShipBullet.tscn")

func fire_bullet():
    var bullet : Node = bulletPackedScene.instantiate()
    add_sibling(bullet)
    bullet.global_rotation = global_rotation - PI / 2
    bullet.global_position = global_position

func _process(delta: float) -> void:
    # If space is pressed and the timer has reached or is less than 0, then
    # fire the bullet and reset the timer.
    if Input.is_key_pressed(KEY_SPACE) and fire_cooldown_left <= 0:
        fire_bullet()
        fire_cooldown_left = fire_cooldown
    
    # If the timer is not less than 0, then decrement it by the delta.
    if fire_cooldown_left > 0:
        fire_cooldown_left -= delta

func _physics_process(delta: float) -> void:
    var move_dir : int = 0
    
    # If left is pressed, then move direction will be set to -1
    if Input.is_key_pressed(KEY_LEFT):
        move_dir = -turn_speed
    
    # If right is pressed, then move direction will be set to 1.
    if Input.is_key_pressed(KEY_RIGHT):
        move_dir = turn_speed
        
    # We now rotate the ship left or right depending on if move_dir is a
    # positive or negative number.
    rotate(move_dir * delta)
    
    
