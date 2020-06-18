import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3
import QtMultimedia 5.9
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQml 2.0
import Qt.labs.platform 1.1

Window {
    property var pathIMG: ""

    property string colorGGG: "#41cd52"
    id: window
    visible: true
    width: 720
    height: 750


    title: qsTr("HAND WRITTEN DIGITS")



    ///////////////

    Rectangle {



        id: rectangle3
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#114336"
            }

            GradientStop {
                position: 0.458
                color: "#28ac89"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }

            GradientStop {
                position: 0.998
                color: "#195545"
            }

        }
        anchors.fill: parent
    }




    Rectangle {
        id: rectangle4
        y: 0
        height: 69
        color: "#4d7f72"
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Text {
            id: element
            x: 49
            y: 28
            color: "#ffffff"
            text: qsTr("HAND WRITTEN DIGITS")
            anchors.verticalCenterOffset: 2
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            padding: 1
            font.letterSpacing: 0
            font.wordSpacing: 0
            font.italic: false
            font.capitalization: Font.AllUppercase
            font.family: "Verdana"
            font.bold: true
            styleColor: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 30 * window.width/700
        }

        Rectangle {
            id: rectangle5
            x: 18
            width: 25
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }

    ColumnLayout {
        id: columnLayout1
        height: 229
        anchors.topMargin: 62
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top



        Rectangle {
            id: rectangle

            height: 137
            color: colorGGG
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            width: 207

            TextEdit {
                id: textEdit
                color: "#ffffff"
                text:GG.getString()
                anchors.bottomMargin: 31
                clip: true
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                font.family: "Courier"
                font.bold: true
                padding: 13
                anchors.fill: parent
                font.pixelSize: 21
                // anchors.left: rectangle.left-10
                // anchors.right: rectangle.right-10
            }

            MyButton0 {
                id: myButton0
                x: 137
                y: 112
                width: 70
                height: 25
                text: "COPY"
                wheelEnabled: true
                autoExclusive: true
                font.pointSize: 9
                anchors.right: rectangle.right
                onClicked: {
                    textEdit.selectAll()
                    textEdit.copy()
                }
            }

            MyButton0 {
                id: myButton1
                x: 0
                y: 112
                width: 70
                height: 25
                text: "CLEAR"
                font.pointSize: 9
                wheelEnabled: true
                autoExclusive: true

                anchors.left: rectangle.left
                onClicked: {

                    textEdit.selectAll()
                    textEdit.clear()
                    GG.resetStr()







                }
            }
        }

        RowLayout {
            id: rowLayout
            y: 160
            width: 207
            height: 42
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

            MyButton0 {




                id: button
                text: "Select PIC"
                Layout.fillHeight: false
                Layout.fillWidth: false




                onClicked: {
                    filee.active=true







                }
            }

            MyButton0 {



                id: button1
                text: "Take PIC"
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter


                onClicked: {
                    cameraa.active=true


                }
            }



        }
    }


    Rectangle {
        id: rectangle2
        y: 300
        width: 353
        height: window.height/2.5


        color: "#513d2a"
        radius: 2
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.right: rectangle00.left
        anchors.leftMargin: 8
        border.width: 8
        border.color:colorGGG

        Draw0 {
            id: draw0
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.bottomMargin: 8
            anchors.topMargin: 8
            anchors.fill: parent

        }


    }

    Rectangle {
        id: rectangle00
        x: 547
        y: 300
        width: 165
        height: window.height/2.5

        color: "#513d2a"
        radius: 2
        anchors.right: parent.right


        anchors.rightMargin: 8
        border.width: 8
        border.color:colorGGG


        Image {

            id: image
            height: 130
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.topMargin: 8

            cache: false

            source: "file://"+GG.getPathBin()+"/Bin0000.png"
            fillMode: Image.PreserveAspectFit

            function reloadImage() {
                var oldSource = source
                source = ""
                source = oldSource
            }


        }

        Image {
            id: image1
            x: -9
            y: 144
            height: 128
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.right: parent.right
            cache: false
            anchors.leftMargin: 8
            source: "file://"+GG.getPathBin()+"/Bin1111.png"
            anchors.left: parent.left
            anchors.rightMargin: 8
            fillMode: Image.PreserveAspectFit
            function reloadImage() {
                var oldSource = source
                source = ""
                source = oldSource
            }

        }




    }


    Rectangle {
        // anchors.top: columnLayout1.bottom
        id: rectangle1
        y: 680
        height: 80 * window.height/1000
        color: "#4d7f72"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0



        Text {
            id: element1
            x: 204
            y: 20
            color: "#ffffff"
            text: qsTr("@DEVs BY MOHAMMAD & MOHAMMED")
            font.bold: true
            font.family: "Courier"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }




    }

    Loader{
        id:cameraa
        x: 0
        y: 664
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        active: false


        anchors.fill: parent
        source:"MyCamera.qml"

    }

    Loader{
        id:filee
        x: 0
        y: 664
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        active: false

        anchors.fill: parent
        source:"Filer.qml"

    }

































}



/*##^##
Designer {
    D{i:8;anchors_x:63}D{i:9;anchors_height:68;anchors_width:200;anchors_x:35;anchors_y:0}
D{i:7;anchors_width:720;anchors_x:0}D{i:19;anchors_x:0;anchors_y:"-276"}
}
##^##*/
