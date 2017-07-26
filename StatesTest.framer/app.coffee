# The Proto Should:
# click between home and article screens
# tap or swipe between stats tabs
debug = true

# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@2x", scale: 1)

screens = []
globalNav = companion._GlobalNav;
statsNav = companion._StatsNav;

globalNav.y = 80
 

activeState = 'Home'

# Define artboards; Set artboards from sketch to 0,0
for layer in Framer.CurrentContext.layers
	
	
	# Define Artboards
	screens.push(layer) if layer._info.kind == "artboard"
	
# console.log 'Layer Scrub Complete: ' + screens.length + ' ' + globalNav + statsNav if debug

# globalNav.y = Align.top	
# console.log globalNav.props


# Define Screen states
for screen in screens
	for child in screen.children
		child.destroy() if child.name.indexOf("GlobalNav") isnt -1
		child.destroy() if child.name.indexOf("Segmented") isnt -1
	screen.point = {x:0,y:0} 
# 	console.log artboard.props
	screen.states.off = 
		visible: false, opacity: 1
	screen.states.on = 
		visible: true, opacity: 1
	
# 	artboard.animate("off") if artboard.name isnt activeState




# companion.HomeBtn.onClick (e, l) ->
# 	companion[activeState].animate("off")
# 	companion.Home.animate("on")
# 	activeState = 'Home'
# 
# companion.ArticlesBtn.onClick (e, l) ->
# 	console.log 'article click! no page yet :)'
# 
# companion.GoalsBtn.onClick (e, l) ->
# 	companion[activeState].animate("off")
# 	companion.Your_Stats_Goals.animate("on")
# 	activeState = 'Your_Stats_Goals'
# 
# companion.StatsBtn.onClick (e, l) ->
# 	companion[activeState].animate("off")
# 	companion.Your_Stats_Bias.animate("on")
# 	activeState = 'Your_Stats_Bias'
# 
# companion.SettingsBtn.onClick (e, l) ->
# 	console.log 'settings click! no page yet :)'






