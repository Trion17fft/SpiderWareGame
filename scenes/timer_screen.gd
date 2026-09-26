extends Node2D

@onready var WebContainer: HBoxContainer = $WebContainer
@onready var Web: TextureRect = $WebContainer/Web
@onready var Web_2: TextureRect = $WebContainer/Web2
@onready var Web_3: TextureRect = $WebContainer/Web3
@onready var Web_4: TextureRect = $WebContainer/Web4
@onready var Web_5: TextureRect = $WebContainer/Web5
@onready var timer: RichTextLabel = $Timer
@onready var level: RichTextLabel = $Level
var time

func _ready() -> void:
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		return
	
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
		
	else:
		get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		
func _process(delta: float) -> void:
	match Global.lives:
		
		4:
			Web.hide()
		3:
			Web.hide()
			Web_2.hide()
		2:
			Web.hide()
			Web_2.hide()
			Web_3.hide()
		1:
			Web.hide()
			Web_2.hide()
			Web_3.hide()
			Web_4.hide()
		0:
			WebContainer.hide()
	
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)
	
func Timer(start_time: float):
	
	time = start_time
	while time < 0.0:
		await wait(0.1)
		time -= 0.1
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
 
