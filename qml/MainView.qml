import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    width: 1024
    height: 768

    title: "Flying Bus"
    visible: true

    Component.onCompleted: {
        showFullScreen()
    }

    property bool doLoad : false

    Loader {
        id: gameLoader
        asynchronous: true
        visible: status == Loader.Ready
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

    function unlock() {
        splashLoader.source = "";
        gameConnection.target = null;
        doLoad = true;
    }

}
