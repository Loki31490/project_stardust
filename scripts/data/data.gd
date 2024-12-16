class_name Data
extends Resource
## contain data to save and load.

## Current amount of stardust available.
@export var stardust : int = 0
## Current amount of consciousness cores available.
@export var consciousness_core : int  = 1

## Upgrade 01 Clicker Update Level.
@export var up_01_level : int = 0

## contain CCUpgrades data to save and load.
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()
