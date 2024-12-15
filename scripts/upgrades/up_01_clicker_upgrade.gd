class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increase stardust created by the clicker.

## Level of the upgrade.
var level : int = 0
## Title of the upgrade.
var title : String = "Clicker Upgrade"
## Base cost of the upgrade.
var base_cost : int = 5



## Returns the description containing effects and costs.
func description() -> String:
	var _description : String = "Increases the amount of stardust created by the Clicker."
	_description += "\nEffects : +1 Stardust / Level"
	_description += "\nCost : %s" %cost()
	
	return _description


## Returns the current cost based on level and base cost.
func cost() -> int:
	return int((base_cost * pow(1.5, level)))
	


## Returns a boolean whether or not the player can afford buying  the upgrade.
#func can_afford() -> bool:
#if HandlerStardust.ref.data.stardust() >= cost ():
		#return true
	#
	#return false
