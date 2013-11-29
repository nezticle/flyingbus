TARGET = Flyingbus

QT += quick qml multimedia xmlpatterns sql

QTPLUGIN += qtaudio_coreaudio qsqlite

SOURCES += \
    main.cpp

OTHER_FILES += \
    qml/MainView.qml \
    qml/engine.js \
    qml/AboutMenu.qml \
    qml/Background.qml \
    qml/Balloon.qml \
    qml/Base.qml \
    qml/Button.qml \
    qml/CompleteMenu.qml \
    qml/DigitLabel.qml \
    qml/FinalSplash.qml \
    qml/FinalSplashItem.qml \
    qml/FrameSprite.qml \
    qml/GameOverMenu.qml \
    qml/HelpScreen.qml \
    qml/LeaveMenu.qml \
    qml/LevelModel.qml \
    qml/Menu.qml \
    qml/MenuAnimation.qml \
    qml/Player.qml \
    qml/PlayMenu.qml \
    qml/Score.qml \
    qml/ScoreMenu.qml \
    qml/Splash.qml \
    qml/YouWinMenu.qml \
    qml/sprites/Balloon.qml \
    qml/sprites/Bird.qml \
    qml/sprites/Cloud.qml \
    qml/sprites/LadyBug.qml \
    qml/sprites/Peace.qml \
    qml/sprites/Stone.qml \
    qml/sprites/Tree.qml \
    qml/levels/1.xml \
    qml/levels/2.xml \
    qml/levels/3.xml \
    qml/BasicSprite.qml \
    android/AndroidManifest.xml

assets.files = $$PWD/qml

osx: assets.path = Contents/MacOS/
mac: QMAKE_BUNDLE_DATA += assets
android {
    assets.path = /assets/
    INSTALLS += assets
}

ANDROID_EXTRA_LIBS = ../../Apps/Qt5.2.0/5.2.0-rc1/android_armv7/qml/QtQuick/XmlListModel/libqmlxmllistmodelplugin.so ../../Apps/Qt5.2.0/5.2.0-rc1/android_armv7/qml/QtQuick/LocalStorage/libqmllocalstorageplugin.so

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
