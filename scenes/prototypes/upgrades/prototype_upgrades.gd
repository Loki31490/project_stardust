class_name PrototypeUpgrades
extends Control

## Reference to the User Interface.
@export var user_interface : UserInterface
## View reference.
@export var view : UserInterface.Views


## Initialize visibility at launch.
func _ready() -> void:
	
	visible = false
	
	user_interface.navigation_requested.connect((_on_navigation_request))


## Watch for naviqation request and react accordingly.
func _on_navigation_request(requested_view : UserInterface.Views) -> void :
	if requested_view == view:
		visible = true
		return
	
	visible = false
