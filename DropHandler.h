#ifndef DROPHANDLER_H
#define DROPHANDLER_H

#include <QObject>
#include <QVariantMap>

class DropHandler : public QObject
{
        Q_OBJECT

    public:
        DropHandler(QObject* parent = 0);

        Q_INVOKABLE QVariantMap handleDrop(QString path);
};

#endif // DROPHANDLER_H
