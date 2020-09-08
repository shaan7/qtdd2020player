#ifndef MEDIACOVERARTPROVIDER_H
#define MEDIACOVERARTPROVIDER_H

#include <QQuickImageProvider>

class MediaCoverArtProvider : public QQuickAsyncImageProvider
{
public:
    using QQuickAsyncImageProvider::QQuickAsyncImageProvider;

    // QQuickAsyncImageProvider interface
    QQuickImageResponse *requestImageResponse(const QString &id, const QSize &requestedSize) override;
};

#endif // MEDIACOVERARTPROVIDER_H
