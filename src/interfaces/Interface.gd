extends Control

func set_max_value(value):
	if (value < 0):
		value = 100
	$mana_bar.max_value = value
	pass

func update_mana_bar(value):
	if (value > $mana_bar.max_value):
		value = $mana_bar.max_value
	$mana_bar.value = value
	pass

func set_max_boss_health(value):
	if (value < 0):
		value = 100
	$boss_health_bar.max_value = value
	pass

func update_boss_helth(value):
	if (value > $boss_health_bar.max_value):
		value = $boss_health_bar.max_value
	$boss_health_bar.value = value
	pass
