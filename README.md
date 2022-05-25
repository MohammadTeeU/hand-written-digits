# Hand Written Digit By Computer

## idea of works

Handwritten recognition enables us to convert the handwriting documents into digital form. Set an image that is content a handwritten digits then detects it, and converts to ASCII that can be known by the computer.

It's the hard task of a computer because there are many types of handwritten digits. the accuracy and matches of detects `90%-98%`, can obtain this by test a knowns of samples then check the correct average results.

**Training part (classification)**
First, we need preset of hand written number as image.

 1. convert image to gray scale `cv::cvtColor(IMG0, IMG0_GRAY,cv::COLOR_BGR2GRAY); ///cvt to GRAY color`
 2. to binary 
 `cv::adaptiveThreshold(IMG0_GRAY, IMG0_BIN,255, cv::ADAPTIVE_THRESH_GAUSSIAN_C, cv::THRESH_BINARY_INV, 11,2);`
 3. find contours (i.e number in image) `cv::findContours(IMG0_BIN, Contours, optional, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);`
 4. cut each contour detect in image and display for select which is the number belong to , after select number from keyboard 
 5. `listNumberDetect.push_back(intChar);` save pressed number  as xml . [https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/FINAL-PROJ/xmlimgs/listNumberDetectF.xml]

 6. convert contour to float row `cv::Mat imgOneRow = matImageFloat.reshape(1, 1);`
 7. `ImgsDetectd.push_back(imgOneRow);` save data of contour (or number). as xml file [https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/FINAL-PROJ/xmlimgs/ImgsDetectdF.xml]

We trained about 500 samples of (0-9)


**Regression**
we used a supervised learning approach (K-nearest neighbours KNN algorithm).

 1. first read XMLs files from training 
`FILE0["listNumberDetect"] >> NumberIsDetectd;
 FILE1["fsImgsDetectd"] >> RowOfImgsDetect;`
 2. train each number with each data got form xml files
`kNearest->train(RowOfImgsDetect,cv::ml::ROW_SAMPLE,NumberIsDetectd);`

 3. read image and convert to binary for detect number in it .
 4. find contours in image `cv::findContours(IMG0_BIN,Contours, OPT, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);`
 5. convert contour to float row `cv::Mat matRow = matFloat.reshape(1, 1);`
 6. get nearest of number with data-set we had `kNearest->findNearest(matRow, 23, matAsChar);`
 7. `matAsChar` number that found

## Requirements:

-   `Qt5` ([http://qt.io](http://qt.io))
-   `OpenCV4` ([https://opencv.org](https://opencv.org))
-   compilers:
    1.  for linux: `gcc or clang`
    2.  for android: `clang with (SDK & NDK)`
    3.  for windows: `MSVC or mingw compiler`
 

## Flow of work
1-Draw Number on canvas:<br>
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/1.png"/>
<hr>
2-Click on test to get result:<br>
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/2.png"/>
<hr>
3-Select Image form local storage:<br>
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/3.png"/>
<hr>
4-Get result:<br>
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/4.png"/>
<hr>
5-Take picture from Camera:<br>
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/5.png"/>
<hr>
6-Get result:
 <img width=400 src="https://raw.githubusercontent.com/MohammadTeeU/hand-written-digits/master/screenshots/6.png"/>
<hr>

