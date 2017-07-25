# The Proto Should:
# click between home and article screens
# tap or swipe between stats tabs


# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@2x", scale: 1)

artboards = []
# Define artboards; Set artboards from sketch to 0,0
for layer in Framer.CurrentContext.layers
	artboards.push(layer) if layer._info.kind == "artboard"

for artboard in artboards
	artboard.point = {x:0,y:0} 
	console.log artboard.props
	artboard.states.add 
		off: { visible: false }
		on:{ visible: true }
	
	
	artboard.states.switch("off") if artboard.name isnt 'Home'





