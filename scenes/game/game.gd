class_name Game
extends Node
## Main node of the game.

## Singleton reference.
static var ref : Game


## Singleton check.
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()


## Reference to the user interface packed scene.
@export var scene_user_interface : PackedScene

### Contains the data to save and load.
var data : Data


## Singleton check & Data initialization.
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()


##Instantiate the user interface as a child of the Game node once all the handlers are ready.
func _ready() -> void:
	var node_user_interface : UserInterface = scene_user_interface.instantiate() as UserInterface
	self.add_child(node_user_interface)


## Triggered when the save timer completes a loop. Save the game.
func _on_save_timer_timeout() -> void:
	SaveSystem.save_data()
