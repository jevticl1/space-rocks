extends CanvasLayer

signal start_game

@onready var lives_counter = $MarginContainer/LivesCounter.get_children()
@onready var score_label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var message = $VBoxContainer/Message
@onready var start_button = $VBoxContainer/StartButton

#start button press hides button and emits signal to start game
func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()

#timeout hides message and changes text to null value
func _on_timer_timeout():
	message.hide()
	message.text = ""

func show_message(text):
	message.text = text
	message.show()
	$Timer.start()

func game_over():
	show_message("Game Over")
	await $Timer.timeout
	start_button.show()

func update_score(value):
	score_label.text = str(value)

func update_lives(value):
	for item in 3:
		lives_counter[item].visible = value > item
