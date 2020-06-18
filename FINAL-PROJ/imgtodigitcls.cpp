#include "imgtodigitcls.h"
#include <QDebug>
#include <QGuiApplication>
#include<QFile>
ImgToDigitCLS::ImgToDigitCLS()
{


    //end///////////////////////////////////////////////////
    /// \brief
    /// read and convert file form XML to cv::Mat;
    ///
    ///
    ///
    ///

    cv::FileStorage FILE0;
    QFile qFile(":/xmlimgs/listNumberDetectF.xml");
    if (qFile.open(QFile::ReadOnly))
    {
        QTextStream qTextStream(&qFile);
        std::string str = qTextStream.readAll().toStdString();

         FILE0.open(str, cv::FileStorage::MEMORY);


    }
    cv::FileStorage FILE1;
    QFile qFile1(":/xmlimgs/ImgsDetectdF.xml");
    if (qFile1.open(QFile::ReadOnly))
    {
        QTextStream qTextStream(&qFile1);
        std::string str = qTextStream.readAll().toStdString();

         FILE1.open(str, cv::FileStorage::MEMORY);


    }

   // cv::FileStorage FILE0(":/xmlimgs/listNumberDetect.xml", cv::FileStorage::READ); //read files && checking if valid
  //  cv::FileStorage FILE1(":/xmlimgs/ImgsDetectd.xml", cv::FileStorage::READ);

  //  /storage/emulated/0/
    if (FILE0.isOpened() == false) {
        std::cout << "cannot open file\n\n";
        //return;
    }
    if (FILE1.isOpened() == false) {
        std::cout << "cannot open file\n\n";
       // return;
    }

    FILE0["listNumberDetect"] >> NumberIsDetectd; //read to cv::Mat files
    FILE1["fsImgsDetectd"] >> RowOfImgsDetect;

    FILE0.release();//close files
    FILE1.release();

    //end///////////////////////////////////////////////////






     kNearest->train(RowOfImgsDetect,cv::ml::ROW_SAMPLE,NumberIsDetectd);



}

void ImgToDigitCLS::readIMG(std::string Path,bool DoN)
{



     //end///////////////////////////////////////////////////
    /// \brief
    /// just read IMG from path in cv::Mat
    /// then convert to binary img
    ///
    ///
    ///







    IMG0 =cv::imread((Path));
    cv::resize(IMG0, IMG0, cv::Size(640, 480), 0, 0, cv::INTER_CUBIC);
    if(IMG0.empty())
    {
        qDebug()<<"cannot open img \n";
    }





    cv::cvtColor(IMG0, IMG0_GRAY, cv::COLOR_BGR2GRAY);

    if(!DoN)
    {
   // cv::threshold(IMG0_GRAY,IMG0_BIN,0,255,cv::THRESH_BINARY_INV);
    cv::adaptiveThreshold(IMG0_GRAY,
            IMG0_BIN,
            255,
            cv::ADAPTIVE_THRESH_GAUSSIAN_C,
            cv::THRESH_BINARY_INV,
            11,
            2);

    }else {
        IMG0_BIN=IMG0_GRAY;
    }

}





void ImgToDigitCLS::FindContours()
{


     //end///////////////////////////////////////////////////
    /// \brief
    /// search for all Contours in binary IMG_BIN and save in cv::Mat
    /// 
    ///
    ///
    ///




    std::vector<cv::Vec4i> OPT;   //optional Arg for information of contours

    cv::findContours(IMG0_BIN,      //input Binary image
        Contours,                   //output Binary Vectors of points
        OPT,                        //optional
        cv::RETR_EXTERNAL,          //take only external points of contours
        cv::CHAIN_APPROX_SIMPLE);   //method of taking of points

    std::sort(Contours.begin(), Contours.end(),  //sort contours /////

              [](const std::vector<cv::Point> &a, const std::vector<cv::Point> &b) {
                  return  ((cv::boundingRect(a).x < cv::boundingRect(b).x));
              }

              );

//    for (int i=0;i<Contours.at(0).size();i++) {
//        std::cout<<Contours.at(0).at(i);

//    }


}




void ImgToDigitCLS::getText(QString path,bool DoN)
{

     //end///////////////////////////////////////////////////
    /// \brief
    /// for each Contours will search for match possibles in kNearest obj 
    /// then save in string 
    ///
    ///
    ///



   std::string Path=path.toStdString();

    readIMG(Path,DoN);
    FindContours();


    for (int i =0; i< Contours.size(); i++) {            // for each contour

        if(cv::contourArea(Contours[i]) > 100){

        cv::rectangle(IMG0,
           cv::boundingRect(Contours[i]),
            cv::Scalar(0, 255, 0),
            2);


        cv::Mat matCut = IMG0_BIN(cv::boundingRect(Contours[i]));

        cv::Mat matResized;
        cv::resize(matCut, matResized, cv::Size(30, 30));

        cv::Mat matFloat;
        matResized.convertTo(matFloat, CV_32FC1);

        cv::Mat matRow = matFloat.reshape(1, 1);

        cv::Mat matAsChar(0, 0, CV_32F);

        kNearest->findNearest(matRow, 23, matAsChar);

        float Number = (float)matAsChar.at<float>(0, 0);

        finalStr = finalStr + char(int(Number));
        cv::rectangle(IMG0_BIN,
           cv::boundingRect(Contours[i]),
            cv::Scalar(0, 255, 0),
            2);

    }
    }
    //save two img to show what happen
    cv::imwrite(PathIMGBin.toStdString()+"/Bin0000.png",IMG0);
    cv::imwrite(PathIMGBin.toStdString()+"/Bin1111.png",IMG0_BIN);

//cv::imshow("matTestingNumbers", IMG0);
//cv::waitKey();





}

void ImgToDigitCLS::resetStr()
{

    finalStr="";

}
