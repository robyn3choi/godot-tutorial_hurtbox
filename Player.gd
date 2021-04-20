extends KinematicBody2D

const invincibility_duration = 1.5

onready var hurtbox = $Hurtbox
onready var blinker = $Blinker


func _physics_process(delta):
	var move_direction = Vector2(
		int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left')),
		int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up'))
	)
	var velocity = move_direction.normalized() * 300
	move_and_slide(velocity)


func _on_Hurtbox_area_entered(area: Area2D) -> void:
	if !hurtbox.is_invincible:	
		print("ouch")
		hurtbox.start_invincibility(invincibility_duration)
		blinker.start_blinking(self, invincibility_duration)
