
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/src/vision/vision.dart';
import 'package:google_ml_kit/src/vision/vision.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit_example/NlpDetectorViews/language_translator_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/screens/sign_in_screen.dart';
import 'package:google_ml_kit_example/screens/user_info_screen.dart';
import 'VisionDetectorViews/translation.dart';
import 'VisionDetectorViews/gallery_extraction.dart';
// import 'VisionDetectorViews/text_detector_from_gzallery.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit_example/VisionDetectorViews/gallery_extraction.dart';
import '/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];


class Final extends StatefulWidget {
  const Final({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;
  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  bool _isSigningIn = false;

  String dropdownvalue='JAPANESE';
  var items= [
    'DEVANAGIRI',
    'JAPANESE'
    ,
    // 'Chinese language',
    //     'latin language'
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        title: Text('IBTT',
          style: TextStyle(
            color: Colors.white,
          ),),
        centerTitle: true,
        elevation: 0,
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
              SizedBox(height: 30),
              // _isSigningOut
              //     ? CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // )
              //     : ElevatedButton(
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all(
              //       Colors.redAccent,
              //     ),
              //     shape: MaterialStateProperty.all(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              //   onPressed: () async {
              //     setState(() {
              //       _isSigningOut = true;
              //     });
              //     await Authentication.signOut(context: context);
              //     setState(() {
              //       _isSigningOut = false;
              //     });
              //     Navigator.of(context)
              //         .pushReplacement(_routeToSignInScreen());
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              //     child: Text(
              //       'Sign Out',
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //         letterSpacing: 2,
              //       ),
              //     ),
              //   ),
              // )
              Container(
                width: 400.0,
                height: 150.0,
                margin: EdgeInsets.all(10.0),
                color: Colors.white,
                // decoration: new BoxDecoration(
                //     color: Colors.white
                // ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TextDetectorV21View(user: _user,)),
                    );
                  },
                  child: new Text('Text Recognition',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white,
                    ),),

                ),

              ),
              SizedBox(height: 10),
              Container(
                width: 400.0,
                height: 150.0,
                margin: EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Translation()),
                    );
                  },
                  child: new Text('Text Translation',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white
                    ),),

                ),

              ),


            ],
          ),
        ),
      ),

    );

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Home(),
    // );
  }
}

// child: Center(
// // backgroundColor: Colors.white,
// child: SingleChildScrollView(
// child: Padding(
// padding: EdgeInsets.symmetric(horizontal: 10),
// child: Column(
// children: [
//
// Container(
// width: 400.0,
// height: 150.0,
// margin: EdgeInsets.all(10.0),
// decoration: new BoxDecoration(
// color: Colors.purple
// ),
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) =>  TextDetectorV21View()),
// );
// },
// child: new Text('Text Recognition',
// style: TextStyle(
// fontStyle: FontStyle.normal,
// fontWeight: FontWeight.bold,
// fontSize: 25.0,
// color: Colors.white
// ),),
//
// ),
//
// ),
//
//
// Container(
// width: 400.0,
// height: 150.0,
// margin: EdgeInsets.all(10.0),
// child: ElevatedButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) =>  Translation()),
// );
// },
// child: new Text('Text Translation',
// style: TextStyle(
// fontStyle: FontStyle.normal,
// fontWeight: FontWeight.bold,
// fontSize: 25.0,
// color: Colors.white
// ),),
//
// ),
//
// ),
//
// ],
// ),
// ),
// ),
// ),








// class Home extends StatefulWidget {
//   const Home( {Key?key}):super(key:key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
// class _HomeState extends State<Home>{
//   String dropdownvalue='JAPANESE';
//   var items= [
//     'DEVANAGIRI',
//     'JAPANESE'
//     ,
//     // 'Chinese language',
//     //     'latin language'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IMAGE BASED TEXT TRANSLATION',
//           style: TextStyle(
//             color: Colors.black,
//           ),),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 children: [
//
//                   Container(
//                     width: 400.0,
//                     height: 150.0,
//                     margin: EdgeInsets.all(10.0),
//                     decoration: new BoxDecoration(
//                         color: Colors.purple
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  TextDetectorV21View()),
//                         );
//                       },
//                       child: new Text('Text Recognition',
//                         style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25.0,
//                             color: Colors.white
//                         ),),
//
//                     ),
//
//                   ),
//
//
//                   Container(
//                     width: 400.0,
//                     height: 150.0,
//                     margin: EdgeInsets.all(10.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  Translation()),
//                         );
//                       },
//                       child: new Text('Text Translation',
//                         style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25.0,
//                             color: Colors.white
//                         ),),
//
//                     ),
//
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
//

// }








class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage,
      {this.featureCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (Platform.isIOS && !featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text(
                    'This feature has not been implemented for iOS yet')));
          } else
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
        },
      ),
    );
  }
}

