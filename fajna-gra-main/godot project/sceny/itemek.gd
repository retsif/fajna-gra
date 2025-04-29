extends Area2D

@onready var hud = %hud
@onready var animated_sprite_2d = $AnimatedSprite2D



func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		#queue_free()
		hud.add_point()
		animated_sprite_2d.animation = "zebrany"
	


func _on_animated_sprite_2d_animation_finished():
	#if animated_sprite_2d == "zebrany":
		queue_free()
