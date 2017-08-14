function gspan(cobj) {
	while (true) {
		if (cobj.nextSibling.nodeName != "SPAN")
			cobj = cobj.nextSibling;
		else
			return cobj.nextSibling;
	}
}
function check(obj, info, fun,click) {
	var sp = gspan(obj);
	// alert(sp);
	obj.onfocus = function() {
		// var sp=gspan(obj);
		sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/3.png'/>"
				+ info;
		sp.className = "start2";
	}
	obj.onblur = function() {
		if (fun(this.value)) {
			sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/1.png'/>"
			sp.className = "start4";
		} else {
			sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/2.png'/>"
					+ info;
			sp.className = "start3";
		}
	}
	if(click=="click"){
		obj.onblur();
	}
}
onload = login
function login(click) {
	var stat = true;
	var username = document.getElementsByName("userName")[0];
	var password = document.getElementsByName("password")[0];
	check(username, "用户名长度为2到20", function(val) {
		if (val.match(/^\S+$/) && val.length >= 2 && val.length <= 20) {
			return true;
		} else {
			stat = false;
			return false;
		}
	},click);
	check(password, "密码长度为8到16", function(val) {
		if (val.match(/^\S+$/) && val.length >= 8 && val.length <= 16) {
			return true;
		} else {
			stat = false;
			return false;
		}
	},click);
	return stat;
}