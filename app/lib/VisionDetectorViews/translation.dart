import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:translator/translator.dart';

class Translation extends StatefulWidget {
  @override
  _TranslationState createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {
  // Initial Selected Value
  String dropdownvalue = 'English';

// List of items in our dropdown menu
//   var items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
  GoogleTranslator translator = GoogleTranslator();

  String transalateLanguage="";
  // String selectedLanguage = dropdownvalue.toString();

  // list all language
  var items = [

    "Arabic",
    'Bengali',
    'Dutch',
    'English',
    'French',
    'Georgian',
    'German',
    'Greek',
    'Gujarati',
    'Hindi',
    'Italian',
    'Japanese',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Nepali',
    'Norwegian',
    'Polish',
    'Portuguese',
    'Punjabi',
    'Sindhi',
    'Spanish',
    'Tamil',
    'Telugu',
    'Turkish',
    'Urdu'
  ];

  String out="";
  final lang = TextEditingController();
  String textfieldtext="";
  void trans() {

    if (dropdownvalue == 'Arabic') {
      transalateLanguage = 'ar';
    }  else if (dropdownvalue == 'Bengali') {
      transalateLanguage = 'bn';
    }  else if (dropdownvalue == 'Dutch') {
      transalateLanguage = 'nl';
    } else if (dropdownvalue == 'English') {
      transalateLanguage = 'en';
    } else if (dropdownvalue == 'French') {
      transalateLanguage = 'fr';
    }
    else if (dropdownvalue == 'Georgian') {
      transalateLanguage = 'ka';
    } else if (dropdownvalue == 'German') {
      transalateLanguage = 'de';
    } else if (dropdownvalue == 'Greek') {
      transalateLanguage = 'el';
    } else if (dropdownvalue == 'Gujarati') {
      transalateLanguage = 'gu';
    } else if (dropdownvalue == 'Hindi') {
      transalateLanguage = 'hi';
    }  else if (dropdownvalue== 'Italian') {
      transalateLanguage = 'it';
    } else if (dropdownvalue == 'Japanese') {
      transalateLanguage = 'ja';
    }else if (dropdownvalue == 'Kannada') {
      transalateLanguage = 'kn';
    }
    else if (dropdownvalue == 'Malayalam') {
      transalateLanguage = 'ml';
    }  else if (dropdownvalue == 'Marathi') {
      transalateLanguage = 'mr';
    } else if (dropdownvalue == 'Nepali') {
      transalateLanguage = 'ne';
    }
    else if (dropdownvalue == 'Norwegian') {
      transalateLanguage = 'no';
    }  else if (dropdownvalue == 'Polish') {
      transalateLanguage = 'pl';
    } else if (dropdownvalue == 'Portuguese') {
      transalateLanguage = 'pt';
    } else if (dropdownvalue == 'Punjabi') {
      transalateLanguage = 'pa';
    } else if (dropdownvalue == 'Sindhi') {
      transalateLanguage = 'sd';
    }  else if (dropdownvalue == 'Spanish') {
      transalateLanguage = 'es';
    }  else if (dropdownvalue == 'Tamil') {
      transalateLanguage = 'ta';
    } else if (dropdownvalue == 'Telugu') {
      transalateLanguage = 'te';
    } else if (dropdownvalue== 'Turkish') {
      transalateLanguage = 'tr';
    }  else if (dropdownvalue == 'Urdu') {
      transalateLanguage = 'ur';
    }

    translator.translate('$textfieldtext', to: '$transalateLanguage').then((value) {
      setState(() {
        out = value.toString();
      });
    });
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

          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "TEXT TRANSLATION",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor:Colors.deepPurple[600],
          iconTheme: IconThemeData(
            color: Colors.white,
          )
        // elevation: 0.0,
        // backgroundColor: Colors.white,
        // centerTitle: true,
        // title: RichText(
        //   text: TextSpan(
        //     children: <TextSpan>[
        //       TextSpan(
        //           text: 'Text',
        //           style: TextStyle(
        //             fontSize: 18,
        //             color: Color(0xFF121212),
        //             // fontFamily: 'PoppinsBold'
        //           )),
        //       TextSpan(
        //           text: 'Translation ',
        //           style: TextStyle(
        //             fontSize: 18,
        //             color: Colors.blue,
        //             // fontFamily: 'PoppinsBold'
        //           )),
        //     ],
        //   ),
        // ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple[600],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) =>textfieldtext=value,
                      controller: lang,
                      minLines: 1,
                      maxLines: 999,
                      decoration: InputDecoration(
                        hintText: "Tap to enter text",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                          // fontFamily: 'PoppinsReg',
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                        // fontFamily: 'PoppinsReg',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              // Hero(
              //   tag: Key("trans"),
              // child: Card(
              // color: Colors.blue,
              //  child: InkWell(
              //    onTap: () {
              //      trans();
              //    },
              // hoverColor: Colors.orange,
              // child: Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.white),
              //   ),
              //   height: 40,
              //   width: 400,
              //   child: Center(
              //     child: Text(
              //       "translate text ",
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              //   ),
              // ),
              //   ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 130.0),
              //   child:DropdownButton(
              //     value:dropdownvalue,
              //
              //
              //   ),
              //  child: DropdownButtonHideUnderline(
              //
              //    child:DropdownButton(
              //      items: listLanguage.map<DropdownMenuItem>((value) {
              //        return DropdownMenuItem(child: Text(value), value: value);
              //      }).toList(),
              //
              //      // text
              //      value: selectedLanguage,
              //      style: TextStyle(
              //        // fontFamily: 'PoppinsReg',
              //          color: Colors.black),
              //      onChanged: (value) {
              //        setState(() {
              //          selectedLanguage = value.toString();
              //        });
              //      },
              //    ),
              //
              // ),

              //  ),
              Container(
                margin: EdgeInsets.fromLTRB(22.0,10.0,25.0,0.0),
                padding: EdgeInsets.all(5.0),
                width: 350,
                child: Text("Click below to select language",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.black
                  ),),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(5.0),
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Center(

                  child: DropdownButton(
                    key: ValueKey('dropdown'),

                    // Initial Value
                    value: dropdownvalue,
                    dropdownColor: Colors.white,
                    focusColor: Colors.black,
                    iconEnabledColor: Colors.black,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,

                        child: Text(items,
                            style: TextStyle(
                              color: Colors.black,
                              // fontFamily: 'PoppinsBold'
                            )),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    //   value=dropdownvalue;
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue.toString();
                      });
                    },
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    margin:EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        trans();
                      },
                      child: Text("Translate",
                          style: TextStyle(
                            color: Colors.white,
                            // fontFamily: 'PoppinsBold'
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple[600],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0),
                    child: SelectableText(
                      out == null ? "" : out,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        // fontFamily: 'PoppinsReg',
                      ),

                      showCursor: true,
                      cursorColor: Colors.white,

                      minLines: 1,
                      maxLines: 999,
                      scrollPhysics: ClampingScrollPhysics(),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
