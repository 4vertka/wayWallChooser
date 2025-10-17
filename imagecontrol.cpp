#include "imagecontrol.h"
#include <QLabel>

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

    //QDir dir(dialog.directory());

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

    QProcess *process = new QProcess(this);
    connect(process, &QProcess::finished, process, &QObject::deleteLater);
    QString program = "/bin/swww";
    QStringList arguments;
    arguments << "img" << localPath;
    process->start(program, arguments);

    qDebug() << localPath;


    emit wallpapersChanged();
}

