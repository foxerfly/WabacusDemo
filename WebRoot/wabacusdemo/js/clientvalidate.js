
/**
 * 验证是否是合法的年龄
 */
function isValidAge(strAge, boxObj,paramsObj) {
	var age = null;
	try {
		age = parseInt(strAge);
	}
	catch (e) {
		return false;
	}
	if (age <= 0 || age >= 200) {
		return false;
	}
	return true;
}

