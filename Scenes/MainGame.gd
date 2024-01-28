extends Node2D

var player_1_choice = ""
var player_2_choice = ""

var winner_player = ""
var winner_figure = ""

var main_game_played = false

var winnerToMiniGame = {
	"rock": "res://Scenes/MiniGames/RockMiniGame.tscn",
	"paper": "res://Scenes/MiniGames/PaperMiniGame.tscn",
	"scissors": "res://Scenes/MiniGames/ScissorsMiniGame.tscn"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_mini_game(minigame, boss):
	get_tree().change_scene(minigame)

func determineWinner():
	if player_1_choice == player_2_choice:
		winner_player = ""
		player_1_choice = ""
		player_2_choice = ""
	elif (player_1_choice == "rock" and player_2_choice == "scissors") or (player_1_choice == "paper" and player_2_choice == "rock") or (player_1_choice == "scissors" and player_2_choice == "paper"):
		winner_player = 'player1'
		winner_figure = player_1_choice
	else:
		winner_player = 'player2'
		winner_figure = player_2_choice

func get_input():
	if not player_1_choice:
		if Input.is_action_just_pressed("p1_left"):
			player_1_choice = "rock"
		elif Input.is_action_just_pressed("p1_down"):
			player_1_choice = "paper"
		elif Input.is_action_just_pressed("p1_right"):
			player_1_choice = "scissors"
	
	if not player_2_choice:
		if Input.is_action_just_pressed("p2_left"):
			player_2_choice = "rock"
		elif Input.is_action_just_pressed("p2_down"):
			player_2_choice = "paper"
		elif Input.is_action_just_pressed("p2_right"):
			player_2_choice = "scissors"

# Called every frame. 'delta' is the elapsed tixzme since the previous frame.
func _process(delta):
	get_input()
	
	if player_1_choice and player_2_choice and not winner_player:
		determineWinner()
		
	if winner_player and not main_game_played:
		main_game_played = true
		start_mini_game(winnerToMiniGame[winner_figure], winner_player)
		
