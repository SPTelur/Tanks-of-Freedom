
var root_node
var action_controller

var end_turn_button

var hud_unit
var hud_unit_life
var hud_unit_attack
var hud_unit_ap
var hud_unit_plain
var hud_unit_road
var hud_unit_river
var hud_unit_icon

var hud_building
var hud_building_spawn_button
var hud_building_icon
var hud_building_unit_icon

func init_root(root, action_controller_object):
	root_node = root
	action_controller = action_controller_object
	end_turn_button = root.get_node("/root/game/GUI/turn_card/end_turn")
	end_turn_button.connect("pressed", action_controller, "end_turn")
	
	hud_unit = root.get_node("/root/game/GUI/bottom_center/unit_card")
	hud_unit_life = hud_unit.get_node("life")
	hud_unit_attack = hud_unit.get_node("attack")
	hud_unit_ap = hud_unit.get_node("action_points")
	hud_unit_plain = hud_unit.get_node("plain")
	hud_unit_road = hud_unit.get_node("road")
	hud_unit_river = hud_unit.get_node("river")
	hud_unit_icon = hud_unit.get_node("unit_icon")
	
	hud_building = root.get_node("/root/game/GUI/bottom_center/building_card")
	hud_building_icon = hud_building.get_node("building_icon")
	hud_building_spawn_button = hud_building.get_node("TextureButton")
	hud_building_unit_icon = hud_building_spawn_button.get_node("unit_icon")
	hud_building_spawn_button.connect("pressed", action_controller, "spawn_unit_from_active_building")

func show_unit_card(unit):
	self.update_unit_card(unit)
	self.set_unit_card_icon(unit)
	hud_unit.show()

func update_unit_card(unit):
	var stats = unit.get_stats()
	hud_unit_life.set_text(str(stats.life))
	hud_unit_attack.set_text(str(stats.attack))
	hud_unit_ap.set_text(str(stats.ap))
	hud_unit_plain.set_text(str(stats.plain))
	hud_unit_road.set_text(str(stats.road))
	hud_unit_river.set_text(str(stats.river))

func set_unit_card_icon(unit):
	hud_unit_icon.set_region_rect(Rect2((unit.player + 1) * 32, unit.type * 32, 32, 32))
	
func clear_unit_card():
	hud_unit.hide()
	
func show_building_card(building):
	hud_building_icon.set_region_rect(building.get_region_rect())
	hud_building_unit_icon.set_region_rect(building.get_region_rect())
	hud_building.show()
	
func clear_building_card():
	hud_building.hide()
	