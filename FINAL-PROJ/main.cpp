#include <QGuiApplication>
#include<QQmlApplicationEngine>
#include<QStandardPaths>
#include<QQmlContext>
#include<QDir>
#include "imgtodigitcls.h"
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);


    QGuiApplication app(argc, argv);





    ImgToDigitCLS obj;
    obj.setPathBIn(QStandardPaths::writableLocation(QStandardPaths::PicturesLocation));




    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("GG",&obj);
    engine.rootContext()->setContextProperty("applicationDirPath", QGuiApplication::applicationDirPath());

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    engine.load(url);



    return app.exec();
}
