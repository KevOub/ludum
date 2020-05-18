extends Button

func _input(event):
	if is_pressed():
		AudioServer.set_bus_mute(0,true)
	else:
		AudioServer.set_bus_mute(0,false)
