extends Button
var cardButton: Button

func _ready():
	cardButton = get_node("/root/drawcardsence/button") # 替换为第一个按钮节点的路径
	
func drawTenCards():
	for i in range(10):
		cardButton.drawCard()
		
		
		var textureNode = get_parent().get_node("CardImageTextureRect" + str(i+1))
		textureNode.texture = cardButton.cardImageTextureRect.texture
		cardButton.rarityLabel.text = "" 
		cardButton.nameLabel.text = ""
		cardButton.cardImageTextureRect.texture = null
func _on_button_down():
	drawTenCards() # 调用抽奖十次的函数
