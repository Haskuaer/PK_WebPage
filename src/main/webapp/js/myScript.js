var i = 1;

function showMenu() {

    var hiddenItem = document.getElementById('hidden-item');
    var hiddenForm = document.getElementById('hidden-form');
    hiddenItem.classList.toggle('hidden');
    hiddenForm.classList.toggle('hidden');
}

function showDate(){

    var currDate = new Date();
    var date = document.getElementById("date");
    var day = currDate.getDate();
    var month = currDate.getMonth();
    var year = currDate.getFullYear();
    var monthName = checkMonth(month);
    date.innerHTML = "DATE: " + day + " " + monthName + " " + year;

}

function checkMonth(month) {
    var monthNames = ["stycznia", "lutego", "marca", "kwietnia", "maja", "czerwca", "lipca", "sierpnia", "września", "października", "listopada", "grudnia"];
    return monthNames[month];
}

function showTime(){
    var date = new Date();
    var h = date.getHours(); // 0 - 23
    var m = date.getMinutes(); // 0 - 59
    var s = date.getSeconds(); // 0 - 59
    
    if(h == 0){
        h = 12;
    }
    
    h = (h < 10) ? "0" + h : h;
    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    var time = h + ":" + m + ":" + s;
    document.getElementById("time").innerText = "TIME: " + time;
    document.getElementById("time").textContent = "TIME: " + time;
    
    setTimeout(showTime, 1000);
    
}

function showDateTime() {
    showDate();
    showTime();
}

function calculate() {
    var operation = document.querySelector('input[name="operations"]:checked').value;
    var firstNumber = parseFloat(document.getElementById("firstNumber").value);
    var secondNumber = parseFloat(document.getElementById("secondNumber").value);
    var result = 0;
    var symbol;

    if (isNaN(firstNumber) || isNaN(secondNumber)) {
        result.textContent = "Invalid input!";
        return;
    }

    switch (operation) {

        case 'addition':

            result = firstNumber + secondNumber;
            result = Math.round(result * 1000)/1000;
            symbol = "+";

            addToHistory(firstNumber, secondNumber, symbol, result);
            break;

        case 'division':

            if (secondNumber === 0) {
                result = "Cannot divide by zero!";
            } else {
                result = firstNumber / secondNumber;
                result = Math.round(result * 1000)/1000;
                symbol = "/";
            }

            addToHistory(firstNumber, secondNumber, symbol, result);
            break;

        case 'quadratic':

            var thirdNumber = parseFloat(document.getElementById("thirdNumber").value);
            var delta = Math.pow(secondNumber, 2) - 4 * firstNumber * thirdNumber;

            if (delta < 0) {
                result = "ERROR: Δ < 0";
            } else if (delta === 0) {
                var root = -secondNumber / (2 * firstNumber);
                root = Math.round(root * 1000)/1000;
                result = "x0: " + root;
            } else {
                var root1 = (-secondNumber + Math.sqrt(delta)) / (2 * firstNumber);
                var root2 = (-secondNumber - Math.sqrt(delta)) / (2 * firstNumber);
                root1 = Math.round(root1*1000)/1000;
                root2 = Math.round(root2*1000)/1000;
                result = "x1: " + root1 + ", x2: " + root2;
            }

            addToHistoryQ(firstNumber, secondNumber, thirdNumber, result);
            break;

        default:
            result = "Invalid operation!";
    }
}

function addToHistory(firstNumber, secondNumber, symbol,  result) {
    var table = document.getElementById("operations").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow();
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);

    cell1.textContent = i;

    if(secondNumber < 0){
        cell2.textContent = firstNumber + " " + symbol + " (" + secondNumber + ") = x";
    } else{
        cell2.textContent = firstNumber + " " + symbol + " " + secondNumber + " = x";
    }
    
    cell3.textContent = result;

    i++;
}

function addToHistoryQ(firstNumber, secondNumber, thirdNumber, result) {
    var table = document.getElementById("operations").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow();
    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);

    cell1.textContent = i;

    if(secondNumber < 0 && thirdNumber < 0){
        cell2.textContent = firstNumber + "x² + " + " (" + secondNumber + ")x + (" + thirdNumber + ") = 0";
    } else if(secondNumber < 0){
        cell2.textContent = firstNumber + "x² + (" + secondNumber + ")x + " + thirdNumber + " = 0";
    } else if(thirdNumber < 0){
        cell2.textContent = firstNumber + "x² + " + secondNumber + "x + (" + thirdNumber + ") = 0";
    } else{
        cell2.textContent = firstNumber + "x² + " + secondNumber + "x + " + thirdNumber + " = 0";
    }
    
    cell3.textContent = result;

    i++;
}

function clearResults() {
    var table = document.getElementById("operations").getElementsByTagName('tbody')[0];
    table.innerHTML = "";

    i = 1;
}

function showOperationData() {
    var operation = document.querySelector('input[name="operations"]:checked').value;
    var inputs = document.querySelectorAll("#operationData input");
    inputs.forEach(function(input) {
        input.style.display = "none";
    });

    if (operation === "quadratic") {
        document.getElementById("firstNumber").style.display = "inline-block";
        document.getElementById("secondNumber").style.display = "inline-block";
        document.getElementById("thirdNumber").style.display = "inline-block";
    } else {
        document.getElementById("firstNumber").style.display = "inline-block";
        document.getElementById("secondNumber").style.display = "inline-block";
    }
}

function setTheme(){

    const link = document.getElementById("setTheme");
    const theme = document.querySelector('input[name="theme"]:checked').value;

    link.setAttribute("href", "pk?action=setTheme+" + theme);
}

document.addEventListener('DOMContentLoaded', function () {
    let radios = document.querySelectorAll('input[name="operations"]');
    radios.forEach(function (radio) {
        radio.addEventListener('change', showOperationData);
    });
    showDateTime();
});