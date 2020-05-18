extends Control

var scene_path_to_load

func _ready():
	if Input.is_action_pressed("Escape"):
		get_tree().quit()
	for button in $menu/centerrow/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()
	
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)

func get_input():
	if Input.is_action_pressed("Escape"):
		get_tree().quit()
	
