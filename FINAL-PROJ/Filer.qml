import QtQuick 2.0

import Qt.labs.folderlistmodel 2.2
import QtQuick.Controls 2.3

Item {
    id: element

    visible: true

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#6d7174"
            }

            GradientStop {
                position: 1
                color: "#aabcb8"
            }
        }
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

////////////list view of FolderListModel
/////////

        ListView {
            id: listView
            anchors.topMargin: 50
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 63
            pixelAligned: false
            anchors.fill: parent
            spacing: 4

            delegate: Button {
                id: button1
                width: parent.width

                height: 50
                text: fileName

                highlighted: false
                padding: 5
                wheelEnabled: false
                clip: true


                font.pixelSize: 14
                font.bold: true
                font.family: "Courier"
                onPressed: {

                       rectangle2.color="#ffffff"

                }
                onCanceled: {
                       rectangle2.color= "#ccc8c8"
                }
                onPressAndHold: {
                       rectangle2.color="red"
                }




                onClicked: {


                    if (fileIsDir) {
                        folderListModel.folder = fileURL
                        console.log(fileName)
                    }else
                    {
                        console.log(folderListModel.folder+"/"+fileName)
                        pathIMG=folderListModel.folder+"/"+fileName
                        filee.active=false
                        pathIMG=pathIMG.substring(7);
                        console.log(pathIMG)
                        GG.getText(pathIMG)
                        textEdit.text=GG.getString()
                       // element.visible=false
                    }
                    image.reloadImage()
                    image1.reloadImage()
                }
                background: Rectangle {
                    id: rectangle2
                    color: "#ccc8c8"
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    border.width: 2
                    border.color: "#2bdb1b"


                }
                Image {
                    id: img

                    sourceSize.width: 50

                    source: fileIsDir?"icons/folder.png":"icons/file.png"
                }
            }


            model:  FolderListModel {
                id: folderListModel
                showDirsFirst: true
                nameFilters: ["*.png","*.jpg"]
                rootFolder: "file:///"
                folder: "file:///storage/emulated/0"
            }
        }


        Rectangle {
            id: rectangle1
            y: 0
            height: 44
            color: "#2bdb1b"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            Text {
                id: element1
                width: 182
                height: 29
                color: "#ffffff"
                text: qsTr("SELECT IMG")
                font.family: "Courier"
                styleColor: "#ffffff"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 28
            }
        }






        Rectangle {
            id: rectangle3
            x: 3
            y: 414
            height: 65
            color: "#2bdb1b"
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            opacity: 1

            Button {
                x: 268
                y: 13
                text: qsTr("Button")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                contentItem: Text {
                    color: "#2bdb1b"
                    text: "<<<"
                    font.family: "Courier"
                    font.pointSize: 17
                    font.bold: true

                    opacity: enabled ? 1.0 : 0.3
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                onClicked: {
                               if(folderListModel.folder.toString() !== "file:///")
                                   folderListModel.folder = folderListModel.parentFolder
                           }

                background: Rectangle {
                    id:rect22
                    color: "#ffffff"
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    border.width: 1
                    radius: 2
                    border.color: "#2bdb1b"
                }

                onPressed: {
                    rect22.color="#000000"

                }
                onReleased: {
                    rect22.color="#ffffff"

                }
            }

            Button {
                x: 270
                y: 20
                width: 60
                height: 40
                text: qsTr("Button")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 37
                contentItem: Text {
                    color: "#d30606"
                    text: "X"
                    font.bold: true
                    font.pointSize: 17
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    horizontalAlignment: Text.AlignHCenter

                    opacity: enabled ? 1.0 : 0.3
                }
                background: Rectangle {
                    id: rect23
                    color: "#ffffff"
                    radius: 2
                    implicitHeight: 40
                    border.color: "#2bdb1b"
                    opacity: enabled ? 1 : 0.3
                    implicitWidth: 100
                    border.width: 1
                }
                onPressed: {
                    rect23.color="#000000"

                }
                onReleased: {
                    rect23.color="#ffffff"

                }

                onClicked: {
                    filee.active=false

                   //element.visible=false

                }
            }
        }
    }

}

