class_name LabelConsciounessCore
extends Label
## Displays the current amount of consciousness cores available.


## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerConsciousnessCore.ref.consciousness_core_created.connect(update_text)
	HandlerConsciousnessCore.ref.consciousness_core_consumed.connect(update_text)


## Updates the text to reflec the current amount of consciousnesscore created.
func update_text(_quantity : int = -1) -> void:
	text = "Consciousness cores : %s" %HandlerConsciousnessCore.ref.consciousness_core()
