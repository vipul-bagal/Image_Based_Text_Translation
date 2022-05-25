
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_ml_kit_example/screens/user_info_screen.dart';
import '../authentication.dart';
import 'painters/WelcomePage.dart';
import 'package:flutter/foundation.dart';
import 'painters/text_detector_painter.dart';
import '../main.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

//import 'package:camera/camera.dart';

class TextDetectorV21View extends StatefulWidget {
  const TextDetectorV21View({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  //final Function(InputImage inputImage) onImage;
  _TextDetectorViewV21State createState() => _TextDetectorViewV21State();

}

class _TextDetectorViewV21State extends State<TextDetectorV21View> {
  late User _user;
  bool _isSigningOut = false;

  TextDetectorV2 textDetector = GoogleMlKit.vision.textDetectorV2();
  bool isBusy = false;
  CustomPaint? customPaint;
  //ScreenMode _mode = ScreenMode.liveFeed;
  //CameraController? _controller;
  File? _image;
  ImagePicker? _imagePicker;
  int _cameraIndex = 0;
  String rec="";

  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;
  String dropdownvalue='DEVANAGIRI';
  var items= [
    'DEVANAGIRI',
    'JAPANESE',
    'KOREAN',
    'CHINESE',
    // 'BENGALI',
    // 'GUJARATI',
    // 'KANNADA',
    // 'MALAYALAM',
    // 'TAMIL',
    // 'TELUGU',
    // 'ARABIC',


    // 'Chinese language',
    //     'latin language'
  ];

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
    _user = widget._user;

  }

  @override
  void dispose() async {
    super.dispose();
    await textDetector.close();
  }

  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    final Function(InputImage inputImage) onImage;

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.2,
          title: Text(
            "IBTT",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor:Colors.purple[800],
          actions: <Widget>[
            IconButton(
              padding: new EdgeInsets.fromLTRB(0,5.0,25.0,0),
              icon: const Icon(Icons.account_circle,
                color: Colors.white,
                size: 40,

              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user =
                await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        user: user,
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
    body: GestureDetector(

    child: SingleChildScrollView(

      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.fromLTRB(22.0,10.0,25.0,10.0),
            padding: EdgeInsets.all(5.0),
            width: 350,
            child: Text("Select language from list below",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Colors.black
              ),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
            padding: EdgeInsets.all(15.0),
            width: 350,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Center(
              child: DropdownButton(
                isExpanded: true,
                value:dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                focusColor: Colors.black,
                iconEnabledColor: Colors.black,
                // Text(
                //     'Select Capture Image Language'
                //
                // ),
                items: items.map((String items)
                {
                  return DropdownMenuItem(value:items,
                    child:Text(items,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black
                      ),));
                }
                ).toList(),
                onChanged:(String ?newValue)
                {
                  setState(()
                  {

                    dropdownvalue=newValue!;
                    print('${dropdownvalue}');
                    //   method1();

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextDetectorV2View(name:dropdownvalue)));
                  }
                  );
                },

              ),
            ),
          ),

          _image != null
              ? Container(
            height: 400,
            width: 400,
            color: Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.file(_image!),
                // if (widget.customPaint != null) widget.customPaint!,
              ],
            ),
          )
              : Icon(
            Icons.image,
            size: 300,
            color: Colors.black,
          ),

      Padding(
        padding: const EdgeInsets.all(10.0),

        child: Container(
          width: double.infinity,
          height: 45.0,
          margin: EdgeInsets.all(10.0),

          child: RaisedButton(
            // onPressed: () => _getImage(ImageSource.gallery),
            onPressed:(){ _getImage(ImageSource.gallery) ; },
            child: Text('Click here to select Image',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  color: Colors.white
              ),),
            color:Colors.purple[800],
            textColor: Colors.white,

          ),),
      ),



