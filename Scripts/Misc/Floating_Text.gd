extends Marker2D

var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.set_text(str(amount))
	var tween = get_tree().create_tween()
	tween.tween_property($Label, "theme_override_font_sizes/font_size", 24, 0.3)
	tween.tween_property($Label, "theme_override_font_sizes/font_size", 24, 0.5)
	tween.tween_property($Label, "theme_override_font_sizes/font_size", 8, 0.3)
	tween.connect("finished", onTweenFinished)
	
func onTweenFinished():
	self.queue_free()
	
