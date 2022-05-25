import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'screens/sign_in_screen.dart';


void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      title: 'Register/Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}


















// void main() {
//   runApp(signIn());
// }
//
//
// class signIn extends StatefulWidget {
//   const signIn({Key? key}) : super(key: key);
//
//   @override
//   _signInState createState() => _signInState();
// }
//
// class _signInState extends State<signIn> {
//
//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//   @override
//   Widget build(BuildContext context) {
//     GoogleSignInAccount? user = _googleSignIn.currentUser;
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Google Sign In (Signed ' + (user== null? 'out' : 'in') + ')' ),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               ElevatedButton(child: Text('Sign In'),
//                   onPressed: () async {
//                 await _googleSignIn.signIn();
//
//                 setState(() {
//
//                 });
//               } ),
//
//               ElevatedButton(child: Text('Sign Out'),
//                   onPressed: () async {
//                     await _googleSignIn.signOut();
//                     setState(() {
//
//                     });
//                   }),
//             ],
//           ),
//         ),
//
//
//
//       ),
//     );
//   }
// }


