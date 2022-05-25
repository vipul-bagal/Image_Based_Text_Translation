
import 'package:flutter/services.dart';
import 'package:google_ml_kit_example/VisionDetectorViews/gallery_extraction.dart';
import 'package:google_ml_kit_example/final.dart';

import '/authentication.dart';
import '/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Final(
                  user: _user,
                ),
              ),
            );
          },
        ),
        title: Text('IMAGE BASED TEXT TRANSLATION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
           child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  height: 200,
                  width: 1000,
                  color: Colors.deepPurple[600],
                  child: Column(
                    children: [
                      _user.photoURL != null
                          ? ClipOval(
                        child: Material(
                          color: Colors.blueGrey.withOpacity(0.3),
                          child: Image.network(
                            _user.photoURL!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                          : ClipOval(
                        child: Material(
                          color: Colors.blueGrey.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Card(
                    margin: EdgeInsets.fromLTRB(0, 2.0, 0.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,

                    ),
                  ),
                  child: Container(
                    color: Colors.white,
                    width: 530,
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                          padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          // width: 350,
                          child: Text("Name: ",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black
                            ),),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                          padding:EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          // width: 350,
                          child: Text(
                            _user.displayName!,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black
                            ),),
                        ),

                      ],
                    ),

                  ),
                ),

                Card(
                    margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,

                    ),
                  ),
                  child: Container(
                    color: Colors.white,
                    width: 530,
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                          padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          // width: 350,
                          child: Text("Email: ",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black
                            ),),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                          padding: EdgeInsets.fromLTRB(5.0,0.0,0.0,0.0),
                          // width: 350,
                          child: Text(
                            '( ${_user.email!} )',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black
                            ),),
                        ),
                      ],
                    ),

                  ),
                ),
                // SizedBox(height: 25.0),
                // Text(
                //   'Hello',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 26,
                //       ),
                // ),
                // SizedBox(height: 8.0),
                // Text(
                //    _user.displayName!,
                //   style: TextStyle(
                //     color: Colors.amber,
                //     fontSize: 26,
                //   ),
                // ),
                // SizedBox(height: 8.0),
                // Text(
                //     '( ${_user.email!} )',
                //   style: TextStyle(
                //     color: Colors.deepOrange,
                //     fontSize: 20,
                //     letterSpacing: 0.5,
                //   ),
                // ),

                Container(
                  height: 100,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                          'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                      style: TextStyle(
                          color: Colors.deepPurple[800],
                          fontSize: 14,
                          letterSpacing: 0.2),
                    ),
                  ),
                ),
                // Container(
                //   width: 300.0,
                //   height: 100.0,
                //   margin: EdgeInsets.all(10.0),
                //   decoration: new BoxDecoration(
                //       color: Colors.purple
                //   ),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) =>  TextDetectorV21View()),
                //       );
                //     },
                //     child: new Text('Text Recognition',
                //       style: TextStyle(
                //           fontStyle: FontStyle.normal,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 25.0,
                //           color: Colors.white
                //       ),),
                //
                //   ),
                // ),
                    _isSigningOut
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : ButtonTheme(
                                 minWidth: 250.0,
                                 height: 150.0,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.red[600],

                                    ),
                                    shape: MaterialStateProperty.all(
                                     RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10),

                                     ),
                                    ),
                                  ),
                                onPressed: () async {
                                  setState(() {
                                    _isSigningOut = true;
                                  });
                                  await Authentication.signOut(context: context);
                                 setState(() {
                                   _isSigningOut = false;
                                 });
                                 Navigator.of(context)
                                   .pushReplacement(_routeToSignInScreen());
                               },
                                   child: Padding(
                                     padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                       child: Text(
                                        'Sign Out',
                                           style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 2,
                                          ),
                                        ),
                                   ),
                           ),
                            ),
              ],
           ),
        ),
      ),


      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //       left: 16.0,
      //       right: 16.0,
      //       bottom: 100.0,
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Row(),
      //         _user.photoURL != null
      //             ? ClipOval(
      //           child: Material(
      //             color: Colors.blueGrey.withOpacity(0.3),
      //             child: Image.network(
      //               _user.photoURL!,
      //               fit: BoxFit.fitHeight,
      //             ),
      //           ),
      //         )
      //             : ClipOval(
      //           child: Material(
      //             color: Colors.blueGrey.withOpacity(0.3),
      //             child: Padding(
      //               padding: const EdgeInsets.all(16.0),
      //               child: Icon(
      //                 Icons.person,
      //                 size: 60,
      //                 color: Colors.blueGrey,
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 16.0),
      //         Text(
      //           'Hello',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             fontSize: 26,
      //           ),
      //         ),
      //         SizedBox(height: 8.0),
      //         Text(
      //           _user.displayName!,
      //           style: TextStyle(
      //             color: Colors.amber,
      //             fontSize: 26,
      //           ),
      //         ),
      //         SizedBox(height: 8.0),
      //         Text(
      //           '( ${_user.email!} )',
      //           style: TextStyle(
      //             color: Colors.deepOrange,
      //             fontSize: 20,
      //             letterSpacing: 0.5,
      //           ),
      //         ),
      //         SizedBox(height: 24.0),
      //         Text(
      //           'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
      //           style: TextStyle(
      //               color: Colors.blueGrey.withOpacity(0.8),
      //               fontSize: 14,
      //               letterSpacing: 0.2),
      //         ),
      //         SizedBox(height: 16.0),
      //         _isSigningOut
      //             ? CircularProgressIndicator(
      //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      //         )
      //             : ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStateProperty.all(
      //               Colors.redAccent,
      //             ),
      //             shape: MaterialStateProperty.all(
      //               RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //               ),
      //             ),
      //           ),
      //           onPressed: () async {
      //             setState(() {
      //               _isSigningOut = true;
      //             });
      //             await Authentication.signOut(context: context);
      //             setState(() {
      //               _isSigningOut = false;
      //             });
      //             Navigator.of(context)
      //                 .pushReplacement(_routeToSignInScreen());
      //           },
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      //             child: Text(
      //               'Sign Out',
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.white,
      //                 letterSpacing: 2,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}