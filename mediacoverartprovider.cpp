#include "mediacoverartprovider.h"

#include <QMediaPlayer>
#include <QMediaMetaData>

class AsyncMediaCovertArtResponse : public QQuickImageResponse
{
public:
    AsyncMediaCovertArtResponse(const QString &id, const QSize &requestedSize)
    {
        connect(&m_player, &QMediaPlayer::metaDataAvailableChanged, this, [=]{
            auto img = m_player.metaData(QMediaMetaData::CoverArtImage).value<QImage>();
            if (requestedSize.isValid()) {
                img = img.scaled(requestedSize);
            }

            m_image = img;
            emit finished();
        });

        m_player.setMedia(QUrl(id));
    }

    QQuickTextureFactory *textureFactory() const override
    {
        return QQuickTextureFactory::textureFactoryForImage(m_image);
    }

private:
    QMediaPlayer m_player;
    QImage m_image;
};

QQuickImageResponse *MediaCoverArtProvider::requestImageResponse(const QString &id, const QSize &requestedSize)
{
    return new AsyncMediaCovertArtResponse(id, requestedSize);
}
