extends CanvasLayer

var animator: AnimationPlayer
var color: ColorRect

func _ready():
	animator = get_node("AnimationPlayer")
	color = get_node("curtain")
	
func change_scene(path):
	color.show()
	animator.play("fade")
	await animator.animation_finished
	get_tree().change_scene_to_file(path)
	animator.play_backwards("fade")
	await animator.animation_finished
	color.hide()
