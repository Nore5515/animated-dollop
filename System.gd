extends Node2D

var factories
var ore
export (String) var sysName

# Called when the node enters the scene tree for the first time.
func _ready():
	
	factories = get_node("/root/Global")._getValues(sysName)["factories"]
	ore = get_node("/root/Global")._getValues(sysName)["ores"]
	
	self.get_node("Stats").text = "Factories:" + str(factories) + "\nOre:" + str(ore)
	pass # Replace with function body.


func loadSystem():
	print ("System Loaded!")


func _on_Button_pressed():
	var _err = get_tree().change_scene("res://MainScene.tscn")
