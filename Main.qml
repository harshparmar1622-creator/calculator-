import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "cal.js" as Logic

ApplicationWindow {
    visible: true
    width: 300
    height: 400
    title: "Calculator"

    property string currentValue: "0"
    property string operator: ""
    property real firstNumber: 0
    property bool enteringSecond: false


    ColumnLayout {
        anchors.fill: parent
        spacing: 4

        Text {
            id: display
            text: currentValue
            font.pointSize: 24
            horizontalAlignment: Text.AlignRight
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        GridLayout {
            columns: 4
            Layout.fillWidth: true
            Layout.fillHeight: true

            Repeater {
                model: ["7","8","9","+","4","5","6","-","1","2","3","*","0","=","AC","/"]
                delegate: Button {
                    text: modelData
                    onClicked: {
                        if (text === "AC") {
                            currentValue = "0"
                            operator = ""
                            enteringSecond = false
                        }
                        else if (text === "+" || text === "-" || text === "*" || text === "/") {
                            firstNumber = Number(currentValue)
                            operator = text
                            enteringSecond = true
                            currentValue = "0"
                        }
                        else if (text === "=") {
                            currentValue = Logic.calculate(firstNumber, Number(currentValue), operator)
                            enteringSecond = false
                        }
                        else {
                            // number input
                            if (currentValue === "0" || enteringSecond) {
                                currentValue = text
                                enteringSecond = false
                            } else {
                                currentValue += text
                            }
                        }
                    }

                }
            }

        }
    }

}
