class_name PrototypeClicker
extends View
## A clicker prototype creating stardust.



## Initialize the label.
func _ready() -> void:
	super()
	visible = false



## Triggerred when the create stardust button is pressed.
func _on_button_pressed() -> void:
	create_stardust()


## Create 1 stardust.
func create_stardust() -> void :
		HandlerStardust.ref.trigger_clicker()
