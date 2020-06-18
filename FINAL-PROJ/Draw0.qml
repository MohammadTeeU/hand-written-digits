import QtQuick 2.0
import QtMultimedia 5.9
import Qt.labs.platform 1.1
Canvas {
    id:cc22
    property int prevX:0
    property int prevY:0
    antialiasing: true
    property bool clearOK: false
    property string pathDraw: ""




    anchors.rightMargin: 8
    anchors.leftMargin: 8
    anchors.bottomMargin: 8
    anchors.topMargin: 8
    anchors.fill: parent

////////area in canves to draw by mouse
    MouseArea {
        id:mousearea

        anchors.fill: parent
        onPressed: {cc22.prevX = mouseX ; cc22.prevY = mouseY}
        onPositionChanged:
        {

            cc22.requestPaint();
        }


        //////////Button TEST////////////////////
        //////draw then click to Button will save img in dir pictures
        //////


        MyButton0 {
            id: myButton0
            x: 6
            y: 229
            width: 76
            height: 31
            text: "TEST"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            onClicked: { 



                pathDraw=StandardPaths.writableLocation(StandardPaths.PicturesLocation)
                pathDraw=pathDraw.substring(7)
            

                cc22.save(pathDraw+"/DRAW00.png")
                GG.getText(pathDraw+"/DRAW00.png",true)
                textEdit.text=GG.getString()

                clearOK=true
                cc22.requestPaint();
                image.reloadImage()
                image1.reloadImage()
            }
        }

        ///end Button///////

    }


/////proprty will call when signal is calling requestPaint();

    onPaint: {  
        var ctx = getContext('2d');

        ctx.beginPath();

        ctx.strokeStyle = "#ffffff"
        ctx.lineWidth =8
        ctx.moveTo(prevX, prevY);
        prevX=mousearea.mouseX
        prevY=mousearea.mouseY

        ctx.lineTo(prevX, prevY);

        ctx.stroke();
        if(clearOK)
        {
            ctx.reset()

            clearOK=false
            cc22.requestPaint();
        }



    }





}