        Padding(
          padding: const EdgeInsets.all(10.0),

          child: Container(
              width: double.infinity,
               height: 45.0,
              margin: EdgeInsets.all(10.0),
     child: RaisedButton(
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:rec.toString())));
          },
          color:Colors.purple[800],
          textColor: Colors.white,
          child: Text('Translate Extracted Text',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.white
            ),)

      ),),),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: ElevatedButton(
            //     child: Text('Take a picture'),
            //     onPressed: () => _getImage(ImageSource.camera),
            //   ),
            // ),
          ]),)));
    //  ),
    //   body: _body(),
    //   floatingActionButton: _floatingActionButton(),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
   // );
    // return CameraView  (
    //     rec:rec,
    //     title: 'Image Based Text Translation Application',
    //
    //     customPaint:customPaint,
    //
    //     onImage: (inputImage){
    //      // processImage(inputImage);
    //
    //     }
    //
    // );


  }
  Future _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker?.getImage(source: source);
    if (pickedFile != null) {
      _processPickedFile(pickedFile);
    } else {
      print('No image selected.');
    }
    setState(() {});
  }
  Future _processPickedFile(PickedFile pickedFile) async {
    setState(() {
      _image = File(pickedFile.path);
    });
    final inputImage = InputImage.fromFilePath(pickedFile.path);
    //widget.onImage(inputImage);
    processImage(inputImage,dropdownvalue);
  }


  List<IdentifiedLanguage> _identifiedLanguages = <IdentifiedLanguage>[];
  final _languageIdentifier =
  GoogleMlKit.nlp.languageIdentifier(confidenceThreshold: 0.34);
  var _identifiedLanguage = '';

  Future<void> _identifyLanguage() async {

    // final recognisedText  = await textDetector.processImage(inputImage,
    //     script: TextRecognitionOptions.$v1);
    // rec=recognisedText.text;
    // if (rec == '') return;
    String language;
    try {
      language = await _languageIdentifier.identifyLanguage(rec);
    } on PlatformException catch (pe) {
      if (pe.code == _languageIdentifier.errorCodeNoLanguageIdentified) {
        language = "error: no language identified!";
      }
      language = "error: ${pe.code}: ${pe.message}";
    } catch (e) {
      language = "error: ${e.toString()}";
    }

    setState(() {
      _identifiedLanguage = language;
      print(language);
    });
  }

  // widget to show error via popup
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Language Error!',
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.red
        ),),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Select correct language. $_identifiedLanguage now",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.red
            ),),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }


  Future<void> processImage(InputImage inputImage,String v1) async {



    // _identifiedLanguage == ''
    //     ? Container()
    //     : Container(
    //     margin: EdgeInsets.only(bottom: 5),
    //     child: Text(
    //       'Identified Language: $_identifiedLanguage',
    //       style: TextStyle(fontSize: 20),
    //     ));

    // _identifyLanguage;

    String lang = "";

    // if(_identifiedLanguage == "en" || _identifiedLanguage == "mr" || _identifiedLanguage == "ne" ){
    //   lang = 'DEVANAGIRI';
    // }else if(_identifiedLanguage == "ko"){
    //   lang == "KOREAN";
    // }else if(_identifiedLanguage == "ja"){
    //   lang == "JAPANESE";
    // }else if(_identifiedLanguage == "zh"){
    //   lang == "CHINESE";
    // }
    //
    // if(lang != v1){
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => _buildPopupDialog(context),
    //   );
    // }



    if(v1=='JAPANESE'){
      final recognisedText  = await textDetector.processImage(inputImage,
          script: TextRecognitionOptions.JAPANESE );
      rec=recognisedText.text;
      // _identifyLanguage;
      //
      // if(_identifiedLanguage == "ja"){
      //   lang = "JAPANESE";
      // }
      // if(lang != v1){
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => _buildPopupDialog(context),
      //   );
      // }


      print('Found ${recognisedText.blocks.length} textBlocks');
      if (inputImage.inputImageData?.size != null &&
          inputImage.inputImageData?.imageRotation != null) {
        print("data rec text");
        print('${recognisedText.text}');
        final painter=TextDetectorPainter(
            recognisedText,
            inputImage.inputImageData!.size,
            inputImage.inputImageData!.imageRotation
        );
// // print(recognisedText);
// customPaint=CustomPaint(painter:painter);
// /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

      }
    }
// else {
// customPaint = null;
// }
//
// isBusy = false;
// if (mounted) {
// setState(() {}); }
    if(v1=='KOREAN') {final recognisedText  = await textDetector.processImage(inputImage,
        script: TextRecognitionOptions.KOREAN );
    rec=recognisedText.text;

    // _identifyLanguage;
    //
    // if(_identifiedLanguage == "ko"){
    //   lang = "KOREAN";
    // }
    // if(lang != v1){
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => _buildPopupDialog(context),
    //   );
    // }


    print('Found ${recognisedText.blocks.length} textBlocks');
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      print("data rec text");
      print('${recognisedText.text}');
      final painter=TextDetectorPainter(
          recognisedText,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation
      );
// print(recognisedText);
      customPaint=CustomPaint(painter:painter);
      /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

    } }
