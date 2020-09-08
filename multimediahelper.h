#ifndef MULTIMEDIAHELPER_H
#define MULTIMEDIAHELPER_H

#include <QObject>
#include <QQmlEngine>

class MultimediaHelper : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    using QObject::QObject;
};

#endif // MULTIMEDIAHELPER_H
