extends Node
class_name State

var state_machine: StateMachine

func handle_input(event: InputEvent) -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func enter(msg:= {}) -> void:
	pass

func exit() -> void:
	pass
