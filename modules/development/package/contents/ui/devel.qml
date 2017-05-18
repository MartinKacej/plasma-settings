// -*- coding: iso-8859-1 -*-
/*
 *   Copyright 2012 Aaron Seigo <aseigo@kde.org>
 *   Copyright 2011 Sebastian Kügler <sebas@kde.org>
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

import QtQuick 2.2
import QtQuick.Layouts 1.1

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
    id: develModule
    objectName: "develModule"

    width: 800; height: 500

//     ActiveSettings.DevelSettings {
//         id: settings
//     }

    GridLayout {
        id: formLayout
        columns: 2
        rows: 4
        columnSpacing: units.gridUnit
        rowSpacing: units.gridUnit

        anchors {
            fill: parent
            margins: units.gridUnit
            leftMargin: 0
        }

        PlasmaComponents.Label {
            text: i18n("Enable Developer mode:")
            Layout.fillWidth: true
        }

        PlasmaComponents.Switch {
            id: developerMode
            checked: kcm.developerModeEnabled
            onClicked: {
                kcm.developerModeEnabled = developerMode.checked;
            }
        }

        PlasmaComponents.Label {
            text: i18n("Writable filesystem:")
            Layout.fillWidth: true
        }

        PlasmaComponents.Switch {
            id: writableFilesystem
            checked: kcm.writableFilesystemEnabled
            onClicked: {
                kcm.writableFilesystemEnabled = writableFilesystem.checked;
            }
        }

        PlasmaComponents.Label {
            id: timeZoneLabel
            text: i18n("Allow remote SSH access:")
            Layout.fillWidth: true
        }

        PlasmaComponents.Switch {
            id: ssh
            checked: kcm.sshEnabled
            onClicked: {
                kcm.sshEnabled = checked;
                // we have to check to se if it failed
                checked = kcm.sshEnabled;
            }
        }

        Item {
            width: 2
            Layout.fillHeight: true
        }
    }
}
