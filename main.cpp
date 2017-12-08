#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDebug>
#include <QQmlContext>
#include <QScopedPointer>

#include "DropHandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    qDebug() << engine.importPathList();

    QScopedPointer<DropHandler> dropHandler(new DropHandler());
    engine.rootContext()->setContextProperty("dropHandler", dropHandler.data());

    return app.exec();
}
