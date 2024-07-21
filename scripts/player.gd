extends CharacterBody2D

@export_range(1, 10) var movement_speed = 3
@export_range(0, 1) var suavization = 0.9

# Atribuíndo um Sprite2D a uma variável, quando ele for
# disponibilizado para uso pelo Godot.

# Atribuíndo pelo caminho desde a raíz (Neste caso, a
# raíz é o Node "Jogador".):

# @onready var player: Sprite2D = $Corpo/Personagem

# Atribuíndo por um nome único (O Godot irá procurar
# por um Node com o nome "Personagem". A hierarquia de Nodes
# não é levada em conta, neste caso. Só utilize caso não haja
# duplicidade de nomes.):

@onready var player: Sprite2D = %Personagem

func _ready() -> void:
	
	print(Input.get_axis("ui_left", "ui_right"), "\n")
	
	print(Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"))

func _physics_process(_delta: float) -> void:
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var target_speed = direction * (movement_speed * 100)
	
	# Suavizando a alternância de velocidade do personagem.
	
	velocity = lerp(target_speed, velocity, suavization)
	
	# Função interna do Godot, sendo uma das coisas responsáveis
	# por fazer com que a física do corpo do personagem funcione
	# corretamente.

	move_and_slide()
	
	# Fazendo com que o personagem se incline horizontalmente,
	# de forma suave, em 15 graus ao se movimentar.
	
	var target_inclination = direction.x * 15
	
	player.rotation_degrees = lerp(target_inclination, player.rotation_degrees, suavization)
