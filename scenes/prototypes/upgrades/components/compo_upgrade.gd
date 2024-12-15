class_name CompoUpgrade
extends Control
## Component displaying an upgrade.

## Reference to the label title.
@export var label_title : Label
## Reference to the label description.
@export var label_description : RichTextLabel
## Reference to the purchase button.
@export var button : Button


## Upgrade to display.
var upgrade : Up01ClickerUpgrade


func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	
	update_label_title()
	update_label_description()
	update_button()
	
	HandlerStardust.ref.stardust_created.connect(update_button)
	HandlerStardust.ref.stardust_consumed.connect(update_button)
	
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)


## Updated the title of the upgrade.
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_title.text = text


## Updated the title of the upgrade.
func update_label_description() -> void:
	label_description.text = upgrade.description()


## Updates the button availability.
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	
	button.disabled = true

## Triggered when the purchased button is pressed.
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
