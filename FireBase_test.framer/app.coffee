# admin = require 'firebase-admin'
{Firebase} = require 'firebase'
firebase = new Firebase
	projectID: "fir-test-bbcbe"
	secret: "PH6ZtghCxwaR9JLw4K9NOUMKRPAcjLW7fmJOGJIE"
	debug: false
value = "00"
text = new TextLayer
	textAlign: "center"
	text: value
text.centerX()

firebase.get "/sliderValue", (val) ->
	if !val
		console.log "no val"
		val = Math.floor Math.random() * 100
		firebase.put("/sliderValue", val)
	text.text = val
	slider.value = val / 100

slider = new SliderComponent
	velocity: false
slider.center()
text2 = new TextLayer
	text: "(Note - clicking and dragging the slider won't fire an event for some reason)"
	y: slider.y + 25
	fontSize: 12
	width: slider.width
text2.centerX()

slider.onClick (e, l) ->
	val = Math.floor slider.value * 100
	firebase.patch("/", {sliderValue : val})

slider.onTapEnd (e, l) ->
	val = Math.floor slider.value * 100
	firebase.patch("/", {sliderValue : val})

RandomizeBtn.onClick (e, l) ->
	val = Math.floor Math.random() * 100
	firebase.patch("/", {"sliderValue" : val})

firebase.onChange "/sliderValue", (val) ->
	text.text = val
	slider.value = val / 100

