/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
**
****************************************************************************/

import QtQuick 2.2

Item {
    id: background

    Component {
        id: itemComponent

        Image {
            id: item
            property real iniX : 0.0
            property real iniY : 0.0
            property real speed : 1.0
            property real vspeed : 1.0
            property bool tile : false

            Binding {
                target: item
                when: item.tile
                property: "width"
                value: canvas.sceneWidth
            }

            fillMode: Image.TileHorizontally
            x: item.iniX + canvas.sceneX * item.speed
            y: item.iniY - canvas.sceneY * item.vspeed
        }
    }

    Component {
        id: backgroundImageComponent

        Image {
            id: backgroundImage
            smooth: true
            height: background.height
            width: background.width
        }
    }

    function createItem(image, x, y) {
        var object = itemComponent.createObject(background);
        object.source = Qt.resolvedUrl(image);
        object.iniY = background.height - parseInt(y);
        object.iniX = parseInt(x) * background.width / 640.0;
        return object;
    }

    function createBackgroundImage(image) {
        var object = backgroundImageComponent.createObject(background);
        object.source = Qt.resolvedUrl(image);
        return object;
    }
}
