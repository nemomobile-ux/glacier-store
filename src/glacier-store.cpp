#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif
#include <QtGui/QGuiApplication>


#include <QtQml>
#include <QtQuick/QQuickView>
#include <QtCore/QString>
#include <QScreen>
#include <QCoreApplication>

QString getAppName(){
    return QFileInfo( QCoreApplication::applicationFilePath() ).fileName();
}

int main(int argc, char *argv[])
{
    setenv("QT_QUICK_CONTROLS_STYLE", "Nemo", 1);

    QGuiApplication app(argc, argv);
    QScreen* sc = app.primaryScreen();
    if(sc){
        sc->setOrientationUpdateMask(Qt::LandscapeOrientation
                             | Qt::PortraitOrientation
                             | Qt::InvertedLandscapeOrientation
                             | Qt::InvertedPortraitOrientation);
    }

    //qmlRegisterType<SettingsModel>("org.nemomobile.glacier.store",1,0,"NemoStoreModel");
    //qmlRegisterType<SettingsProxyModel>("org.nemomobile.glacier.store",1,0,"NemoStoreProxyModel");
    QString appName = getAppName();
    QQmlApplicationEngine* engine = new QQmlApplicationEngine( QString("/usr/share/%1/qml/%2.qml")
                                                               .arg( appName )
                                                               .arg( appName )
                                                               );

    QObject *topLevel = engine->rootObjects().value(0);
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    engine->rootContext()->setContextProperty("__window", window);

    window->setTitle(QObject::tr("Phone"));
    window->showMaximized();
    return app.exec();
}
