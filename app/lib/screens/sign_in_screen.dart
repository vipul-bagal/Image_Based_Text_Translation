
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '/authentication.dart';
import '/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('IMAGE BASED TEXT TRANSLATION',
          style: TextStyle(
            color: Colors.black,
          ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              SizedBox(height: 30),
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/logo_final.jpg',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Image Based \n       Text \n Translation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(height: 60),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.deepOrange,
                    ),
                  );
                },
              ),



            ],
          ),
        ),
      ),


    );
  }
}


//
// child: Padding(
// padding: const EdgeInsets.only(
// left: 16.0,
// right: 16.0,
// bottom: 180.0,
// ),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Row(),
// Expanded(
// child: Column(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Flexible(
// flex: 1,
// child: Image.asset(
// 'assets/logo_final.jpg',
// height: 120,
// width: 120,
// ),
// ),
// SizedBox(height: 20),
// Center(
// child: Text(
// 'Image Based \n       Text \n Translation',
// style: TextStyle(
// color: Colors.black,
// fontSize: 40,
// ),
// ),
// ),
// // SizedBox(height: 10),
// // Text(
// //   'Sign in options',
// //   style: TextStyle(
// //     color: Colors.black,
// //     fontSize: 30,
// //   ),
// // ),
// ],
// ),
// ),
// FutureBuilder(
// future: Authentication.initializeFirebase(context: context),
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return Text('Error initializing Firebase');
// } else if (snapshot.connectionState == ConnectionState.done) {
// return GoogleSignInButton();
// }
// return CircularProgressIndicator(
// valueColor: AlwaysStoppedAnimation<Color>(
// Colors.deepOrange,
// ),
// );
// },
// ),
// ],
// ),
// ),