# The Proto Should:
# click between home and article screens
# tap or swipe between stats tabs


# Import file "CompanionApp_v1.2"
companion = Framer.Importer.load("imported/CompanionApp_v1.2@2x", scale: 1)

# Define artboards; Set artboards from sketch to 0,0
for layer in Framer.CurrentContext.layers
	layer.point = {x:0,y:0} if layer._info.kind == "artboard"

