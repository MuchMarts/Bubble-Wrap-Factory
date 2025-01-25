extends Node2D


@onready var BUBBLES = 0
@onready var POP_COUNT = 0	
@onready var pop_count_ui = get_node("PopCount")
@onready var bubble_count_ui = get_node("BubbleCount")
@onready var shift_timer = get_node("ShiftTimer")
@onready var next_shift_btn = get_node("Next Shift")

@onready var shift_time = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_shift_btn.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shift_time <= 0: end_shift()
	shift_time -= delta
	shift_timer.text = "Shift Timer: " + "%.2f" % shift_time

func end_shift() -> void:
	PlayerData.UpdateScore(POP_COUNT)
	enable_start_next_shift_btn()

func enable_start_next_shift_btn() -> void:
	next_shift_btn.disabled = true
	
func pop_bubble() -> void:
	if BUBBLES > 0:
		POP_COUNT += 1
		BUBBLES -=1

func get_bubble_wrap() -> void:
	BUBBLES += 1

func _on_get_bubble_wrap_pressed() -> void:
	if shift_time <= 0: return
	get_bubble_wrap()
	update_ui()

func _on_pop_bubble_pressed() -> void:
	if shift_time <= 0: return
	pop_bubble()
	update_ui()

func update_ui() -> void:
	pop_count_ui.text = "Pop Count: " + str(POP_COUNT)
	bubble_count_ui.text = "Bubble Count: " + str(BUBBLES)


func _on_next_shift_pressed() -> void:
	shift_time = 10
	BUBBLES = 0
	POP_COUNT = 0
