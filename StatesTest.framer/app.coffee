# The Proto Should:
# click between home and article screens
# tap or swipe between stats tabs


# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@2x", scale: 1)

artboards = []
activeState = 'Home'

# Define artboards; Set artboards from sketch to 0,0
for layer in Framer.CurrentContext.layers
	artboards.push(layer) if layer._info.kind == "artboard"
	
# globalNav = companion.Action_Buttons_2.copy()
# statsNav = companion.Segmented_Control_4.copy()

# statsNav.states.on = 
# 	visible: true, opacity: 1
# statsNav.states.off =
# 	visible: false, opacity: 1
# statsNav.animate("off")


for artboard in artboards
	for child in artboard.children
		child.destroy() if child.name.indexOf("GlobalNav") isnt -1
		child.destroy() if child.name.indexOf("Segmented") isnt -1
	artboard.point = {x:0,y:0} 
# 	console.log artboard.props
	artboard.states.off = 
		visible: false, opacity: 1
	artboard.states.on = 
		visible: true, opacity: 1
	
	artboard.animate("off") if artboard.name isnt activeState




companion.HomeBtn.onClick (e, l) ->
	companion[activeState].animate("off")
	companion.Home.animate("on")
	activeState = 'Home'

companion.ArticlesBtn.onClick (e, l) ->
	console.log 'article click! no page yet :)'

companion.GoalsBtn.onClick (e, l) ->
	companion[activeState].animate("off")
	companion.Your_Stats_Goals.animate("on")
	activeState = 'Your_Stats_Goals'

companion.StatsBtn.onClick (e, l) ->
	companion[activeState].animate("off")
	companion.Your_Stats_Bias.animate("on")
	activeState = 'Your_Stats_Bias'

companion.SettingsBtn.onClick (e, l) ->
	console.log 'settings click! no page yet :)'






