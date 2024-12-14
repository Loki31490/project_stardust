class_name PrototypeGenerator
extends Control
## A generator prototype creating stardust.

## Reference to the label displaying the current amount of stardust created.
@export var label : Label
## Reference to the button that starts the generation of stardust.
@export var button : Button
## Reference to the timer contoling the pace of the generation of stardust.
@export var timer : Timer

## Reference to the User Interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


##Initialize the label.
func _ready() -> void:
	update_label_text()
	
	visible = true
	
	user_interface.navigation_requested.connect((_on_navigation_request))



## Temporary function to update the label.
func _process(_delta: float) -> void:
	update_label_text()


## Update the text of the label to reflect a change in stardust amount.
func update_label_text() -> void :
	label.text = "Stardust : %s" %Game.ref.data.stardust


## Start the generation of stardust and disable the starting button.
func begin_generating_stardust() -> void :
	timer.start()
	button.disabled = true


## Create 1 stardust.
func create_stardust() -> void :
	Game.ref.data.stardust += 1



## Triggerred when the "generate stardust" button is pressed.
func _on_button_pressed() -> void:
	begin_generating_stardust()


## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_stardust()

## Watch for naviqation request and react accordingly.
func _on_navigation_request(requested_view : UserInterface.Views) -> void :
	if requested_view == view:
		visible = true
		return
	
	visible = false
