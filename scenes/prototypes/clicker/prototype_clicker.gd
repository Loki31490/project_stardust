class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust.


## Reference to the label displaying the current amount of stardust created.
@export var label : Label
## View reference.
@export var view : UserInterface.Views

## Reference to the User Interface.
@export var user_interface : UserInterface


## Initialize the label.
func _ready() -> void:
	update_label_text()
	
	visible = false
	
	user_interface.navigation_requested.connect((_on_navigation_request))


## Temporary function to update the label.
func _process(_delta: float) -> void:
	update_label_text()


## Triggerred when the create stardust button is pressed.
func _on_button_pressed() -> void:
	create_stardust()


## Update the text of the label to reflect a change in stardust amount.
func update_label_text() -> void :
	label.text = "Stardust : %s" %Game.ref.data.stardust


## Create 1 stardust.
func create_stardust() -> void :
	Game.ref.data.stardust += 1

## Watch for naviqation request and react accordingly.
func _on_navigation_request(requested_view : UserInterface.Views) -> void :
	if requested_view == view:
		visible = true
		return
	
	visible = false
