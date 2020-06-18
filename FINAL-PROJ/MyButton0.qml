import QtQuick 2.0
import QtQuick.Controls 2.0

//////////////coustom button
///////////
Button {

    contentItem: Text {
        color: "#2bdb1b"
        text: parent.text

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        font.family: "Courier"
        font.pointSize: parent.font.pointSize
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

}
