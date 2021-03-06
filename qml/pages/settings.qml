import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    allowedOrientations: Orientation.Portrait

    Column {
        anchors.fill: parent
        spacing: Theme.paddingLarge

        PageHeader {
            //% "Setting"
            //: settings page title
            title: qsTrId("settings")
        }

        Column {
            spacing: Theme.paddingSmall
            width: parent.width

            TextField {
                id: bt
                focus: false
                //% "Bluetooth Address"
                label: qsTrId("bluetooth-address")
                placeholderText: label
                text: mooshimeter.btaddr
                width: parent.width
                EnterKey.enabled: text.length == 17
                EnterKey.onClicked: mooshimeter.btaddr = text
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
            }

            Button {
                //% "Scan for Mooshimeter"
                //: scan button in setting page
                text: qsTrId("button-scan")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: pageStack.push("discovery.qml")
            }
        }

        ComboBox {
            //% "Temperature Unit"
            label: qsTrId("temperature-unit") + ":"
            currentIndex: mooshimeter.temp_unit
            menu: ContextMenu {
                Repeater {
                    model: [
                        //% "Kelvin"
                        qsTrId("temp-unit-kelvin"),
                        //% "Celcius"
                        qsTrId("temp-unit-celcius"),
                        //% "Fahrenheit"
                        qsTrId("temp-unit-fahrenheit")
                    ]
                    MenuItem {
                        text: modelData
                        onClicked: mooshimeter.temp_unit = index
                    }
                }
            }
        }

        Column {
            spacing: Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter

            RemorsePopup { id: remorse }

            Button {
                //% "Reboot Mooshimeter"
                //: reboot button
                text: qsTrId("mooshimeter-reboot")
                anchors.horizontalCenter: parent.horizontalCenter
                //% "Rebooting Mooshimeter"
                //: remorse countdown label
                onClicked: remorse.execute(qsTrId("remorse-reboot"), mooshimeter.reboot)
            }

            Button {
                //% "Shipping Mode"
                //: shipping mode button
                text: qsTrId("mooshimeter-shipping-mode")
                anchors.horizontalCenter: parent.horizontalCenter
                //% "Rebooting Mooshimeter"
                //: remorse countdown label
                onClicked: remorse.execute(qsTrId("remorse-shipping-mode"), mooshimeter.shipping_mode)
            }
        }
    }
}
