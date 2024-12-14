class_name LabeStardust
extends Label
## Displays the current amount of stardust available.


func _process(_delta: float) -> void:
	update_text()


func update_text() -> void:
	text = "Stardust : %s" %Game.ref.data.stardust
