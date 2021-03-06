/*
 *  Copyright 2012 Aaron Seigo <aseigo@kde.org>
 *  Copyright 2016 Marco Martin <mart@kde.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

#ifndef DEVELOPERMODE_HELPER_H
#define DEVELOPERMODE_HELPER_H

#include <kauth.h>

using namespace KAuth;

class DeveloperModeHelper : public QObject
{
    Q_OBJECT

public:
    DeveloperModeHelper(QObject *parent = 0);

public slots:
    ActionReply enable(const QVariantMap &map);
    ActionReply disable(const QVariantMap &map);
};

#endif // INTEGRATION_HELPER_H
