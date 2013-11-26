import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    width: 1024
    height: 768

    title: "Flying Bus"
    visible: true

    Component.onCompleted: {
        showFullScreen();
    }

    onWidthChanged: {
        console.log("width is: " + width);
    }

    color: "red"

    property bool doLoad : false

    Loader {
        id: gameLoader
        anchors.fill: parent
    }

    Loader {
        id: splashLoader
        anchors.fill: parent
        source: "Splash.qml"
        onLoaded: gameLoader.source = "Base.qml";
    }

    Connections {
        id: gameConnection
        target: gameLoader.item
        onLevelLoaded: unlock();
    }

    Connections {
        id: splashConnection
        target: splashLoader.item
        onTimeout: unlock();
    }

    function unlock() {
        if (doLoad) {
            splashLoader.source = "";
            gameConnection.target = null;
            splashConnection.target = null;
        }

        doLoad = true;
    }

}
