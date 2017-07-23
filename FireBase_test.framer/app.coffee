# admin = require 'firebase-admin'
{Firebase} = require 'firebase'
firebase = new Firebase
	projectID: "fir-test-bbcbe"
	secret: "PH6ZtghCxwaR9JLw4K9NOUMKRPAcjLW7fmJOGJIE"
value = 0;
text = new TextLayer
	textAlign: "center"
	text: value
text.centerX()

slider = new SliderComponent
	value : 0
	velocity : false
slider.center()

firebase.get "/sliderValue", (val) ->
	text.text = val

slider.on Events.MouseUp, (e) ->
	val = Math.floor slider.value * 100
	firebase.put("/sliderValue", val)

firebase.onChange "/sliderValue", (val) ->
	text.text = val
	slider.value = val / 100 if val isnt slider.value