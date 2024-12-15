class_name PrototypeGenerator
extends View
## A generator prototype creating stardust.


## Reference to the button that starts the generation of stardust.
@export var button : Button
## Reference to the timer contoling the pace of the generation of stardust.
@export var timer : Timer


##Initialize the label.
func _ready() -> void:
	super()
	visible = true


## Start the generation of stardust and disable the starting button.
func begin_generating_stardust() -> void :
	timer.start()
	button.disabled = true


## Create 1 stardust.
func create_stardust() -> void :
	HandlerStardust.ref.create_stardust(1)


## Triggerred when the "generate stardust" button is pressed.
func _on_button_pressed() -> void:
	begin_generating_stardust()


## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_stardust()
