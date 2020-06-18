QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle
DEFINES += QT_DEPRECATED_WARNINGS


####################################################################

linux:!android {
PATH_INCLUDE_OPENCV=/usr/local/include/opencv4 #path include
PATH_LIBS=/usr/local/lib #path libs

#######
INCLUDEPATH += $$PATH_INCLUDE_OPENCV
LIBS += -L$$PATH_LIBS -lopencv_ml -lopencv_imgproc -lopencv_core -lopencv_imgcodecs -lopencv_highgui -lopencv_videoio

}

####################################################################

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
