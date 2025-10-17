#include "imagecontrol.h"
#include <QLabel>
#include <QGuiApplication>

ImageControl::ImageControl(QObject *parent)
    : QObject{parent}
{}

void ImageControl::loadImages() {

    m_imagePaths.clear();

    QFileDialog dialog(nullptr);
    dialog.setFileMode(QFileDialog::Directory);
    dialog.setOption(QFileDialog::ShowDirsOnly, false);
    dialog.setDirectory(QDir::homePath());

    if (dialog.exec() != QDialog::Accepted) {
        qDebug() << "no dir selected";
        return;
    }

    QString selectedDir = dialog.selectedFiles().value(0);
    if (selectedDir.isEmpty()) {
        qDebug() << "no dir selected";
        return;
    }

    QDir dir(selectedDir);
    QStringList filter;
    filter << QLatin1String("*.png");
    filter << QLatin1String("*.jpg");
    filter << QLatin1String("*.jpeg");

    dir.setNameFilters(filter);
    QFileInfoList fileListInfo = dir.entryInfoList();
    QStringList fileList;
    foreach(const QFileInfo &fileinfo, fileListInfo) {
        QString imageFilter = fileinfo.absoluteFilePath();
        qDebug() << imageFilter;
        storeImages(imageFilter);
    }

    emit ImagePathChanged();
    qDebug() << "Total image loaded: " << m_imagePaths.size();
}

void ImageControl::storeImages(QString imagePath) {
    m_imagePaths.append("file://" + imagePath);
}

QStringList ImageControl::getImagePath() {
    return m_imagePaths;
}

void ImageControl::setWallpaper(const QUrl &imageUrl) {

    QString localPath = imageUrl.toLocalFile();
    QString platform = QGuiApplication::platformName();

    QProcess *process = new QProcess(this);
    connect(process, &QProcess::finished, process, &QObject::deleteLater);

    if (platform == "wayland") {
        QString program = "/bin/swww";
        QStringList arguments;
        arguments << "img" << localPath << "--transition-type" << m_transitionType;
        process->start(program, arguments);
    }

    qDebug() << localPath;

    emit wallpapersChanged();
}

QString ImageControl::transitionType() const {return m_transitionType;}

void ImageControl::setTransitionType(const QString &type) {
    if (type == m_transitionType) return;

    m_transitionType = type;

    emit transitionTypeChanged();
}
