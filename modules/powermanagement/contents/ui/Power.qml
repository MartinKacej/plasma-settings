/*
 *   Copyright 2011 Sebastian Kügler <sebas@kde.org>
 *   Copyright 2012 Marco Martin <mart@kde.org>
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

import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.plasma.mobilecomponents 0.1 as MobileComponents
import org.kde.active.settings 0.1 as ActiveSettings

Item {
    id: webModule
    objectName: "webModule"

    width: 800; height: 500

    PlasmaCore.Theme {
        id: theme
    }

    Column {
        id: titleCol
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        PlasmaExtras.Title {
            text: settingsComponent.name
            opacity: 1
        }
        PlasmaComponents.Label {
            id: descriptionLabel
            text: settingsComponent.description
            opacity: .4
        }
    }

    ActiveSettings.ConfigGroup {
        id: screensaverConfig
        file: "kscreensaverrc"
        group: "ScreenSaver"
    }

    ActiveSettings.ConfigGroup {
        id: batteryConfig
        file: "powermanagementprofilesrc"
        group: "Battery"
        ActiveSettings.ConfigGroup {
            id: dpmsConfig
            group: "DPMSControl"
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: theme.defaultFont.mSize.height
        PlasmaExtras.Heading {
            text: i18n("Lock screen")
            level: 2
        }
        Row {
            spacing: theme.defaultFont.mSize.width
            PlasmaComponents.Switch {
                id: screensaverEnabledSwitch
                onCheckedChanged: screensaverConfig.writeEntry("Enabled", checked ? "true" : "false")
                Component.onCompleted: checked = screensaverConfig.readEntry("Enabled") == "true"
            }
            PlasmaComponents.Slider {
                id: screensaverTimeSlider
                enabled: screensaverEnabledSwitch.checked
                minimumValue: 1
                maximumValue: 60
                onValueChanged: screensaverConfig.writeEntry("Timeout", Math.round(value)*60)
                Component.onCompleted: value = screensaverConfig.readEntry("Timeout")/60
            }
            PlasmaComponents.Label {
                enabled: screensaverEnabledSwitch.checked
                opacity: enabled ? 1 : 0.6
                text: i18np("%1 minute", "%1 minutes", screensaverTimeSlider.value)
            }
        }

        PlasmaExtras.Heading {
            text: i18n("Turn off the screen")
            level: 2
        }
        Row {
            spacing: theme.defaultFont.mSize.width
            PlasmaComponents.Switch {
                id: dpmsSwitch
                onCheckedChanged: {
                    if (checked) {
                        dpmsConfig.writeEntry("idleTime", Math.round(dpmsTimeSlider.value)*60)
                    } else {
                        dpmsConfig.deleteEntry("idleTime")
                    }
                }
                Component.onCompleted: checked = dpmsConfig.readEntry("idleTime") > 0
            }
            PlasmaComponents.Slider {
                id: dpmsTimeSlider
                enabled: dpmsSwitch.checked
                minimumValue: 1
                maximumValue: 60
                onValueChanged: if (dpmsSwitch.checked) dpmsConfig.writeEntry("idleTime", Math.round(value)*60)
                Component.onCompleted: value = dpmsConfig.readEntry("idleTime")/60
            }
            PlasmaComponents.Label {
                enabled: dpmsTimeSlider.checked
                opacity: enabled ? 1 : 0.6
                text: i18np("%1 minute", "%1 minutes", dpmsTimeSlider.value)
            }
        }
    }

}