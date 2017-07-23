# The Proto Should:
# click between home and article screens
# tap or swipe between stats tabs


# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@1x", scale: 1)

# Define artboards; Set artboards from sketch to 0,0
artboards = []
for layer in Framer.CurrentContext.layers
	layer.point = {x:0,y:0} if layer._info.kind == "artboard"
	artboards.push(layer) if layer._info.kind == "artboard"

# Wrap artboad layers in ScrollComponent
homeScroll = ScrollComponent.wrap(companion.Home)
homeScroll.scrollHorizontal = false
biasScroll = ScrollComponent.wrap(companion.Your_Stats_Bias)
biasScroll.scrollHorizontal = false
goalScroll = ScrollComponent.wrap(companion.Your_Stats_Goals)
goalScroll.scrollHorizontal = false
topicsScroll = ScrollComponent.wrap(companion.Your_Stats_Topics_v1_2)
topicsScroll.scrollHorizontal = false

# Hide other Artboards
companion.Your_Stats_Topics_v1_2.parent.visible = false
companion.Your_Stats_Bias.parent.visible = false
companion.Your_Stats_Goals.parent.visible = false
companion.Home_Tapped.visible = false


# Global Navigation Listeners - this could be simplifed by different namespacing in Sketch
for artboard in artboards
	do (artboard) ->
		for child in artboard.children
			if child.name.indexOf("Action_Buttons_2") isnt -1
				for grandChild in child.children
					
					if grandChild.name.indexOf("HomeBtn") isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Home")
							
					else if grandChild.name.indexOf("GoalsBtn") isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Your_Stats_Goals")
							
					else if grandChild.name.indexOf('StatsBtn') isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Your_Stats_Bias")
					
			else if child.name.indexOf("Segmented_Control") isnt -1
				for grandChild in child.children
					
					if grandChild.name.indexOf("Goals") isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Your_Stats_Goals")
							
					else if grandChild.name.indexOf("Bias") isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Your_Stats_Bias")
							
					else if grandChild.name.indexOf("Topics") isnt -1
						grandChild.onClick (e, l) ->
							hideCurrentArtboard(artboard)
							showTargetedArtboard("Your_Stats_Topics_v1_2")

hideCurrentArtboard = (artboard) ->
	artboard.parent.visible = false

showTargetedArtboard = (name) ->
	companion[name].parent.visible = true