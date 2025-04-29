extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0

const wall_jump_puchback = 1000

const wall_slide_gravity = 100
var is_wall_sliding = false

var max_skoku = 2
var licznik_skoku = 0 

@onready var animation = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
const gravity = 2000


func _physics_process(delta):
	
	if (is_on_floor() or is_on_wall()) and licznik_skoku!=0:
		licznik_skoku=0
	
	if Input.is_action_pressed("lewo"):
		$Sprite2D.scale.x = 3
	elif Input.is_action_pressed("prawo"):
		$Sprite2D.scale.x = -3
	
	if (velocity.x > 1  || velocity.x < -1):
		animation.play("bieganie")
	else:
		animation.play("idle")
		
	velocity.y += delta * gravity
	
	var direction = Input.get_axis("lewo", "prawo")
	velocity.x = direction * SPEED
	velocity.x = move_toward(velocity.x, 0, 25)
	
	if not is_on_floor() and not is_on_wall():
		animation.play("skakanie")
	
	if licznik_skoku < max_skoku:
		if Input.is_action_just_pressed("skok"):
			#if is_on_floor():
			velocity.y = JUMP_VELOCITY
			licznik_skoku += 1
			
			if is_on_wall() and Input.is_action_pressed("prawo"):
				#velocity.y = JUMP_VELOCITY
				velocity.x = -wall_jump_puchback
				
			if is_on_wall() and Input.is_action_pressed("lewo"):
				#velocity.y = JUMP_VELOCITY
				velocity.x = wall_jump_puchback

	if is_on_wall() and not is_on_floor():
		if Input.is_action_pressed("lewo") or Input.is_action_pressed("prawo"):
			animation.play("skakanie_sciany")
			is_wall_sliding = true
		else:
			is_wall_sliding = false
	else:
		is_wall_sliding = false
		
	if is_wall_sliding:
		velocity.y += (wall_slide_gravity * delta)
		velocity.y = min(velocity.y, wall_slide_gravity)
	
	move_and_slide()
	#if is_on_floor() and licznik_skoku!=0:
	#	licznik_skoku=0
		
	#if licznik_skoku < max_skoku:
	#	if Input.is_action_just_pressed("skok"): #and is_on_floor():
	#		velocity.y = JUMP_VELOCITY
	#		licznik_skoku += 1
