class_name HandlerStardustGenerator
extends Node
## Passively generates Stardust.

## Singleton reference.
static var ref : HandlerStardustGenerator

## Amount of Stardust generated every loop.
var generator_power : int = 1

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()


## Reference the generator timer.
@export var timer : Timer 


## Loads data.
func _ready() -> void:
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		timer.start()
		return
	
	calculate_generator_power()
	
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)


## Triggered when the timer completes a loop.
func _on_timer_timeout() -> void:
	HandlerStardust.ref.create_stardust(generator_power)


## Wait for ccu_01 to be purchased.
func watch_for_upgrades_level_up(upgrade : Upgrade) -> void:
	if upgrade == HandlerCCUpgrades.ref.u_01_stadust_generation:
		timer.start()
		HandlerCCUpgrades.ref.upgrade_leveled_up.disconnect(watch_for_upgrades_level_up)


## Calculate the amount of stardust calculated every seconds.
func calculate_generator_power() -> void:
	var new_power : int = 1
	new_power += Game.ref.data.cc_upgrades.u_02_stardust_boost_level
	
	generator_power = new_power
