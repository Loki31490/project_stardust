class_name SaveSystem
## Save manager.

## Path of the file we want to save and load.
const PATH : String = "user://save.tres"
## Wether or not we should load the game.
const SHOULD_LOAD : bool = false


## Save Game.ref.data object in a savr file.
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, PATH)


## Loads the data and overrides Game.ref.data objet.
static func load_data() -> void:
	if not SHOULD_LOAD:
		return
	
	if ResourceLoader.exists(PATH):
		Game.ref.data = load(PATH)
