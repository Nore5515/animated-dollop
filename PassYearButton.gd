extends Button



var year = 0
var queuedFactories = {}
var totalQueuedFactories = 0

signal summaryUpdate

func _ready():
	year = get_node("/root/Global").year
	self.get_node("Year").text = "Year " + str(year)
	self.get_node("Queue").text = "Queued Factories: 0"

func _on_PassYearButton_pressed():
	updateSystems(queuedFactories.keys())
	emit_signal("summaryUpdate")
	
	get_node("/root/Global").year += 1
	year = get_node("/root/Global").year
	totalQueuedFactories = 0
	queuedFactories = {}
	self.get_node("Year").text = "Year " + str(year)
	self.get_node("Queue").text = "Queued Factories: 0"
	
func updateSystems(qFactories):
	for sys in qFactories:
		#print(get_node("/root/Global")._getValues(sys))
		get_node("/root/Global")._getValues(sys)["factories"] += queuedFactories[sys]
	
func _on_SystemIcon_addFactoryToQueue():
	if (queuedFactories.has("AloneLand")):
		queuedFactories["AloneLand"] += 1
		totalQueuedFactories += 1
	else:
		queuedFactories["AloneLand"] = 1
		totalQueuedFactories += 1
	self.get_node("Queue").text = "Queued Factories: " + str(totalQueuedFactories)

func _on_SystemIcon2_addFactoryToQueue():
	if (queuedFactories.has("BottomLand")):
		queuedFactories["BottomLand"] += 1
		totalQueuedFactories += 1
	else:
		queuedFactories["BottomLand"] = 1
		totalQueuedFactories += 1
	self.get_node("Queue").text = "Queued Factories: " + str(totalQueuedFactories)
