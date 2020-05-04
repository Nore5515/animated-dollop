extends Node2D


export (String) var systemName
export (String) var systemLink
export (String) var systemFaction

# tell the summary to update
signal summaryUpdate
signal addFactoryToQueue

# list of system names that ur connected to
export (Array) var connectedNodes

var factionColors = {
	"Silver Union" : Color.silver,
	"Knights of New" : Color.red,
	"Desert Dusters" : Color.brown,
	"Reptile Syndicate" : Color.green
}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#mainScene = get_tree().current_scene()
	if systemName == "":
		systemName = "Default"


func _draw():
	draw_circle (Vector2(0,0), 300, factionColors[systemFaction])
	
	for i in get_tree().get_nodes_in_group ("SystemIcon"):
		for j in connectedNodes:
			if (i.systemName == j):
				#print ("Match! " + str(self.position) + " to " + str(i.get_global_position()))
				# no friggin idea whwat get_transform().affine_inverse() does but it gets results!
				#print (get_transform().affine_inverse())
				draw_line (Vector2(0,0), get_transform().affine_inverse() * i.get_global_position() , Color.gray, 15.0)


func _on_Button_pressed():
	#print (systemName + " System Pressed!")
	var _err = get_tree().change_scene("res://SystemFolder/" + systemLink)

func getFactories():
	#print(get_tree().get_root().get_node("res://SystemFolder/" + systemLink).name)
	#print(get_tree().get_root().get_child(0).name)
	#print (get_node("res://SystemFolder/" + systemLink).name)
	#print (get_node("/root/" + systemLink).name)
	return (get_node("/root/Global")._getValues(systemName)["factories"])
	#print (systemName)
	#print ("res://SystemFolder/" + systemLink))
	#print ("whatever")
	
func addFactories(factoriesToAdd):
	#print ("B4: " + str(get_node("/root/Global")._getValues(systemName)["factories"]))
	get_node("/root/Global")._getValues(systemName)["factories"] += factoriesToAdd
	#print (str(get_node("/root/Global")._getValues(systemName)["factories"]))
	
func getOres():
	return (get_node("/root/Global")._getValues(systemName)["ores"])

func _on_AddFactoryButton_pressed():
	#addFactories(1)
	emit_signal("summaryUpdate")
	emit_signal("addFactoryToQueue")

