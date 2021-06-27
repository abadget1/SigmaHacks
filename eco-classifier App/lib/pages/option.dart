import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigmahacks/ml/Object.dart';
import 'package:sigmahacks/widget/text_recognition_widget.dart';

class Option extends StatefulWidget {
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe2efe6),
      body: Center(
        child: Container(
          color: Color(0xffe2efe6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://image.freepik.com/free-vector/cruelty-free-girl_24877-71959.jpg'),
              Container(
                height: 60,
                width: 190,
                child: RaisedButton(
                  color: Color(0xff9dc6fb),
                  elevation: 4,
                  child: Text(
                    'Scan Product',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectDetect(cameras)));
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 190,
                child: RaisedButton(
                  color: Color(0xff9dc6fb),
                  elevation: 4,
                  child: Text(
                    'Scan Label',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Scan label',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          backgroundColor: Color(0xff9dc6fb),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextRecognitionWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
}
