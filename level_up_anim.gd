extends Node2D

onready var anim = ["bird", "crown", "thunder", "eyes", "star", "winer"]
export var i = 0
export var flip = false
export var grau = 0 

onready var  animate = $AnimatedSprite

func _ready():
	i = i
	animate.play(anim[i])
	$AnimatedSprite.set_rotation(grau)
	
func _process(delta):
	$AnimatedSprite.set_flip_h(flip)
	
