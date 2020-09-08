import QtQuick 2.15
import QtMultimedia 5.15

CurrentMediaDesign {
    property alias mediaSource: player.source
    property alias metaData: player.metaData
    property alias player: player

    MediaPlayer {
        id: player

        autoPlay: true
    }

    mediaInfo.coverArt.source: "image://coverart/" + player.source
    mediaInfo.title.text: player.metaData.title ? player.metaData.title : "--"
    mediaInfo.album.text: player.metaData.albumTitle ? player.metaData.albumTitle : "--"
    mediaInfo.artist.text: player.metaData.albumArtist ? player.metaData.albumArtist : "--"

    textArea.text: (metaData.albumArtist ? "<b>Album Artist: </b>" + metaData.albumArtist + "<br /><br />" : "") +
                   (metaData.albumTitle ? "<b>Album Title: </b>" + metaData.albumTitle + "<br /><br />" : "") +
                   (metaData.audioBitRate ? "<b>Audio BitRate: </b>" + metaData.audioBitRate + "<br /><br />" : "") +
                   (metaData.audioCodec ? "<b>Audio Codec: </b>" + metaData.audioCodec + "<br /><br />" : "") +
                   (metaData.author ? "<b>Author: </b>" + metaData.author + "<br /><br />" : "") +
                   (metaData.averageLevel ? "<b>Average Level: </b>" + metaData.averageLevel + "<br /><br />" : "") +
                   (metaData.category ? "<b>Category: </b>" + metaData.category + "<br /><br />" : "") +
                   (metaData.channelCount ? "<b>Channel Count: </b>" + metaData.channelCount + "<br /><br />" : "") +
                   (metaData.chapterNumber ? "<b>Chapter Number: </b>" + metaData.chapterNumber + "<br /><br />" : "") +
                   (metaData.comment ? "<b>Comment: </b>" + metaData.comment + "<br /><br />" : "") +
                   (metaData.composer ? "<b>Composer: </b>" + metaData.composer + "<br /><br />" : "") +
                   (metaData.conductor ? "<b>Conductor: </b>" + metaData.conductor + "<br /><br />" : "") +
                   (metaData.contributingArtist ? "<b>Contributing Artist: </b>" + metaData.contributingArtist + "<br /><br />" : "") +
                   (metaData.copyright ? "<b>Copyright: </b>" + metaData.copyright + "<br /><br />" : "") +
                   (metaData.date ? "<b>Date: </b>" + metaData.date + "<br /><br />" : "") +
                   (metaData.description ? "<b>Description: </b>" + metaData.description + "<br /><br />" : "") +
                   (metaData.director ? "<b>Director: </b>" + metaData.director + "<br /><br />" : "") +
                   (metaData.genre ? "<b>Genre: </b>" + metaData.genre + "<br /><br />" : "") +
                   (metaData.keywords ? "<b>Keywords: </b>" + metaData.keywords + "<br /><br />" : "") +
                   (metaData.language ? "<b>Language: </b>" + metaData.language + "<br /><br />" : "") +
                   (metaData.leadPerformer ? "<b>Lead Performer: </b>" + metaData.leadPerformer + "<br /><br />" : "") +
                   (metaData.lyrics ? "<b>Lyrics: </b>" + metaData.lyrics + "<br /><br />" : "") +
                   (metaData.mediaType ? "<b>Media Type: </b>" + metaData.mediaType + "<br /><br />" : "") +
                   (metaData.mood ? "<b>Mood: </b>" + metaData.mood + "<br /><br />" : "") +
                   (metaData.parentalRating ? "<b>Parental Rating: </b>" + metaData.parentalRating + "<br /><br />" : "") +
                   (metaData.peakValue ? "<b>Peak Value: </b>" + metaData.peakValue + "<br /><br />" : "") +
                   (metaData.pixelAspectRatio ? "<b>Pixel Aspect Ratio: </b>" + metaData.pixelAspectRatio + "<br /><br />" : "") +
                   (metaData.posterUrl ? "<b>Poster Url: </b>" + metaData.posterUrl + "<br /><br />" : "") +
                   (metaData.publisher ? "<b>Publisher: </b>" + metaData.publisher + "<br /><br />" : "") +
                   (metaData.ratingOrganization ? "<b>Rating Organization: </b>" + metaData.ratingOrganization + "<br /><br />" : "") +
                   (metaData.resolution ? "<b>Resolution: </b>" + metaData.resolution + "<br /><br />" : "") +
                   (metaData.sampleRate ? "<b>Sample Rate: </b>" + metaData.sampleRate + "<br /><br />" : "") +
                   (metaData.size ? "<b>Size: </b>" + metaData.size + "<br /><br />" : "") +
                   (metaData.subTitle ? "<b>SubTitle: </b>" + metaData.subTitle + "<br /><br />" : "") +
                   (metaData.title ? "<b>Title: </b>" + metaData.title + "<br /><br />" : "") +
                   (metaData.trackCount ? "<b>Track Count: </b>" + metaData.trackCount + "<br /><br />" : "") +
                   (metaData.trackNumber ? "<b>Track Number: </b>" + metaData.trackNumber + "<br /><br />" : "") +
                   (metaData.userRating ? "<b>User Rating: </b>" + metaData.userRating + "<br /><br />" : "") +
                   (metaData.videoBitRate ? "<b>Video Bit Rate: </b>" + metaData.videoBitRate + "<br /><br />" : "") +
                   (metaData.videoCodec ? "<b>Video Codec: </b>" + metaData.videoCodec + "<br /><br />" : "") +
                   (metaData.videoFrameRate ? "<b>Video Frame Rate: </b>" + metaData.videoFrameRate + "<br /><br />" : "") +
                   (metaData.writer ? "<b>Writer: </b>" + metaData.writer + "<br /><br />" : "") +
                   (metaData.year ? "<b>Year: </b>" + metaData.year + "<br /><br />" : "")
}
