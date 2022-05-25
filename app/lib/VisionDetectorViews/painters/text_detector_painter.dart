import 'dart:ui';
import 'dart:ui' as ui;
import 'WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'dart:io';
import 'coordinates_translator.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TextDetectorPainter extends CustomPainter {
  TextDetectorPainter(
      this.recognisedText, this.absoluteImageSize, this.rotation);

  final RecognisedText recognisedText;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  @override
  // Widget build(BuildContext context) {
  //
  // }
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    final Paint background = Paint()..color = Color(0x99000000);

    for (final textBlock in recognisedText.blocks) {
      final ParagraphBuilder builder = ParagraphBuilder(
        ParagraphStyle(
            textAlign: TextAlign.left,
            fontSize: 16,
            textDirection: TextDirection.ltr),
      );
      builder.pushStyle(
          ui.TextStyle(color: Colors.lightGreenAccent, background: background));
      builder.addText('${textBlock.text}');
      builder.pop();

      final left =
          translateX(textBlock.rect.left, rotation, size, absoluteImageSize);
      final top =
          translateY(textBlock.rect.top, rotation, size, absoluteImageSize);
      final right =
          translateX(textBlock.rect.right, rotation, size, absoluteImageSize);
      final bottom =
          translateY(textBlock.rect.bottom, rotation, size, absoluteImageSize);

      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        paint,
      );

      canvas.drawParagraph(
        builder.build()
          ..layout(ParagraphConstraints(
            width: right - left,
          )),
        Offset(left, top),
      );

      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red[400],

        ),
      );
      Text('${textBlock.text}',
          style: TextStyle(
            color: Colors.white,
            // fontFamily: 'PoppinsBold'
          ));
      // print("text here");
      // print(textBlock.text);
      WelcomePage(name:recognisedText);
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.yellow[400],

        ),
      );
      // RaisedButton(
      //     onPressed:()
      //
      //     {
      //       WelcomePage(name:recognisedText);
      //
      //       // rec:recognisedText,
      //       // );
      //     }
      // );

    }
    // RaisedButton(
    // onPressed:()
    //
    // {
    //  CameraView1(
    //     rec:recognisedText,
    //   );
    // }
    // );

  }


     // );
  // void processPage()
  // {
  //   for (final textBlock in recognisedText.blocks) {
  //    Container(
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         color: Colors.blue[400],
  //
  //       ),
  //     );
  //     Text('${textBlock.text}',
  //         style: TextStyle(
  //           color: Colors.blue,
  //           // fontFamily: 'PoppinsBold'
  //         ));
  //
  //   }
  //   // RaisedButton(
  //   //   onPressed: () {
  //   //     Text('${textBlock.text}',
  //   //         style: TextStyle(
  //   //           color: Colors.white,
  //   //           // fontFamily: 'PoppinsBold'
  //   //         ));
  //   //   },
  //   //   color: Colors.lightBlue,
  //   //   textColor: Colors.white,
  //   //   child: Text('Extracted Text'),
  //   // );
  // }
  // RaisedButton(
  // onPressed:()
  //
  // {


  // rec:recognisedText,
  // );
  // }
  // );
  @override
  bool shouldRepaint(TextDetectorPainter oldDelegate) {
    return oldDelegate.recognisedText != recognisedText;
  }


}
//
// class WelcomePage extends StatelessWidget {
//   final  name;
//
//   WelcomePage({Key ? key,required this.name}) : super(key: key);
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Center(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Name: $name')
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

