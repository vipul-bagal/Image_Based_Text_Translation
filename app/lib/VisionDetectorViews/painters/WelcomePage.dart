import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class WelcomePage extends StatefulWidget {
  final  name;

  WelcomePage({Key ? key,required this.name}) : super(key: key);
  @override
  _WelcomePageState createState() => _WelcomePageState(
      name:this.name
  );
}

class _WelcomePageState extends State<WelcomePage> {

  String dropdownvalue = 'English';
  String out='';
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

  // String out="";

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

    translator.translate('${name}', to: '$transalateLanguage').then((value) {
      setState(() {
        out = value.toString();
      });
    });
  }
  goBack(BuildContext context){
    Navigator.pop(context);
  }
 final name;
  _WelcomePageState({required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "IBTT",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),

        backgroundColor:Colors.deepPurple[600],
          iconTheme: IconThemeData(
            color: Colors.white,
          )
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child:Text("You can Copy the extracted text using long pressed on container"),
              // ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(12.0,10.0,25.0,0.0),
                  padding: EdgeInsets.all(5.0),
                  width: 350,
                  child: Text("Recognized Text is shown below:",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.black
                    ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepPurple[600],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0),
                   child:Expanded(
                     child:SingleChildScrollView(
                       scrollDirection:Axis.vertical,
                       child: SelectableText(
                         '${name}',
                         style: TextStyle(
                           color: Colors.white,
                           // fontFamily: 'PoppinsReg',
                         ),

                        // maxLines: 999,

                       ),
                     ),
                   ),

                  ),
                ),
              ),

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
    Padding(
    padding: const EdgeInsets.only(left:15.0,right:15.0,top:15.0,bottom:0.0),
    child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Colors.black),
    color: Colors.white,
    ),
        child: Container(
           // margin: EdgeInsets.all(10.0),
           padding: EdgeInsets.all(5.0),
            width: 350,
           decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
             child: Center(

              child: DropdownButton(

                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                 focusColor: Colors.black,
                  iconEnabledColor: Colors.black,
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
                ),),
        ))),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0,right:15.0,top:15.0,bottom:0.0),
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black,
                    ),
                    child:Center(

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
                    child:Expanded(
                      child:SingleChildScrollView(
                        scrollDirection:Axis.vertical,
                    child: SelectableText(
                      out == null ? "" : out,
                      style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'PoppinsReg',
                      ),
                      showCursor: true,
                      cursorColor: Colors.black,

                      minLines: 1,
                      maxLines: 999,
                      scrollPhysics: ClampingScrollPhysics(),
                    ),),),
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


