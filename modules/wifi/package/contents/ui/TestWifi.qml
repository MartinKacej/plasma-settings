import QtQuick 2.0

ListModel {
    id:wifiTesting
    ListElement {
        ssid: "Wifi test 1"
        status: "red"

    }
    ListElement {
        ssid: "Wifi test 2"
        status: "green"
    }
    ListElement {
        ssid: "Wifi test 3"
        status: "red"
    }
}
