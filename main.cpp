#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFileSystemModel>
#include <QTimer>

#include "mediacoverartprovider.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setOrganizationName("Qt Desktop Days");
    app.setOrganizationDomain("com.qtdesktopdays");

    MediaCoverArtProvider coverArtProvider;
    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/imports");
    engine.addImageProvider(QLatin1String("coverart"), &coverArtProvider);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    QFileSystemModel fileSystemModel;
    fileSystemModel.setRootPath(QDir::currentPath());
    engine.rootContext()->setContextProperty("fileSystemModel", &fileSystemModel);

    engine.load(url);

    return app.exec();
}
