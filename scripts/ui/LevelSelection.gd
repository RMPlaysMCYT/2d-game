extends Panel

@onready var Level1: Button = $"../LevelSelection/Level1Btn"
@onready var Level2: Button  = $"../LevelSelection/Level2Btn"
@onready var Level3: Button  = $"../LevelSelection/Level3Btn"
@onready var Level4: Button  = $"../LevelSelection/Level4Btn"
@onready var Level5: Button  = $"../LevelSelection/Level5Btn"
@onready var Level6: Button  = $"../LevelSelection/Level6Btn"

@onready var Level1_locked: ColorRect = $"../LevelSelection/lvl1_locked"
@onready var Level2_locked: ColorRect = $"../LevelSelection/lvl2_locked"
@onready var Level3_locked: ColorRect  = $"../LevelSelection/lvl3_locked"
@onready var Level4_locked: ColorRect  = $"../LevelSelection/lvl4_locked"
@onready var Level5_locked: ColorRect  = $"../LevelSelection/lvl5_locked"
@onready var Level6_locked: ColorRect  = $"../LevelSelection/lvl6_locked"

@onready var level1LockedIcon: Sprite2D = $"../LevelSelection/lockIcon"
@onready var level2LockedIcon: Sprite2D = $"../LevelSelection/lockIcon1"
@onready var level3LockedIcon: Sprite2D = $"../LevelSelection/lockIcon2"
@onready var level4LockedIcon: Sprite2D = $"../LevelSelection/lockIcon3"
@onready var level5LockedIcon: Sprite2D = $"../LevelSelection/lockIcon4"
@onready var level6LockedIcon: Sprite2D = $"../LevelSelection/lockIcon5"


func _ready()-> void:
	Level1.grab_focus()

	#if LevelSelectionCore.level1_completed == true:
		#Level1_locked.visible = false
		#level1LockedIcon.visible = false
	#if LevelSelectionCore.level1_completed == false:
		#Level1_locked.visible = false
		#level1LockedIcon.visible = false
#
#
#
	#if LevelSelectionCore.level2_completed == true:
		#Level2_locked.visible = false
		#level2LockedIcon.visible = false
		#
	#if LevelSelectionCore.level2_completed == false:
		#Level2_locked.visible = true
		#level2LockedIcon.visible = true
#
#
	#if LevelSelectionCore.level3_completed == true:
		#Level3_locked.visible = false
		#level3LockedIcon.visible = false
		#
	#if LevelSelectionCore.level3_completed == false:
		#Level3_locked.visible = true
		#level3LockedIcon.visible = true
#
	#if LevelSelectionCore.level4_completed == true:
		#Level4_locked.visible = false
		#level4LockedIcon.visible = false
		#
	#if LevelSelectionCore.level4_completed == false:
		#Level4_locked.visible = true
		#level4LockedIcon.visible = true
#
	#if LevelSelectionCore.level5_completed == true:
		#Level5_locked.visible = false
		#level5LockedIcon.visible = false
		#
	#if LevelSelectionCore.level5_completed == false:
		#Level5_locked.visible = true
		#level5LockedIcon.visible = true
#
	#if LevelSelectionCore.level6_completed == true:
		#Level6_locked.visible = false
		#level6LockedIcon.visible = false
		#
	#if LevelSelectionCore.level6_completed == false:
		#Level6_locked.visible = true
		#level6LockedIcon.visible = true
