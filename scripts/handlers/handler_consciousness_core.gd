class_name HandlerConsciousnessCore
extends Node
## Manages consciousness_core ans related signals.


## Singleton reference.
static var ref : HandlerConsciousnessCore


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()


## Emitted when consciousness_core are created.
signal consciousness_core_created(quantity : int)
## Emitted when consciousness_core are consumed
signal consciousness_core_consumed(quantity : int)



## Returns the current amount of consciousnes core available.
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core


## Add a specific amount of consciousness core.
func create_consciousness_core(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	consciousness_core_created.emit(quantity)


## Consume a specific amount of consciousness core.
func consume_consciousness_core(quantity : int) -> Error:
	if quantity > Game.ref.data.consciousness_core:
		return Error.FAILED
	
	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)
	
	return Error.OK


## Triggered by the clicker; creates consciousness_core.
func trigger_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	
	create_consciousness_core(quantity)
