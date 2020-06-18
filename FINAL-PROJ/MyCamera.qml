import QtQuick 2.0
import QtMultimedia 5.9
import QtQuick.Controls 2.3

Item {


    Timer { ///timer for wait MyCamera to save img then close
        id: timer
        function setTimeout(cb, delayTime) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.triggered.connect(function release () {
                timer.triggered.disconnect(cb); // This is important
                timer.triggered.disconnect(release); // This is important as well
            });
            timer.start();
        }
    }
    /////////////////end timer

    id:crat
    width: parent.width

    height: parent.height



    Rectangle {
        id: rectangle
        color: "#aa4208"
        border.color: "#2bdb1b"
        border.width: 9
        anchors.fill: parent

        VideoOutput { ///stream from camera
            id: videoOutput
            anchors.bottomMargin: 9
            anchors.rightMargin: 9
            anchors.leftMargin: 9
            anchors.topMargin: 9
            anchors.fill: parent


            scale:1
            rotation: 0
            autoOrientation: true
            fillMode: VideoOutput.Stretch
            source: camera



        }
        ////////



        Rectangle {
            id: rectangle1
            x: 9
            y: 554
            height: 68
            color: "#000000"
            opacity: 0.5
            anchors.right: parent.right
            anchors.rightMargin: 9
            anchors.left: parent.left
            anchors.leftMargin: 9
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 9


/////////////////////////Button for cancel

            RoundButton {
                id: roundButton1
                x: 6
                y: 14
                text: "X"
                anchors.left: parent.left
                anchors.leftMargin: 6
                hoverEnabled: false
                enabled: true
                checkable: false
                checked: false
                visible: true
                highlighted: false
                flat: false
                autoRepeat: false
                display: AbstractButton.TextBesideIcon
                onClicked: {
                    cameraa.active=false
                }
            }

/////////////////////////Button for take then save

            RoundButton {
                id: roundButton
                x: 151
                y: 14
                text: "T"
                scale: 1.2
                highlighted: false
                onClicked: {



                    camera.imageCapture.captureToLocation("img2222")

                    timer.setTimeout(function(){ ///here uses of timer

                        console.log(camera.imageCapture.capturedImagePath);
                        pathIMG=camera.imageCapture.capturedImagePath;
                        console.log(pathIMG)



                        GG.getText(pathIMG)
                        textEdit.text=GG.getString()
                        image.reloadImage()
                        image1.reloadImage()
                        cameraa.active=false;


                    }, 1000);

                }

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            /////////////////////////Slider for zoom
            Slider {
                id: zoomSlider
                x: 71
                y: -46
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 0.4
                z: 0
                anchors.verticalCenterOffset: -62
                from: 0
                to:camera.maximumDigitalZoom
                value:0
                onMoved: {
                     zoomSlider.opacity= 1
                }
                orientation: Qt.Horizontal
                stepSize:camera.maximumDigitalZoom/20

                anchors{
                    verticalCenter:parent.verticalCenter
                }
            }

            /////////////////////



        }


//////////////component link to stream of camera
        Camera {
            id: camera
            digitalZoom: zoomSlider.value

            focus {
                focusMode: Camera.FocusContinuous
                focusPointMode: Camera.FocusPointCenter
            }

        }



    }

    Text {
        id: name
        x: 8
        y: 8
        width: 98
        height: 55
        text: {
            camera.deviceId
        }


    }




}

