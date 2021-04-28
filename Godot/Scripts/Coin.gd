extends Area2D

## Variáveis

var screensize

## Funções do sistema

func _ready():
	$Tween.interpolate_property($AnimatedSprite, "scale", $AnimatedSprite.scale, $AnimatedSprite.scale * 3, 0.3, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($AnimatedSprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	
	pass

## Funções da classe

func pickup():
	monitoring = false
	$Tween.start()
	#queue_free()


func _on_Tween_tween_completed(object, key):
	queue_free()
	pass # Replace with function body.
