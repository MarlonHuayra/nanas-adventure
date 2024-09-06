extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Firebase.Auth.login_succeeded.connect(on_login_succeeded)
	Firebase.Auth.signup_succeeded.connect(on_signup_succeeded)
	Firebase.Auth.login_failed.connect(on_login_failed)
	Firebase.Auth.signup_failed.connect(on_signup_failed)
	
	if Firebase.Auth.check_auth_file():
		%StateLabel.text = "Logged in"
		
		# Usa call_deferred para cambiar la escena
		#call_deferred() retrasa la ejecución de un método hasta que el motor de Godot 
		#haya terminado de procesar el ciclo actual del árbol de nodos. Esto asegura 
		#que cualquier operación que pueda interferir con el estado actual del árbol de nodos se realice en un momento en el que el motor esté listo para manejarla.
		call_deferred("_change_scene")
		




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_login_button_pressed():
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.login_with_email_and_password(email, password)
	%StateLabel.text = "Logging in"

func _on_signup_button_pressed():
	var email = %EmailLineEdit.text
	var password = %PasswordLineEdit.text
	Firebase.Auth.signup_with_email_and_password(email, password)
	%StateLabel.text = "Singing up"

func on_login_succeeded(auth):
	print(auth)
	%StateLabel.text = "Login success!"
	Firebase.Auth.save_auth(auth)
	call_deferred("_change_scene")
	
func on_signup_succeeded(auth):
	print(auth)
	%StateLabel.text = "Sign up success!"
	Firebase.Auth.save_auth(auth)
	call_deferred("_change_scene")	
func on_login_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Login failed. Error: %s" % message
	
func on_signup_failed(error_code, message):
	print(error_code)
	print(message)
	%StateLabel.text = "Sign up failed. Error: %s" % message
	
func _change_scene():
	get_tree().change_scene_to_file("res://scenes/levels/game.tscn")
