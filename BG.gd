extends ParallaxBackground

var scorolling_speed = 100

func _process(delta):
	scroll_offset.x -= scorolling_speed * delta
