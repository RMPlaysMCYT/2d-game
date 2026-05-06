extends Label

@export var LabelName: String = ""
var CurrentValue = 0

func set_value(value: int) ->void:
	CurrentValue = value
	text = "%s: %d" % [LabelName, CurrentValue]
