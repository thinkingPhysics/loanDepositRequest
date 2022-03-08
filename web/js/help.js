function showHint(productType) {
    var xmlhttp = new XMLHttpRequest();
    helpText = document.getElementById("helpText");
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            if (helpText.innerHTML != "") {
                helpText.innerHTML = "";
            } else {
                document.getElementById("helpText").innerHTML = this.responseText;
            }
        }
    };
    xmlhttp.open("GET", "help.php?productType=" + productType, true);
    xmlhttp.send();
}