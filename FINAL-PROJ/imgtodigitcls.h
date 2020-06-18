#ifndef IMGTODIGITCLS_H
#define IMGTODIGITCLS_H

#include <QObject>
#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/ml/ml.hpp>


class ImgToDigitCLS :public QObject
{
    Q_OBJECT

private:
     cv::Mat NumberIsDetectd,RowOfImgsDetect;   //for read XML files of images is detect in trining///
     cv::Mat IMG0,IMG0_BIN;  //image for proccess to text
     cv::Mat IMG0_GRAY;

     std::vector<std::vector<cv::Point> > Contours;///Contours in image that will be detectd in FindContours();

     std::string finalStr;///final string 
     QString PathIMGBin;

     cv::Ptr<cv::ml::KNearest>  kNearest= cv::ml::KNearest::create();

 public:
    ImgToDigitCLS();



    Q_INVOKABLE  QString getString(){
        return QString::fromUtf8(finalStr.c_str());
    }

    Q_INVOKABLE void readIMG(std::string Path,bool DoN=false);

    Q_INVOKABLE void FindContours();

    Q_INVOKABLE void getText(QString Path,bool DoN=false);

    Q_INVOKABLE void resetStr();

    Q_INVOKABLE void setPathBIn(QString ss){
        PathIMGBin=ss;
    }

    Q_INVOKABLE QString getPathBin()
    {
        return PathIMGBin;
    }


};

#endif // IMGTODIGITCLS_H
