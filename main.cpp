#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQuick>

int main(int argc, char* argv[])
{
    QGuiApplication application(argc, argv);
    //QQmlApplicationEngine engine(QUrl("qrc:///qml/MainView.qml"));
    QQmlApplicationEngine engine(QUrl("qml/MainView.qml"));

    return application.exec();
}
