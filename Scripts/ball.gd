extends RigidBody2D

export var maxspeed = 300

signal lives
signal score

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	var WorldNode = get_node("/root/World")
	connect("score", WorldNode, "increase_score")
	connect("lives", WorldNode, "decrease_lives")

func _physics_process(delta):
    var bodies = get_colliding_bodies()
    for body in bodies:
        if body.is_in_group("Tiles"):
			emit_signal("score",body.score)
            body.queue_free()
    
    if position.y > get_viewport_rect().end.y:
        queue_free()
		emit_signal("lives"))
        print("Died")