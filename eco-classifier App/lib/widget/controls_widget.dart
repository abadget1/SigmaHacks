import 'package:sigmahacks/ml/Object.dart';
import 'package:sigmahacks/widget/text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:sigmahacks/widget/text_area_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback result;

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedScanText,
    @required this.result,
    Key key,
  }) : super(key: key);
  Future _speak(String str) async {
    await flutterTts.speak(str);
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 170,
                    child: RaisedButton(
                        color: Color(0xff9dc6fb),
                        elevation: 4,
                        child: Text(
                          'Click Image',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        onPressed: onClickedPickImage),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 50,
                    width: 170,
                    child: RaisedButton(
                      color: Color(0xff9dc6fb),
                      elevation: 4,
                      child: Text(
                        'Scan',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onPressed: onClickedScanText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: 170,
                child: RaisedButton(
                    color: Color(0xff9dc6fb),
                    elevation: 4,
                    child: Text(
                      'Result',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onPressed: result),
              ),
            ],
          ),
        ),
      );
}
