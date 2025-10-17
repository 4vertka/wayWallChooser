#ifndef IMAGECONTROL_H
#define IMAGECONTROL_H

#include <QObject>
#include <QFileDialog>
#include <QProcess>

class ImageControl : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList imagePaths READ getImagePath NOTIFY ImagePathChanged)
public:
    explicit ImageControl(QObject *parent = nullptr);

    QStringList getImagePath();
    Q_INVOKABLE void loadImages();
    void storeImages(QString imagePath);
    Q_INVOKABLE void setWallpaper(const QUrl &imageUrl);

signals:
    void ImagePathChanged();
    void wallpapersChanged();

private:
    QStringList m_imagePaths;
};

#endif // IMAGECONTROL_H
