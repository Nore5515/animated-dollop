extends Node2D


#var faction = self.get_parent().
#HARDSET FACTION TO SILVER UNION
var faction = "Silver Union"
var textTotal

var factionFactories = 0
var factionOres = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	update()

func getFactionValues():
	factionFactories = 0
	factionOres = 0
	
	for sysIcon in get_tree().get_nodes_in_group("SystemIcon"):
		if (sysIcon.systemFaction == faction):
			factionFactories += sysIcon.getFactories()
			factionOres += sysIcon.getOres()
			#factionFactories += sysIcon.systemFactories
			#factionOres += sysIcon.systemOres

func update():
	#print ("UPDATING SUMMARY")
	
	getFactionValues()
	
	textTotal = faction
	textTotal += "\n============="
	textTotal += "\nFACTORIES: " + str(factionFactories)
	textTotal += "\nORES: " + str(factionOres)
	self.get_node("Label").text = textTotal

func _on_SystemIcon_summaryUpdate():
	update()

func _on_SystemIcon2_summaryUpdate():
	update()

func _on_SystemIcon3_summaryUpdate():
	update()


func _on_PassYearButton_summaryUpdate():
	update()
