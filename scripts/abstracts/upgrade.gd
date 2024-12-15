class_name Upgrade
extends Node
## Abstract class defining upgrade.

## Emitted when the upgrade has leveled up.
signal leveled_up

## Level of the upgrade.
var level : int = -1
## Title of the upgrade.
var title : String = "Title not defined"
## Base cost of the upgrade.
var base_cost : int = -1
## Current cost of the upgrade.
var cost : int = -1

## Virtual class, must be overwritten.[br]
## Returns description of the upgrade.
func description() -> String:
	return "description not defined"


## Virtual class, must be overwritten.[br]
## Returns the current cost based on level and base cost.
func calculate_cost() -> void:
	printerr("calculate_cost() method not defined.")


## Virtual class, must be overwritten.[br]
## Returns a boolean whether or not the player can afford buying  the upgrade.
func can_afford() -> bool:
	return false


## Virtual class, must be overwritten.[br]
## Consumes stardust to level up.
func level_up() -> void:
	printerr("level_up() method not defined.")
