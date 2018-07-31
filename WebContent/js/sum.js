var xmlHttp
function callServer() {
	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	var city = document.getElementById("city").value;
	var state = document.getElementById("state").value;
	var url = "/scripts/getZipCode.php?methodName=" + escape(city) + "&state=" + escape(state);
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = updatePage;//回调函数
	xmlHttp.send(null);
}
function updatePage() {
	if (xmlHttp.readyState == 4) {
	var response = xmlHttp.responseText;
	document.getElementById("zipCode").value = response;
}
}