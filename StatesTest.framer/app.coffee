# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@2x", scale: 1)
Framer.Device.deviceType = "apple-iphone-6s-space-gray" # todo - module for device detection?

debug = true

activeState = 'Home'
screens = []
globalNav = companion._GlobalNav;
statsNav = companion._StatsNav;

# globalNav.y = Align.bottom()
onOffStates = {off: visible: false, opacity: 1; on: visible: true, opacity: 1}
statsNav.centerX()
statsNav.y = 95

# define screen states
statsNav.states = onOffStates
companion._Goals_a_BG.states = onOffStates
companion._Bias_a_BG.states = onOffStates
companion._Topics_a_BG.states = onOffStates
companion._Goals_a_BG.animate("off")
companion._Bias_a_BG.animate("off")
companion._Topics_a_BG.animate("off")
statsNav.animate("off") if activeState == 'Home'

companion.BreakdownCTA.opacity = 0

globalNav.centerX()
globalNav.y = Align.bottom()

# Define artboards; Set artboards from sketch to 0,0
for layer in Framer.CurrentContext.layers
	screens.push(layer) if layer._info.kind == "artboard" && layer isnt globalNav and layer isnt statsNav

# Define Screen states
for screen in screens
	screen.point = {x:0,y:0} 
	screen.states.on = visible: true, opacity: 1
	screen.states.off = visible: false, opacity: 1
		
	screen.states.switch("off") if screen.name != activeState


# Global Nav Event Listeners
companion._HomeBtn.onClick (e, l) -> switchToScreen('Home')
companion._ArticlesBtn.onClick (e, l) -> console.log 'article click! no page yet :)'
companion._GoalsBtn.onClick (e, l) -> switchToScreen('Goals')
companion._StatsBtn.onClick (e, l) -> switchToScreen('Bias')
companion._SettingsBtn.onClick (e, l) -> console.log 'settings click! no page yet :)'

companion._Goals_p_BG.onClick (e, l) ->
	switchToScreen('Goals')
	companion._Goals_a_BG.visible = true

companion._Bias_p_BG.onClick ->
	switchToScreen('Bias')
	companion._Bias_a_BG.visible = true

companion._Topics_p_BG.onClick ->
	switchToScreen('Topics')
	companion._Topics_a_BG.visible = true

# Function to handle screen switching
switchToScreen = (screen) ->
	companion[activeState].animate("off")
	companion[screen].animate("on")
	activeState = screen
	
	if screen == 'Home'
		statsNav.animate("off")
	else
		statsNav.animate("on")
		companion._Goals_a_BG.visible = false
		companion._Bias_a_BG.visible = false
		companion._Topics_a_BG.visible = false


# companion.BreakdownCTA.states.on =
# 	visible: true


companion.BreakdownCTA.states.tapped = y: companion.BreakdownCTA.y, opacity: 1
companion.BreakdownCTA.states.untapped = y: companion.BreakdownCTA.y + 100, opacity: 0
companion.BreakdownCTA.animate("untapped")

# companion.BreakdownCTA.animate("off")
companion.HomeCube.states.tapped = y : companion.HomeCube.y - 100
companion.TapIndicators.states.tapped = y : companion.TapIndicators.y - 100

companion.HomeCube.onClick ->
	companion.HomeCube.stateCycle("tapped", "previous")
	companion.BreakdownCTA.stateCycle("tapped", "previous")
	companion.TapIndicators.stateCycle("tapped", "previous")
	





