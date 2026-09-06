extends Node2D
@onready var timer: RichTextLabel = $timer

var Web_collected = 0
var time : float
var finished = false # empêche de déclencher la transition plusieurs fois

func _ready() -> void:
	Timer(30) # on lance le minuteur SANS await, pour ne pas bloquer _ready()

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10))

	if finished:
		return # on ne fait plus rien une fois la transition lancée

	if Web_collected >= 3: # victoire, vérifiée à CHAQUE frame
		finished = true
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")

	elif time <= 0.0: # défaite (temps écoulé sans les 3 toiles)
		finished = true
		Global.minigames_done -= 1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func Web_collect() -> void:
	Web_collected += 1

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.10)
		time -= 0.10
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
