extends Button

var cards = {
	1: {"image": "res://cards/青眼白龙.jpeg", "rarity": "SR", "name": "青眼白龙"},
	2: {"image": "res://cards/青眼双爆裂龙.jpg", "rarity": "SR", "name": "青眼双爆裂龙"},
	3: {"image": "res://cards/青眼究极龙.jpg", "rarity": "SSR", "name": "青眼究极龙"},
	4: {"image": "res://cards/刀斧怪.png", "rarity": "R", "name": "刀斧怪"},
	5: {"image": "res://cards/地缚神_卡帕克阿普.jpg", "rarity": "SR", "name": "地缚神_卡帕克阿普"},
	6: {"image": "res://cards/心钥妖精.jpg", "rarity": "R", "name": "心钥妖精"},
	7: {"image": "res://cards/时间魔术师.png", "rarity": "R", "name": "时间魔术师"},
	8: {"image": "res://cards/玻璃女巫.jpg", "rarity": "SR", "name": "玻璃女巫"},
	9: {"image": "res://cards/黑魔导.png", "rarity": "R", "name": "黑魔导"},
	10: {"image": "res://cards/基因狼人.jpeg", "rarity": "R", "name": "基因狼人"},
	11: {"image": "res://cards/狮子男巫.jpg", "rarity": "R", "name": "狮子男巫"},
	
	# 添加更多召唤物...
}

var cardImageTextureRect: TextureRect
var rarityLabel: Label
var nameLabel: Label
var Texture1: TextureRect #用于绑定10连抽对应的图片，方便后续进行清空
var Texture2: TextureRect
var Texture3: TextureRect
var Texture4: TextureRect
var Texture5: TextureRect
var Texture6: TextureRect
var Texture7: TextureRect
var Texture8: TextureRect
var Texture9: TextureRect
var Texture10: TextureRect
var clearTexture: TextureRect #遍历清空用的指针

func _ready():
	cardImageTextureRect = get_parent().get_node("CardImageTextureRect")
	rarityLabel = get_parent().get_node("RarityLabel")
	nameLabel = get_parent().get_node("NameLabel")





func drawCard():
	var randomValue = randf()
	var rarity = ""

	if randomValue < 0.01:
		rarity = "SSR"
	elif randomValue < 0.1:
		rarity = "SR"
	else:
		rarity = "R"

	var cardIds = []

	for cardId in cards.keys():
		if cards[cardId]["rarity"] == rarity:
			cardIds.append(cardId)
	
	
	var randomCardId = cardIds[randi() % cardIds.size()]
	
	var cardInfo = cards[randomCardId]  #cardInfo即最终抽到的卡
	
	# 加载卡图并显示
	var cardImageTexture = load(cardInfo["image"])
	cardImageTextureRect.texture = cardImageTexture


	
	# 更新稀有度和名称
	rarityLabel.text = "稀有度：" + cardInfo["rarity"]

	# 更新名称
	nameLabel.text = "名称：" + cardInfo["name"] 

func clear():

	for i in range(10): #遍历十连抽的图片框，逐个进行清空
		clearTexture = get_parent().get_node("CardImageTextureRect"+str(i+1))
		clearTexture.texture = null
		
func _on_button_down():
	clear()
	drawCard()
