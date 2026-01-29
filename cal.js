function calculate(a, b, operator) {
    if (operator === "+") return a + b;
    if (operator === "-") return a - b;
    if (operator === "*") return a * b;
    if (operator === "/") {
        if (b === 0) return "Error";
        return a / b;
    }
    return "Invalid";
}

function clear() {
    return "0";
}
