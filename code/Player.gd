extends CharacterBody2D

func _physics_process(delta: float) -> void:
    var move_dir : int = 0
    
    # If left is pressed, then move direction will be set to -1
    if Input.is_key_pressed(KEY_LEFT):
        move_dir = -1
    
    # If right is pressed, then move direction will be set to 1.
    if Input.is_key_pressed(KEY_RIGHT):
        move_dir += 1
        
    # We now rotate the ship left or right depending on if move_dir is a
    # positive or negative number.
    rotate(move_dir * delta)
    
    
