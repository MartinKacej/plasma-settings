import QtQuick 2.0
import QtQuick.Controls 1.4 as Controls
import QtQuick.Layouts 1.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
PlasmaComponents.ListItem{
width: parent.width
RowLayout{
    //anchors.leftMargin: 20
    width: parent.width
    Text {
        text: ssid
        Layout.fillWidth: true
    }
    Rectangle{
        anchors.horizontalCenter: parent.Center
        //anchors.leftMargin: 20
        width: 10
        height: 10
        color: status
        }
    }
}
