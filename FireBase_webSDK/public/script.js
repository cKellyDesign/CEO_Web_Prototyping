var FeApp = function () {
	var self = this;
	var config = {
		apiKey: "AIzaSyDqXCCZmTakDsyMpyzzaX5cV-STTglbIlA",
		authDomain: "fir-test-bbcbe.firebaseio.com",
		databaseURL: "fir-test-bbcbe.firebaseio.com",
		storageKucket: "fir-test-bbcbe.appspot.com"
	}
	firebase.initializeApp(config)
	// window.database = firebase.database();

	var valueRef = firebase.database().ref("sliderValue");
	function getValueCallback (snapshot) {
		self.value = snapshot.val();
		document.getElementById("valueText").innerHTML = self.value;
	}

	valueRef.once("value").then(getValueCallback);
	valueRef.on("value", getValueCallback);

	this.onAddBtnPress = function (e) {
		valueRef.set(++self.value)
	}

	this.onRandomizeValue = function (e) {
		valueRef.set(Math.floor(Math.random() * 100))
	}

	document.getElementById('addValue').addEventListener('click', this.onAddBtnPress);
	document.getElementById('randomValue').addEventListener('click', this.onRandomizeValue);
}