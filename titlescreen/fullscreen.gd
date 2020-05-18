extends Button

func _input(event):
	if is_pressed():
		OS.window_fullscreen = true;
	else:
		OS.window_fullscreen = false
		
	
	
