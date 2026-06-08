# LevelScenes.gd - Add this as another Autoload
extends Node

const LEVEL_SCENES = {
	1: "res://scenes/Scene1.tscn",
	2: "res://scenes/Scene2.tscn",
	3: "res://scenes/Scene3.tscn",
	4: "res://scenes/Scene4.tscn",
	5: "res://scenes/Scene5.tscn",
	6: "res://scenes/Scene6.tscn",
}

func get_scene_path(level: int) -> String:
	return LEVEL_SCENES.get(level, "res://ui/Main.tscn")
