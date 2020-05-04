extends Node2D

export (String) var test = "Hello, World!"

var year = 0

var UppishLand
var BottomLand
var AloneLand
var Systems = []

func _ready():
	
	UppishLand = {
		"name": "UppishLand",
		"factories": 15,
		"ores": 300
	}
	
	BottomLand = {
		"name": "BottomLand",
		"factories": 3,
		"ores": 50
	}
	
	AloneLand = {
		"name": "AloneLand",
		"factories": 10,
		"ores": 250
	}
	
	Systems.append(UppishLand)
	Systems.append(BottomLand)
	Systems.append(AloneLand)

func _getValues(sysName):
	for sys in Systems:
		#print ("if " + sys["name"] + " = " + sysName)
		if sys["name"] == sysName:
			return sys
