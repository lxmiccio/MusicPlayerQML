#include "DropHandler.h"

#include <QDebug>
#include <QFileInfo>

DropHandler::DropHandler(QObject* parent) : QObject(parent)
{

}

QVariantMap DropHandler::handleDrop(QString path)
{
    QFileInfo file(path);
    qDebug() << Q_FUNC_INFO << path << file.filePath() << file.fileName();

    QVariantMap map;
    map.insert("artist", "Artist");
    map.insert("album", "Album");
    map.insert("imagePath", "path-to-image");

    return map;
}
