extends Button

@onready var Level1 = $"../LevelSelection/Level1Btn"
@onready var Level2 = $"../LevelSelection/Level2Btn"
@onready var Level3 = $"../LevelSelection/Level3Btn"
@onready var Level4 = $"../LevelSelection/Level4Btn"
@onready var Level5 = $"../LevelSelection/Level5Btn"
@onready var Level6 = $"../LevelSelection/Level6Btn"

@onready var Level2_locked: ColorRect = $"../LevelSelection/lvl2_locked"
@onready var Level3_locked: ColorRect  = $"../LevelSelection/lvl3_locked"
@onready var Level4_locked: ColorRect  = $"../LevelSelection/lvl4_locked"
@onready var Level5_locked: ColorRect  = $"../LevelSelection/lvl5_locked"
@onready var Level6_locked: ColorRect  = $"../LevelSelection/lvl6_locked"

func _ready()-> void:
	Level1.grab_focus()