// else {
// customPaint = null;
// }
// isBusy = false;
// if (mounted) {
// setState(() {});}
    if(v1=='CHINESE')
    {final recognisedText  = await textDetector.processImage(inputImage,
        script: TextRecognitionOptions.CHINESE );
    rec=recognisedText.text;

    // _identifyLanguage;
    //
    // if(_identifiedLanguage == "zh"){
    //   lang = "CHINESE";
    // }
    // if(lang != v1){
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) => _buildPopupDialog(context),
    //   );
    // }


    print('Found ${recognisedText.blocks.length} textBlocks');
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      print("data rec text");
      print('${recognisedText.text}');
      final painter=TextDetectorPainter(
          recognisedText,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation
      );
// print(recognisedText);
      customPaint=CustomPaint(painter:painter);
      /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

    } }
// else {
// customPaint = null;
// }
// // final   recognisedText= await textDetector.processImage(inputImage,
// //   '${selectedlan}' );
// // print('${TextRecognitionOptions.$v1 }');
//
//
// isBusy = false;
// if (mounted) {
// setState(() {});
// }


    if(v1=='DEVANAGIRI'){
      final   recognisedText= await textDetector.processImage(inputImage,
          script: TextRecognitionOptions.DEVANAGIRI );
      // final   recognisedText= await textDetector.processImage(inputImage,
      //   '${selectedlan}' );
// print('${TextRecognitionOptions.$v1 }');
      rec=recognisedText.text;

      // _identifyLanguage;
      //
      // if(_identifiedLanguage == "en" || _identifiedLanguage == "mr" || _identifiedLanguage == "ne" ){
      //   lang = "DEVNAGIRI";
      // }
      // if(lang != v1){
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) => _buildPopupDialog(context),
      //   );
      // }



      print('Found ${recognisedText.blocks.length} textBlocks');
      if (inputImage.inputImageData?.size != null &&
          inputImage.inputImageData?.imageRotation != null) {
        print("data rec text");
        print('${recognisedText.text}');
        final painter=TextDetectorPainter(
            recognisedText,
            inputImage.inputImageData!.size,
            inputImage.inputImageData!.imageRotation
        );
        // print(recognisedText);
        customPaint=CustomPaint(painter:painter);
        /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

      }
    }
//
    if(v1=='TELUGU'){
      final   recognisedText= await textDetector.processImage(inputImage,
          script: TextRecognitionOptions.TELUGU );
      // final   recognisedText= await textDetector.processImage(inputImage,
      //   '${selectedlan}' );
// print('${TextRecognitionOptions.$v1 }');
      rec=recognisedText.text;
      print('Found ${recognisedText.blocks.length} textBlocks');
      if (inputImage.inputImageData?.size != null &&
          inputImage.inputImageData?.imageRotation != null) {
        print("data rec text");
        print('${recognisedText.text}');
        final painter=TextDetectorPainter(
            recognisedText,
            inputImage.inputImageData!.size,
            inputImage.inputImageData!.imageRotation
        );
        // print(recognisedText);
        customPaint=CustomPaint(painter:painter);
        /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

      }
    }
    if(v1=='ARABIC'){
      final   recognisedText= await textDetector.processImage(inputImage,
          script: TextRecognitionOptions.ARABIC );
      // final   recognisedText= await textDetector.processImage(inputImage,
      //   '${selectedlan}' );
// print('${TextRecognitionOptions.$v1 }');
      rec=recognisedText.text;
      print('Found ${recognisedText.blocks.length} textBlocks');
      if (inputImage.inputImageData?.size != null &&
          inputImage.inputImageData?.imageRotation != null) {
        print("data rec text");
        print('${recognisedText.text}');
        final painter=TextDetectorPainter(
            recognisedText,
            inputImage.inputImageData!.size,
            inputImage.inputImageData!.imageRotation
        );
        // print(recognisedText);
        customPaint=CustomPaint(painter:painter);
        /// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name:recognisedText)));

      }
    }
    // else {
    //   customPaint = null;
    // }
    // isBusy = false;
    // if (mounted) {
    //   setState(() {});
    // }

}
}
