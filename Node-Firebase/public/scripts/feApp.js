var DEBUG = true;
var doUpdate = true;

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
	this.nodeFirebaseAPI = new NodeFirebaseAPI(firebase);

	var valueRef = firebase.database().ref("sliderValue");
	function getValueCallback (snapshot) {
		$("#valueText").html(self.value);
		var val = snapshot.val()
		if (doUpdate && val == self.value) {
			if (DEBUG) console.log('Uddate Feedback Loop Terminated!!' + self.value + ' === ' + val);
			return false;
		} else {
			if (DEBUG) console.log('Realtime "value" update');
		}
		self.value = val;
		

		self.nodeFirebaseAPI.updateValue("sliderValue", self.value)
	}

	// valueRef.once("value").then(getValueCallback);
	valueRef.on("value", getValueCallback);

	this.onAddBtnPress = function (e) {
		valueRef.set(++self.value)
	}

	this.onRandomizeValue = function (e) {
		// valueRef.set(Math.floor(Math.random() * 100))
		self.value = Math.floor(Math.random() * 100)
		console.log('0 - click button, call helper func')
		self.nodeFirebaseAPI.updateValue("sliderValue", self.value)
	}

	$('#addValue').on('click', this.onAddBtnPress);
	$('#randomValue').on('click', this.onRandomizeValue);



}

var NodeFirebaseAPI = function (app) {
	var self = this;

	this.updateValue = function (refStr, payload) {
		var url = '//localhost:8080/update';
		doUpdate = false;
		console.log('1 - turn off doUpdate, update')
		self.ajaxAPIcallHandler(refStr, "PUT", payload, self.updateValueCallback);
	}

	this.updateValueCallback = function (res) {
		doUpdate = true;
		console.log('3 - callback from ajax, set doUpdate to true')
	}

	this.ajaxAPIcallHandler = function (refStr, method, payload, callback) {
		if (!refStr || typeof refStr != 'string' || !method || typeof method != 'string') return false;

		var url = '//localhost:8080/'
		switch (method) {
			case ("PUT") :
			default :
				url = url + 'update?' + encodeURIComponent(refStr) + '=' + encodeURIComponent(payload);
			break;
		}

		if (DEBUG) console.log('ajaxAPIcallHandler url - ' + url)
		console.log('2 - call ajax')
		$.ajax({
			url: url,
			method: method,
			success: callback,
			error: callback
		})
	}
}