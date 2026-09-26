# Attach this to your Area2D/Area3D root node
extends Area2D
@export var menu : Control
@export var fall_speed: float = 200.0
var lives : int = 3
@export var lives_label : Label
func _process(delta: float) -> void:
	if lives <= 0 :
		get_tree().paused = true
		menu.visible= true

	# Move downward over time
	position.y += fall_speed * delta
	
	# Delete the item if it falls off the screen (adjust 800 based on window height)
	if position.y > 700:
		position.x = randi_range(30,1100)
		position.y = -50

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bin":
		lives -= 1
		lives_label.text = "Lives: " + str(lives)
		position.x = randi_range(30,1100)
		position.y = -50
