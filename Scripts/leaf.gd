# Attach this to your Area2D/Area3D root node
extends Area2D
@export var fall_speed: float = 200.0
var score : int = 0
@export var score_label : Label
func _process(delta: float) -> void:
	# Move downward over time
	position.y += fall_speed * delta
	
	# Delete the item if it falls off the screen (adjust 800 based on window height)
	if position.y > 700:
		position.x = randi_range(10,1100)
		position.y = -10
func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Bin":
		score += 1
		score_label.text = "Score: " + str(score)

		position.x = randi_range(10,1100)
		position.y = -10
	
	
