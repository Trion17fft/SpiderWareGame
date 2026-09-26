extends Node2D

@onready var self_area: Area2D = $Area2D

signal Web_collected

func _ready() -> void:
	self_area.area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and self.visible:
		emit_signal("Web_collected")
		self.hide()
