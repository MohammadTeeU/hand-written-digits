#include<opencv2/core/core.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>
#include<opencv2/ml/ml.hpp>

#include<iostream>
#include<vector>
////////////////////////////////
/// \brief ContoursToText
///      function gets digits in img
/// \param ptContours
///
/// \param IMG0
/// origin image
/// \param IMG0_BIN
/// bainary image
/// \param listNumberDetect
/// array of numbers that is detected
/// \param ImgsDetectd
/// matrix of numbers that is detected in image
///
///
void ContoursToText(std::vector<std::vector<cv::Point> > ptContours,
                    cv::Mat IMG0 ,
                    cv::Mat IMG0_BIN ,
                    cv::Mat &listNumberDetect,
                    cv::Mat &ImgsDetectd ); //

/////////////////////////////////////////
int main()
{


     cv::Mat IMG0 = cv::imread("/root/Desktop/END_WORK/TRINING/samp.png");// read img


     ////convert imgs///
     cv::Mat IMG0_GRAY;
     cv::Mat IMG0_BIN;

     cv::cvtColor(IMG0, IMG0_GRAY, cv::COLOR_BGR2GRAY); ///cvt to GRAY color


     cv::adaptiveThreshold(IMG0_GRAY, ////////convert IMG to binary IMG 
             IMG0_BIN,
             255,
             cv::ADAPTIVE_THRESH_GAUSSIAN_C,
             cv::THRESH_BINARY_INV,
             11,
             2);

     ///////////find contours
     std::vector<std::vector<cv::Point> > Contours;
     cv::Mat optional;
     cv::findContours(IMG0_BIN, Contours, optional, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);



     ////////////////
     cv::Mat listNumberDetect,ImgsDetectd;


     ContoursToText(Contours, IMG0 ,IMG0_BIN ,listNumberDetect,ImgsDetectd);


     /////////////convert to files to used
     cv::FileStorage fslistNumberDetect("/root/Desktop/END_WORK/TRINING/TringingCode/listNumberDetectoff.xml",cv::FileStorage::WRITE);

     if (fslistNumberDetect.isOpened() == false) {
             std::cout << "error, unable to open ";
             return 0;
         }

     fslistNumberDetect<<"listNumberDetect"<<listNumberDetect;

     /////////

     cv::FileStorage fsImgsDetectd("/root/Desktop/END_WORK/TRINING/TringingCode/ImgsDetectdoff.xml",cv::FileStorage::WRITE);

     if (fsImgsDetectd.isOpened() == false) {
             std::cout << "error, unable to open ";
             return 0;
         }

     fsImgsDetectd<<"fsImgsDetectd"<<ImgsDetectd;












    return 0;
}


/////////////////////

void ContoursToText(std::vector<std::vector<cv::Point> > ptContours, cv::Mat IMG0 , cv::Mat IMG0_BIN ,cv::Mat &listNumberDetect, cv::Mat &ImgsDetectd )
{

    std::vector<int> intValidChars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};//numbers

int ii=0;

  for (int i = 0; i < ptContours.size(); i++) { ///for each contours

      ii++;
      if(cv::contourArea(ptContours[i]) > 20){
            cv::Rect Rect = cv::boundingRect(ptContours[i]);  //rect of img (edags)
            cv::rectangle(IMG0, Rect, cv::Scalar(0, 0, 255), 1); ///draw rect bound img
            /////////////////////////////////
            cv::Mat matCutOfRegoin = IMG0_BIN(Rect); // cut seleted img
            cv::Mat showIMG= IMG0(Rect);

            cv::Mat matCutOfRegoinResized;
            cv::resize(matCutOfRegoin, matCutOfRegoinResized, cv::Size(30,30));

            int intChar ;
            std::cout<<matCutOfRegoinResized;
            cv::imshow("select and press number", showIMG);
            cv::imshow("bin", matCutOfRegoinResized);
           intChar= cv::waitKey(0);




///here for auto classfication of nubmbers
//
//            if(ii>0 && ii<=500)
//                intChar=9+48;
//            if(ii>500 && ii<=1000)
//                intChar=8+48;
//            if(ii>1000 && ii<=1500)
//                intChar=7+48;
//            if(ii>1500 && ii<=2000)
//                intChar=6+48;
//            if(ii>2000 && ii<=2500)
//                intChar=5+48;
//            if(ii>2500 && ii<=3000)
//                intChar=4+48;
//            if(ii>3000 && ii<=3500)
//                intChar=3+48;
//            if(ii>3500 && ii<=4000)
//                intChar=2+48;
//            if(ii>4000 && ii<=4500)
//                intChar=1+48;
//            if(ii>4500 && ii<=5000)
//                intChar=0+48;




                    if (std::find(intValidChars.begin(), intValidChars.end(), intChar) != intValidChars.end()) {

                listNumberDetect.push_back(intChar);     //add current number selected


                cv::Mat matImageFloat;
              matCutOfRegoinResized.convertTo(matImageFloat, CV_32FC1);       // convert to float

                cv::Mat imgOneRow = matImageFloat.reshape(1, 1);       // one rows for testing

                ImgsDetectd.push_back(imgOneRow);       //imgs detected as float numbers and one rows
            }

        }
  }


}
