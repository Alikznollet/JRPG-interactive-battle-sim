extends Node2D
class_name TurnManager

var entities: Array[BattleEntity] = []
var enemies: Array[BattleEnemy] = []
var allies: Array[BattleAlly] = []
var current_entity_index: int = 0

func instantiate_entities(starter_entities: Array[BattleEntity]) -> void:
	for entity in starter_entities:
		add_entity(entity)
	
	entities.sort_custom(speed_sort)

func add_entity(entity: BattleEntity) -> void:
	entities.append(entity)
	$Entities.add_child(entity)
	
	if entity is BattleAlly:
		allies.append(entity)
		entity.global_position = $PlayerPositions.get_children()[allies.find(entity)].global_position
	elif entity is BattleEnemy:
		enemies.append(entity)
		entity.global_position = $EnemyPositions.get_children()[enemies.find(entity)].global_position
		
func remove_entity(entity: BattleEntity) -> void:
	var index: int = entities.find(entity)
	if index != -1:
		entities.remove_at(index)
	
		if entity is BattleAlly:
			var ally_index: int = allies.find(entity)
			allies.remove_at(ally_index)
		elif entity is BattleEnemy:
			var enemy_index: int = enemies.find(entity)
			enemies.remove_at(enemy_index)
		
		if current_entity_index >= index:
			current_entity_index -= 1
	else:
		printerr("(%s) No such entity exists" % entity.name)
		
func speed_sort(a: BattleEntity, b: BattleEntity) -> bool:
	if a.speed > b.speed:
		return true
	else:
		return false
		
func _next_index() -> void:
	if current_entity_index == len(entities) - 1:
		current_entity_index = 0
	else:
		current_entity_index += 1
		
enum TurnState {
	ONGOING,
	ENEMY_VICTORY,
	ALLY_VICTORY
}

func _check_turn_state() -> TurnState:
	if enemies.is_empty():
		return TurnState.ALLY_VICTORY
	elif allies.is_empty():
		return TurnState.ENEMY_VICTORY
	else:
		return TurnState.ONGOING

func start_turn_cycle() -> void:
	current_entity_index = 0 # start with the fastest entity in the list
	_next_turn()
	
func _next_turn() -> void:
	await get_tree().create_timer(0.5).timeout
	var current_entity: BattleEntity = entities[current_entity_index]
	print(current_entity)
	
	current_entity.make_move_selection()
	
	await current_entity.move_locked_in
	print(current_entity.current_action.name)
	print(current_entity.current_action.type)
	
	var turn_state: TurnState = _check_turn_state()
	
	if turn_state == TurnState.ONGOING:
		_next_index()
		_next_turn()
	else:
		get_tree().quit()
