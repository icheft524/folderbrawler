extends Node2D

@onready var timer : Timer = $"ads_time"
@onready var main = $"../.."

var ad = preload("res://enemy/ads_file/ads_file.tscn")
var offset = 100
const art_Path = "res://art/ad/"

var ad_im = [
	"ads1.png",
	"ads2.png"
	]

func _ready():
	timer.start()
	pass

func _process(delta):
	pass


func _on_ads_time_timeout():
	_spawn()
	await get_tree().create_timer(global.adstimelock,false).timeout
	timer.start()
	pass

func _spawn():
	var ins_ad = ad.instantiate()
	ins_ad.set_meta("Image",load(art_Path + ad_im[randi() % ad_im.size()]))
	ins_ad.global_position = _postion_random_srceen(offset)
	get_parent().add_child(ins_ad)

func _postion_random_srceen(set_offset: int):
	var randomx = get_viewport().size.x
	var randomy = get_viewport().size.y
	return Vector2(randi_range(offset,randomx-offset),randi_range(offset,randomy-offset))
