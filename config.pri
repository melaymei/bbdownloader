# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            LIBS += -lbbcascades \
                -lbbdevice \
                -lQtCore \
                -lQtXml \
                -lbbcascadespickers \
                -lclipboard \
                -lbbdata \
                -lbbsystem \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            LIBS += -lbbcascades \
                -lbbdevice \
                -lQtCore \
                -lQtXml \
                -lbbcascadespickers \
                -lclipboard \
                -lbbdata \
                -lbbsystem \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            LIBS += -lbbcascades \
                -lbbdevice \
                -lQtCore \
                -lQtXml \
                -lbbcascadespickers \
                -lclipboard \
                -lbbdata \
                -lbbsystem \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb/device) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                $$quote(${QNX_TARGET}/usr/include/bb/data) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                $$quote(${QNX_TARGET}/usr/include/bb/cascades/pickers) \
                $$quote(${QNX_TARGET}/usr/include/qt4/QtCore) \
                $$quote(${QNX_TARGET}/usr/include/bb/system)

            LIBS += -lbbcascades \
                -lbbdevice \
                -lQtCore \
                -lQtXml \
                -lbbcascadespickers \
                -lclipboard \
                -lbbdata \
                -lbbsystem \
                -lQtNetwork

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/10ppd/images/cover.png) \
        $$quote($$BASEDIR/assets/12ppd/AppCover.qml) \
        $$quote($$BASEDIR/assets/12ppd/images/cover.png) \
        $$quote($$BASEDIR/assets/12ppd/images/cover_small.png) \
        $$quote($$BASEDIR/assets/8ppd/images/cover.png) \
        $$quote($$BASEDIR/assets/9ppd/images/cover.png) \
        $$quote($$BASEDIR/assets/AppCover.qml) \
        $$quote($$BASEDIR/assets/AutoLookup.qml) \
        $$quote($$BASEDIR/assets/EScreens.qml) \
        $$quote($$BASEDIR/assets/HardwareIDs.qml) \
        $$quote($$BASEDIR/assets/HashTools.qml) \
        $$quote($$BASEDIR/assets/HelpSheet.qml) \
        $$quote($$BASEDIR/assets/OSDownloader.qml) \
        $$quote($$BASEDIR/assets/OSRepo.qml) \
        $$quote($$BASEDIR/assets/ProgressBar.qml) \
        $$quote($$BASEDIR/assets/PullToRefresh.qml) \
        $$quote($$BASEDIR/assets/SysInfo.qml) \
        $$quote($$BASEDIR/assets/html/escreens.html) \
        $$quote($$BASEDIR/assets/icons/icon_110.png) \
        $$quote($$BASEDIR/assets/icons/icon_144.png) \
        $$quote($$BASEDIR/assets/icons/icon_86.png) \
        $$quote($$BASEDIR/assets/icons/icon_90.png) \
        $$quote($$BASEDIR/assets/icons/icon_96.png) \
        $$quote($$BASEDIR/assets/images/cover.png) \
        $$quote($$BASEDIR/assets/images/cover_small.png) \
        $$quote($$BASEDIR/assets/images/ic_info.png) \
        $$quote($$BASEDIR/assets/images/ic_refresh.png) \
        $$quote($$BASEDIR/assets/images/ic_select.png) \
        $$quote($$BASEDIR/assets/js/functions.js) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/splash/aseries_landscape.png) \
        $$quote($$BASEDIR/assets/splash/aseries_portrait.png) \
        $$quote($$BASEDIR/assets/splash/lseries_landscape.png) \
        $$quote($$BASEDIR/assets/splash/lseries_portrait.png) \
        $$quote($$BASEDIR/assets/splash/nseries.png) \
        $$quote($$BASEDIR/assets/splash/pb_landscape.png) \
        $$quote($$BASEDIR/assets/splash/pb_portrait.png) \
        $$quote($$BASEDIR/assets/splash/wseries.png) \
        $$quote($$BASEDIR/assets/xml/hwid.xml) \
        $$quote($$BASEDIR/assets/xml/repo.xml) \
        $$quote($$BASEDIR/assets/xml/xml/hwid.xml) \
        $$quote($$BASEDIR/assets/xml/xml/repo.xml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/Clipboard.cpp) \
        $$quote($$BASEDIR/src/DownloadManager.cpp) \
        $$quote($$BASEDIR/src/QmlBeam.cpp) \
        $$quote($$BASEDIR/src/Settings.cpp) \
        $$quote($$BASEDIR/src/SwLookup.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/hashcalculatemd4.cpp) \
        $$quote($$BASEDIR/src/hashcalculatemd5.cpp) \
        $$quote($$BASEDIR/src/hashcalculatesha.cpp) \
        $$quote($$BASEDIR/src/main.cpp) \
        $$quote($$BASEDIR/src/timer.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/Clipboard.hpp) \
        $$quote($$BASEDIR/src/DownloadManager.hpp) \
        $$quote($$BASEDIR/src/QmlBeam.hpp) \
        $$quote($$BASEDIR/src/Settings.hpp) \
        $$quote($$BASEDIR/src/SwLookup.hpp) \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/hashcalculatemd4.hpp) \
        $$quote($$BASEDIR/src/hashcalculatemd5.hpp) \
        $$quote($$BASEDIR/src/hashcalculatesha.hpp) \
        $$quote($$BASEDIR/src/timer.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/10ppd/*.qml) \
        $$quote($$BASEDIR/../assets/10ppd/*.js) \
        $$quote($$BASEDIR/../assets/10ppd/*.qs) \
        $$quote($$BASEDIR/../assets/10ppd/images/*.qml) \
        $$quote($$BASEDIR/../assets/10ppd/images/*.js) \
        $$quote($$BASEDIR/../assets/10ppd/images/*.qs) \
        $$quote($$BASEDIR/../assets/12ppd/*.qml) \
        $$quote($$BASEDIR/../assets/12ppd/*.js) \
        $$quote($$BASEDIR/../assets/12ppd/*.qs) \
        $$quote($$BASEDIR/../assets/12ppd/images/*.qml) \
        $$quote($$BASEDIR/../assets/12ppd/images/*.js) \
        $$quote($$BASEDIR/../assets/12ppd/images/*.qs) \
        $$quote($$BASEDIR/../assets/8ppd/*.qml) \
        $$quote($$BASEDIR/../assets/8ppd/*.js) \
        $$quote($$BASEDIR/../assets/8ppd/*.qs) \
        $$quote($$BASEDIR/../assets/8ppd/images/*.qml) \
        $$quote($$BASEDIR/../assets/8ppd/images/*.js) \
        $$quote($$BASEDIR/../assets/8ppd/images/*.qs) \
        $$quote($$BASEDIR/../assets/9ppd/*.qml) \
        $$quote($$BASEDIR/../assets/9ppd/*.js) \
        $$quote($$BASEDIR/../assets/9ppd/*.qs) \
        $$quote($$BASEDIR/../assets/9ppd/images/*.qml) \
        $$quote($$BASEDIR/../assets/9ppd/images/*.js) \
        $$quote($$BASEDIR/../assets/9ppd/images/*.qs) \
        $$quote($$BASEDIR/../assets/html/*.qml) \
        $$quote($$BASEDIR/../assets/html/*.js) \
        $$quote($$BASEDIR/../assets/html/*.qs) \
        $$quote($$BASEDIR/../assets/icons/*.qml) \
        $$quote($$BASEDIR/../assets/icons/*.js) \
        $$quote($$BASEDIR/../assets/icons/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs) \
        $$quote($$BASEDIR/../assets/js/*.qml) \
        $$quote($$BASEDIR/../assets/js/*.js) \
        $$quote($$BASEDIR/../assets/js/*.qs) \
        $$quote($$BASEDIR/../assets/splash/*.qml) \
        $$quote($$BASEDIR/../assets/splash/*.js) \
        $$quote($$BASEDIR/../assets/splash/*.qs) \
        $$quote($$BASEDIR/../assets/xml/*.qml) \
        $$quote($$BASEDIR/../assets/xml/*.js) \
        $$quote($$BASEDIR/../assets/xml/*.qs) \
        $$quote($$BASEDIR/../assets/xml/xml/*.qml) \
        $$quote($$BASEDIR/../assets/xml/xml/*.js) \
        $$quote($$BASEDIR/../assets/xml/xml/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}_en.ts) \
    $$quote($${TARGET}.ts)
