#ifndef IMAGECONTROL_H
#define IMAGECONTROL_H

#include <QObject>
#include <QFileDialog>
#include <QProcess>

class ImageControl : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList imagePaths READ getImagePath NOTIFY ImagePathChanged)
    Q_PROPERTY(QString transitionType READ transitionType WRITE setTransitionType NOTIFY transitionTypeChanged)
public:
    explicit ImageControl(QObject *parent = nullptr);

    QStringList getImagePath();
    Q_INVOKABLE void loadImages();
    void storeImages(QString imagePath);
    Q_INVOKABLE void setWallpaper(const QUrl &imageUrl);

    QString transitionType() const;
    void setTransitionType(const QString &type);
    //Q_INVOKABLE void changeTransitionType(const QString &type);

signals:
    void ImagePathChanged();
    void wallpapersChanged();
    void transitionTypeChanged();

private:
    QStringList m_imagePaths;
    QString m_transitionType = "center";
};

#endif // IMAGECONTROL_H
