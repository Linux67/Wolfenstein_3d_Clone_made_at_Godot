extends CanvasLayer

func _ready():
	$AnimatedSprite2D.animation_finished.connect(_on_AnimatedSprite2D_animation_finished)

func _process(delta):
	if Input.is_action_just_pressed("mouse_right"):
		if Global.current_weapon == "knife":
			$AnimatedSprite2D.play("stab")
		elif Global.current_weapon == "gun":
			if Global.ammo > 0:
				$AnimatedSprite2D.play("gun_shoot")
				Global.ammo -= 1
			else:
				Global.current_weapon = "knife"
				$AnimatedSprite2D.play("knife_ide")
				

func _on_AnimatedSprite2D_animation_finished():
	if  Global.current_weapon == "knife":
		$AnimatedSprite2D.play("knife_ide")
	if  Global.current_weapon == "gun":
		$AnimatedSprite2D.play("gun_idle")
	
	
