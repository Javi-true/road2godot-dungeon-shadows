extends CharacterBody2D

const ACCELERATION = 300
const MAX_SPEED = 100
const FRICTION = 1200


#Funcion para mover jugador
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	#si se preciona la tecla el Input tiene valor de 1, si no de 0.
	# x = 1 = derecha.
	# x = -1 = izquierda.
	# y = 1 = abajo.
	# y = -1 = arriba.
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#print(input_vector)
	#cambia distancia del vector en diagonal para que la velocidad no sea mayor en diagonal.
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.limit_length(MAX_SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#delta es un valor que representa el frame rate.
	#move_and_collide(velocity)
	move_and_slide()
