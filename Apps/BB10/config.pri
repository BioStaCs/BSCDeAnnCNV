# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            LIBS += -lQtCore \
                -lcurl

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            LIBS += -lQtCore \
                -lcurl

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            LIBS += -lQtCore \
                -lcurl

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/qt4/QtCore)

            LIBS += -lQtCore \
                -lcurl

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/10ppd/images/flow_1.png) \
        $$quote($$BASEDIR/assets/12ppd/images/flow_1.png) \
        $$quote($$BASEDIR/assets/DetailsPage.qml) \
        $$quote($$BASEDIR/assets/favicon.ico) \
        $$quote($$BASEDIR/assets/favicon.png) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/mindw7h6128du/images/flow_1.png) \
        $$quote($$BASEDIR/assets/mindw80h80du/images/flow_1.png) \
        $$quote($$BASEDIR/assets/query.png)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/applicationui.hpp) \
        $$quote($$BASEDIR/src/lambda.h) \
        $$quote($$BASEDIR/src/lambdaBMP.h)
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
        $$quote($$BASEDIR/../assets/mindw7h6128du/*.qml) \
        $$quote($$BASEDIR/../assets/mindw7h6128du/*.js) \
        $$quote($$BASEDIR/../assets/mindw7h6128du/*.qs) \
        $$quote($$BASEDIR/../assets/mindw7h6128du/images/*.qml) \
        $$quote($$BASEDIR/../assets/mindw7h6128du/images/*.js) \
        $$quote($$BASEDIR/../assets/mindw7h6128du/images/*.qs) \
        $$quote($$BASEDIR/../assets/mindw80h80du/*.qml) \
        $$quote($$BASEDIR/../assets/mindw80h80du/*.js) \
        $$quote($$BASEDIR/../assets/mindw80h80du/*.qs) \
        $$quote($$BASEDIR/../assets/mindw80h80du/images/*.qml) \
        $$quote($$BASEDIR/../assets/mindw80h80du/images/*.js) \
        $$quote($$BASEDIR/../assets/mindw80h80du/images/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)