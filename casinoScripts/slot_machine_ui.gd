extends Control

var reelResult1
var reelResult2
var reelResult3

var receivedHowManyTimes = 0
var howManyTimesPlayed = 0
var betValue
var betResult
var winningMultiplier = 0
#@export var playercontroller : PlayerController


signal money_changed(new_value: int)

var money: int:
	get:
		return int(Player_Controller.money)# simple variable

# Called when the node enters the scene tree for the first time.




func _ready():
	$moneychangeamount.text = ""
	Player_Controller.add_money(100)
	$betAmount.max_value = money
	add_to_group("player")  # make this node findable by the label
	emit_signal("money_changed",  money)  # update UI on start
	
	SigBank.rollFinished.connect(Callable(self,"_receiveNumber"))
	pass # Replace with function body.

func _receiveNumber(reelID,rngResult):
	receivedHowManyTimes +=1
	match reelID:
		1:
			reelResult1 = rngResult
		2:
			reelResult2 = rngResult
		3:
			reelResult3 = rngResult
	if receivedHowManyTimes <3:
		print(receivedHowManyTimes)
		
	else:
		receivedHowManyTimes = 0
		_calculateWinning()

func _calculateWinning():
	$betAmount.max_value = money
	betValue = int($betAmount.value)
	
	
	if reelResult1 == reelResult2 || reelResult2 == reelResult3:
		winningMultiplier = 5
	elif  reelResult1 == reelResult2 && reelResult2 == reelResult3:
		winningMultiplier = 100
	else :
		winningMultiplier = -1
	betResult = betValue * winningMultiplier
	if betResult>0:
		$Result.text = "+ "+str(betResult)
		$moneychangeamount.text = "+" + str(betResult)+"$"
		$moneychangeamount.add_theme_color_override("font_color",Color(0.0, 1.0, 0.0, 1.0))
		Player_Controller.add_money(betResult)
		$betAmount.max_value = money
	else:
		$Result.text = "You lost!  "+str(betResult)
		$moneychangeamount.text = str(betResult)+"$"
		$moneychangeamount.add_theme_color_override("font_color",Color(1.0, 0.0, 0.0, 1.0))
		Player_Controller.minus_money(betResult)
		$betAmount.max_value = money
func _on_spin_button_button_up():
	SigBank.startRoll.emit(1,2)
	SigBank.startRoll.emit(2,2.5)
	SigBank.startRoll.emit(3,3)
	pass # Replace with function body.
	
