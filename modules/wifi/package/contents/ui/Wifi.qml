/*
 *   
 *   Copyright 2017 Martin Kacej <>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import QtQuick.Controls 1.4 as Controls
import QtQuick.Layouts 1.2
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.active.settings 2.0 as ActiveSettings
//import org.kde.kirigami 1.0 as Kirigami

Item {
    id: main
    objectName: "wifiMain"
    width: 200; height: 400
    
    Column {
        id: formLayout
        spacing:units.gridUnit
        anchors {
            fill: parent
            margins: 10
            leftMargin: 5
        }
        RowLayout{
            width: parent.width
            
            PlasmaComponents.Label {
                anchors.left:parent.left
                text: i18n("Wifi")
                Layout.fillWidth: true
            }
            
            PlasmaComponents.Switch {
                id: wifiSwitch
                checked:false 
                onClicked: {
                    
                }
            }
        }
       
        PlasmaComponents.Button{     
            id:editorButton
            text:"Connection editor"
            onClicked: {
                
            }
        }
         Rectangle{
             //separator
            width:parent.width
            height:2
            border.color:"grey" 
        }
        
        PlasmaComponents.Label {
            anchors.left:parent.left
            text: i18n("<b>Available wifi networks</b>")
            Layout.fillWidth: true
        }
        Rectangle{
            id:wifiSection
            anchors.left:parent.left
            height: parent.height
            width: parent.width
            border.color:"black"
            //Layout.fillHeight: true
            ListView {
                anchors.fill:parent
                anchors.margins:10
                spacing:10
                width:parent.width
                height: 200
                model:TestWifi{
                    id:wifiTestModel
                }
                delegate:RowItemDelegate{
                    id:wifiDelegate
                }
            }
        }
    }
}
