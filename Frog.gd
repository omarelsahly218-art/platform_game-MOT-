extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	# Gravity for Frog
	velocity.y += gravity * delta
	
	if chase:
		if player == null:
			player = get_node_or_null("../../Player/Player")
			if player == null:
				return  # Can't chase if no player found

		var direction = (player.position - self.position).normalized()
		
		# Flip frog based on direction
		get_node("AnimatedSprite2D").flip_h = direction.x > 0
		
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0  # Stop moving when not chasing

	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		player = body  # Save reference

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
		player = null
