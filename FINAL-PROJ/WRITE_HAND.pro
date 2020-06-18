QT += quick  qml
CONFIG += c++11 qmltypes
QML_IMPORT_NAME = io.qt.examples.backend
QML_IMPORT_MAJOR_VERSION = 1
DEFINES += QT_DEPRECATED_WARNINGS


linux:!android {
PATH_INCLUDE_OPENCV=/usr/local/include/opencv4 #path include
PATH_LIBS=/usr/local/lib #path libs

#######
INCLUDEPATH += $$PATH_INCLUDE_OPENCV
LIBS += -L$$PATH_LIBS -lopencv_ml -lopencv_imgproc -lopencv_core -lopencv_imgcodecs -lopencv_highgui -lopencv_videoio

}

#############





##############
android {
    OPENCV_ANDROID="/root/Desktop/Android_Qt/OpenCv_make/OpenCV-android-sdk/OpenCV-android-sdk"  #####path for OpenCV-android-sdk 


    contains(ANDROID_TARGET_ARCH,arm64-v8a) {
        isEmpty(OPENCV_ANDROID) {
            error("Let OPENCV_ANDROID point to the opencv-android-sdk, recommended: v4.0")
        }
        INCLUDEPATH += "$$OPENCV_ANDROID/sdk/native/jni/include"
        LIBS += \
            -L"$$OPENCV_ANDROID/sdk/native/libs/arm64-v8a" \
            -L"$$OPENCV_ANDROID/sdk/native/3rdparty/libs/arm64-v8a" \
            -llibtiff \
            -llibjpeg-turbo \
            -llibjasper \
            -llibpng \
            -ltbb \
            -lcpufeatures \
            -littnotify \
            -llibprotobuf \
            -lquirc \
            -ltegra_hal \
            -llibwebp \
            -lopencv_java4 \



        ANDROID_EXTRA_LIBS = $$OPENCV_ANDROID/sdk/native/libs/arm64-v8a/libopencv_java4.so
    }
   contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
        isEmpty(OPENCV_ANDROID) {
            error("Let OPENCV_ANDROID point to the opencv-android-sdk, recommended: v4.0")
        }
        INCLUDEPATH += "$$OPENCV_ANDROID/sdk/native/jni/include"
        LIBS += \
            -L"$$OPENCV_ANDROID/sdk/native/libs/armeabi-v7a" \
            -L"$$OPENCV_ANDROID/sdk/native/3rdparty/libs/armeabi-v7a" \
            -llibtiff \
            -llibjpeg-turbo \
            -llibjasper \
            -llibpng \
            -ltbb \
            -lcpufeatures \
            -littnotify \
            -llibprotobuf \
            -lquirc \
            -ltegra_hal \
            -llibwebp \
            -lopencv_java4 \



        ANDROID_EXTRA_LIBS = $$OPENCV_ANDROID/sdk/native/libs/armeabi-v7a/libopencv_java4.so
    }
  contains(ANDROID_TARGET_ARCH,x86) {
        isEmpty(OPENCV_ANDROID) {
            error("Let OPENCV_ANDROID point to the opencv-android-sdk, recommended: v4.0")
        }
        INCLUDEPATH += "$$OPENCV_ANDROID/sdk/native/jni/include"
        LIBS += \
            -L"$$OPENCV_ANDROID/sdk/native/libs/x86" \
            -L"$$OPENCV_ANDROID/sdk/native/3rdparty/libs/x86" \
            -llibtiff \
            -llibjpeg-turbo \
            -llibjasper \
            -llibpng \
            -ltbb \
            -lcpufeatures \
            -littnotify \
            -llibprotobuf \
            -lquirc \
            -llibwebp \
            -lopencv_java4 \



        ANDROID_EXTRA_LIBS = $$OPENCV_ANDROID/sdk/native/libs/x86/libopencv_java4.so
    }
#else {
#        error("Unsupported architecture: $$ANDROID_TARGET_ARCH")
#    }
}

###########
SOURCES += \
        imgtodigitcls.cpp \
        main.cpp

RESOURCES += qml.qrc \
    icons.qrc \
    xmlimgs.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    imgtodigitcls.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew \
    android/gradlew.bat \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
