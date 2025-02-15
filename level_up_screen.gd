extends Node2D

var LevelUpOptions = ["lower dash \nrecharge",
					"increase dash \ndistance",
					"increase dash \nspeed",
					"increase rotation \nspeed"]
var currOptions = []
# Called when the node enters the scene tree for the first time.
func _ready():
	onLevelUp(1)
	pass # Replace with function body.

func onLevelUp(level : int):
	Engine.time_scale = 0
	var listHelper = [0,1,2,3]
	self.visible = true
	for i in range(0,3):
		var randomNumber = randi_range(0,3-i)
		get_child(i).get_child(0).text = LevelUpOptions[listHelper[randomNumber]]
		currOptions.push_back(listHelper[randomNumber])
		listHelper.remove_at(randomNumber)

func Choice(chosenChild):
	var upgrade = currOptions[chosenChild]
	var mowerObj = get_parent().get_child(0)
	match upgrade:
		0:
			mowerObj.DashCooldownLength = mowerObj.DashCooldownLength* 0.9
		1:
			mowerObj.DashLength = mowerObj.DashLength * 1.1
		2:
			mowerObj.DashSpeed = mowerObj.DashSpeed * 1.1
		3:
			mowerObj.RotationSpeed = mowerObj.RotationSpeed * 1.1
		4:
			pass
		5: 
			pass
	while currOptions.size() != 0:
		currOptions.remove_at(0)
	visible = false
	Engine.time_scale = 1
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = $"../Lawnmower".position+ Vector2(-41, -21.25)
	pass



func Choice1():
	Choice(2)
	pass # Replace with function body.


func Choice2():
	Choice(1)
	pass # Replace with function body.


func Choice3():
	Choice(0)
	pass # Replace with function body.
