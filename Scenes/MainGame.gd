extends Node2D

var player_1_choice = ""
var player_2_choice = ""

var winner_player = ""
var winner_figure = ""

var main_game_played = false

var rng = RandomNumberGenerator.new()

var winnerToMiniGame = {
	"player_1": {
		"rock": "res://Scenes/MiniGameInfo/RockGameInfo_P1P2.tscn",
		"paper": "res://Scenes/MiniGameInfo/PaperGameInfo_P1P2.tscn",
		"scissors": "res://Scenes/MiniGameInfo/ScissorsGameInfoP1P2.tscn"
	},
	"player_2": {
		"rock": "res://Scenes/MiniGameInfo/RockGameInfo_P2P1.tscn",
		"paper": "res://Scenes/MiniGameInfo/PaperGameInfo_P2P1.tscn",
		"scissors": "res://Scenes/MiniGameInfo/ScissorsGameInfoP2P1.tscn"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	player_1_choice = ""
	player_2_choice = ""
	winner_player = ""
	winner_figure = ""
	
	rng.randomize()
	pass # Replace with function body.
	$Timer.start()
	$Timer/countdown/countdown_anim.play("countdown_anim")

func start_mini_game(minigame):
	GlobalSceneManager.goto_scene(minigame)

func determineWinner():
	if player_1_choice == player_2_choice:
		var rnd = rng.randi_range(0, 1000)
		if rnd % 2 == 0:
			winner_player = "player_1"
			winner_figure = player_1_choice
		else:
			winner_player = "player_2"
			winner_figure = player_2_choice
		
	elif (player_1_choice == "rock" and player_2_choice == "scissors") or (player_1_choice == "paper" and player_2_choice == "rock") or (player_1_choice == "scissors" and player_2_choice == "paper"):
		winner_player = 'player_1'
		winner_figure = player_1_choice
	else:
		winner_player = 'player_2'
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
		print(winner_player)
		if winner_player == 'player_1':
			GlobalSceneManager.players_data["player_1"]["is_boss"] = true
			GlobalSceneManager.players_data["player_2"]["is_boss"] = false
			GlobalSceneManager.boss_p1_mob_p2()
		else: 
			GlobalSceneManager.players_data["player_2"]["is_boss"] = true
			GlobalSceneManager.players_data["player_1"]["is_boss"] = false
			GlobalSceneManager.mob_p1_boss_p2()
			
			
		GlobalSceneManager.players_data["player_1"].figure = player_1_choice
		GlobalSceneManager.players_data["player_2"].figure = player_2_choice
		

func show_results():	
	$Title2.visible = false
	
	if player_1_choice == "rock":
		$ManoP1/Piedra.visible = true
		
	if player_1_choice == "paper":
		$ManoP1/Papel.visible = true
	
	if player_1_choice == "scissors":
		$ManoP1/Tijera.visible = true

	if player_2_choice == "rock":
		$ManoP2/Piedra.visible = true
		
	if player_2_choice == "paper":
		$ManoP2/Papel.visible = true
	
	if player_2_choice == "scissors":
		$ManoP2/Tijera.visible = true


func _on_Timer_timeout():
	if player_1_choice != "" and player_2_choice != "":
		
		show_results()
		$Timer/countdown.visible = false
		$HomeBG2/homebg2_anim.play("home2_transcision")
		
	else:
		$Timer.start()
		$Timer/countdown/countdown_anim.stop()
		$Timer/countdown/countdown_anim.play("countdown_anim")

func _on_homebg2_anim_animation_finished(anim_name):
	start_mini_game(winnerToMiniGame[winner_player][winner_figure])
