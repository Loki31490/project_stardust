class_name PrototypeGenerator
extends Control
## A generator prototype creating stardust.

## Reference to the label displaying the current amount of stardust created.
@export var label : Label
## Reference to the button that starts the generation of stardust.
@export var button : Button
## Reference to the timer contoling the pace of the generation of stardust.
@export var timer : Timer


## Current amount of stardust created.
var stardust : int = 0

##Initialize the label.
func _ready() -> void:
	update_label_text()


## Update the text of the label to reflect a change in stardust amount.
func update_label_text() -> void :
	label.text = "Stardust : %s" %stardust


## Start the generation of stardust and disable the starting button.
func begin_generating_stardust() -> void :
	timer.start()
	button.disabled = true


## Create 1 stardust.
func create_stardust() -> void :
	stardust += 1
	update_label_text()


## Triggerred when the "generate stardust" button is pressed.
func _on_button_pressed() -> void:
	begin_generating_stardust()


## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_stardust()
