/***************************************************************************
 *                                                                         *
 *   Copyright 2011-2014 Sebastian Kügler <sebas@kde.org>                  *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 2.2 as Controls
import org.kde.kirigami 2.2 as Kirigami
import org.kde.active.settings 2.0 as ActiveSettings

Kirigami.Page {
    title: settingsComponent.name
    property alias module: settingsComponent.module

    contentItem: ActiveSettings.SettingsComponent {
        id: settingsComponent

        property alias status: settingsLoader.status

        signal moduleLoaded


        Loader {
            id: settingsLoader
            anchors.fill: parent
        }

        ActiveSettings.Package {
            id: switcherPackage
        }

        Connections {
            target: rootItem
            onCurrentModuleChanged: {
                print("reacting to onCurrentModuleChanged " + rootItem.currentModule);
                module = rootItem.currentModule;
                if (module != "") {
                    switcherPackage.name = module
                    var mainscript = switcherPackage.filePath("mainscript");
                    if (!settingsComponent.valid) {
                        print("Failed to load module: " + module);
                    }
                    settingsLoader.source = mainscript;
                    moduleLoaded();
                }
            }
        }

        Controls.Label {
            anchors.fill: parent
            text: i18n("The module \"" + currentModule + "\" failed to load.")
            wrapMode: Text.WordWrap
            visible: !settingsComponent.valid
        }
    }
}
