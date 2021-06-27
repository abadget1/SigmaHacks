import 'package:flutter/material.dart';
import 'package:sigmahacks/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigmahacks/pages/detail.dart';
import 'package:sigmahacks/pages/detail1.dart';
import 'package:sigmahacks/pages/option.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;

  const TextAreaWidget({
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe2efe6),
      body: Container(
        // constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(
        //         'https://i.pinimg.com/564x/70/ef/a9/70efa905a4273106f1b0e491df9eca93.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 213,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Text(
                  text.isEmpty ? 'Scan an Image to get text' : text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 170,
                    child: RaisedButton(
                        color: Color(0xff9dc6fb),
                        elevation: 4,
                        child: Text(
                          'More Details',
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
                                  builder: (context) => Detail1()));
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
