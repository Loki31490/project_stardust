class_name HandlerCCUpgrades
extends Node
## Manages consciousness_core ans related signals.


## Singleton reference.
static var ref : HandlerCCUpgrades


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emitted when an upgrade is leveled up.
signal upgrade_leveled_up(upgrade : Upgrade)

## Reference to CCUpgrade 01.
@onready var u_01_stadust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()


## Returns all CCUpgrades.
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stadust_generation,
	]
