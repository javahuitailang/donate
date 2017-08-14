function gspan(cobj) {
	while (true) {
		if (cobj.nextSibling.nodeName != "SPAN")
			cobj = cobj.nextSibling;
		else
			return cobj.nextSibling;
	}
}

function check(obj, info, fun, click) {
	//alert(obj);
	var sp = gspan(obj);
	var username = document.getElementsByName("userName")[0];
	// alert(sp);
	obj.onfocus = function() {
		// var sp=gspan(obj);
		sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/3.png'/>"
				+ info;
		sp.className = "start2";
	}

	obj.onblur = function() {
		if (fun(this.value)) {
			sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/1.png'/>可以使用"
			sp.className = "start4";
		} else {
			sp.innerHTML = "<img height='15px' width='15px' src='/images/login-register/2.png'/>"
					+ info;
			sp.className = "start3";
		}
	}
	if (click == "click") {
		obj.onblur();
	}
}

onload = regs
function regs(click) {
	var text="";
	var stat = true;
	var username = document.getElementsByName("userName")[0];
	var password = document.getElementsByName("password")[0];
	var checkPassword = document.getElementsByName("checkPassword")[0];
	var email = document.getElementsByName("email")[0];
    check(username,"用户名长度必须在2到20之间", function(val) {
			if (val.match(/^\S+$/) && val.length >= 2 && val.length <= 20) {
				return true;
			} else {
				stat = false;
				return false;
			}
		}, click);
	


	check(email, "邮箱格式为：(账号)@(哪种邮箱).(后缀名如com)", function(val) {
		if (val.match(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/) && val.length > 0
				&& val.length < 20) {
			return true;
		} else {
			stat = false;
			return false;
		}
	}, click);
	check(password, "密码长度为8到16", function(val) {
		if (val.match(/^\S+$/) && val.length >= 8 && val.length <= 16) {

			return true;
		} else {
			stat = false;
			return false;
		}
	}, click);
	check(checkPassword, "必須跟上面的密碼一致", function(val) {
		if (val.match(/^\S+$/) && val.length >= 8 && val.length <= 16
				&& val == password.value) {
			return true;
		} else {
			stat = false;
			return false;
		}
	}, click);
	return stat;
}