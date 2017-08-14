

function moveOption(toWay) {

	var selectLeft = document.getElementById("select_left"); 
	var selectRight = document.getElementById("select_right"); 
	if ("toRight" == toWay) {
		for(var i = 0; i<selectLeft.length; i++) {
			if (selectLeft.options[i].selected) {
				var newOption = document.createElement("option"); 
				newOption.value = selectLeft.options[i].value; 
				newOption.text = selectLeft.options[i].text; 
				selectRight.add(newOption); 
				selectLeft.removeChild(selectLeft.options[i]); 
				break; 
			}
		}
		
	} else if ("toLeft" == toWay) {
		for(var i = 0; i < selectRight.length; i++) {
			if (selectRight.options[i].selected) {
				var newOption = document.createElement("option"); 
				newOption.value = selectRight.options[i].value; 
				newOption.text = selectRight.options[i].text; 
				selectLeft.add(newOption); 
				selectRight.removeChild(selectRight.options[i]); 
				break;
			}
		}
	}
}

function selectAllCommit() {
	var selectRight = document.getElementById("select_right"); 
	for(var i = 0; i < selectRight.length; i++) {
		selectRight.options[i].selected = true; 
	}
	document.forms[0].submit(); 
}













