function add_phone_number_item() {

	var container = document.getElementById('phone_number_group');
	var liGroup = container.getElementsByTagName("li");
	var nextLiIndex = liGroup.length + 1;

	var textField = document.createElement("input");
	textField.type = "text";
	textField.name = "phone_number_" + nextLiIndex;
	var select = document.createElement("select");
	select.name = "phone_number_kind_" + nextLiIndex;
	var opMobile = document.createElement("option");
	opMobile.text = "Mobile";
	opMobile.value = 1;
	var opHome = document.createElement("option");
	opHome.text = "Home";
	opHome.value = 2;
	var opWork = document.createElement("option")
	opWork.text = "Work";
	opWork.value = 3;
	select.appendChild(opMobile);
	select.appendChild(opHome);
	select.appendChild(opWork)
 	var li = document.createElement("li");
 	li.appendChild(textField);
 	li.appendChild(document.createTextNode(" "));
 	li.appendChild(select)
	container.appendChild(li);

}

function add_email_address_item() {

	var container = document.getElementById('email_address_group');
	var liGroup = container.getElementsByTagName("li");
	var nextLiIndex = liGroup.length + 1;

	var textField = document.createElement("input");
	textField.type = "text";
	textField.size = 50;
	textField.name = "email_address_" + nextLiIndex;

 	var li = document.createElement("li");
 	li.appendChild(textField);

	container.appendChild(li);

}

function add_street_address_item() {

	var container = document.getElementById('street_address_group');
	var liGroup = container.getElementsByTagName("li");
	var nextLiIndex = liGroup.length + 1;

	var textField = document.createElement("input");
	textField.type = "text";
	textField.size = 50;
	textField.name = "street_address_" + nextLiIndex;

 	var li = document.createElement("li");
 	li.appendChild(textField);

	container.appendChild(li);

}

