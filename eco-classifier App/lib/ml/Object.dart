import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigmahacks/pages/detail.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import './Live.dart';
import './Box.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(
    MaterialApp(
      title: 'Object Detection',
      home: ObjectDetect(cameras),
    ),
  );
}

final FlutterTts flutterTts = FlutterTts();

class ObjectDetect extends StatefulWidget {
  final List<CameraDescription> cameras;
  ObjectDetect(this.cameras);

  @override
  _ObjectDetectState createState() => _ObjectDetectState();
}

class _ObjectDetectState extends State<ObjectDetect> {
  bool liveFeed = false;

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  bool _load = false;
  File _pic;
  List _result;
  String _confidence = "";

  String _object = "";

  String numbers = '';
  Future _speak(String str) async {
    await flutterTts.speak(str);
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();

    _load = true;

    loadMyModel().then((v) {
      setState(() {
        _load = false;
      });
    });
  }

  loadMyModel() async {
    var res = await Tflite.loadModel(
        labels: "assets/labels.txt", model: "assets/model_unquant.tflite");

    print("Result after Loading the Model is : $res");
  }

  chooseImage() async {
    File _img = await ImagePicker.pickImage(source: ImageSource.camera);

    if (_img == null) return;

    setState(() {
      _load = true;
      _pic = _img;
      applyModelonImage(_pic);
    });
  }

  applyModelonImage(File file) async {
    var _res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _load = false;
      _result = _res;
      print(_result);
      String str = _result[0]["label"];

      _confidence = _result != null
          ? (_result[0]["confidence"] * 100.0).toString().substring(0, 2) + "%"
          : "";
      _object = str.substring(2);
      if (_object == 'Vaseline')
        _speak(_object +
            "It contains Methylisothiazolinone that can cause Allergies/immunotoxicity, Irritation (skin, eyes, or lungs)");
      else
        _speak(
            "Vaseline Intensive Care Body Lotion .It can cause Endocrine disruption, Irritation (skin, eyes, or lungs), Organ system toxicity ");

      print(str.substring(2));
      print(
          (_result[0]["confidence"] * 100.0).toString().substring(0, 2) + "%");
      print("indexed : ${_result[0]["label"]}");
    });
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan Product",
        ),
        backgroundColor: Color(0xff9dc6fb),
      ),
      body: !liveFeed
          ? Center(
              child: ListView(
                children: <Widget>[
                  _load
                      ? Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: size.width * 0.9,
                          height: size.height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: _pic != null
                                    ? Container(
                                        child: Column(
                                          children: [
                                            Image.file(
                                              _pic,
                                              width: size.width * 0.5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Container(
                                                height: 50,
                                                width: 190,
                                                child: RaisedButton(
                                                  color: Color(0xff9dc6fb),
                                                  elevation: 4,
                                                  child: Text(
                                                    'More details',
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Detail()));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        height: 120,
                                        width: 120,
                                        child: Image.network(
                                            'https://image.flaticon.com/icons/png/512/1160/1160155.png'),
                                      ),
                              ),
                              _result == null
                                  ? Container()
                                  : Text(
                                      "Detection Accuracy: $_confidence",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                ],
              ),
            )
          : Stack(
              children: [
                CameraLiveScreen(
                  widget.cameras,
                  setRecognitions,
                ),
                EnclosedBox(
                  _recognitions == null ? [] : _recognitions,
                  math.max(_imageHeight, _imageWidth),
                  math.min(_imageHeight, _imageWidth),
                  size.height,
                  size.width,
                ),
              ],
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 190,
                child: RaisedButton(
                  color: Color(0xff9dc6fb),
                  elevation: 4,
                  child: Text(
                    'Capture',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      liveFeed = false;
                    });
                    chooseImage();
                  },
                ),
              ),
            ),

            // RaisedButton(
            //   child: Text("Live Feed"),
            //   onPressed: () {
            //     setState(() {
            //       liveFeed = true;
            //     });
            //     loadMyModel();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Object Detection"),
//         backgroundColor: Color(0xffd6bdd5),
//       ),
//       body: !liveFeed
//           ? Center(
//               child: ListView(
//                 children: <Widget>[
//                   _load
//                       ? Container(
//                           alignment: Alignment.center,
//                           child: CircularProgressIndicator(),
//                         )
//                       : Container(
//                           width: size.width * 0.9,
//                           height: size.height * 0.7,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Center(
//                                 child: _pic != null
//                                     ? Image.file(
//                                         _pic,
//                                         width: size.width * 0.6,
//                                       )
//                                     : Container(),
//                               ),
//                               _result == null
//                                   ? Container()
//                                   : Text("$_object \nConfidence: $_confidence"),
//                             ],
//                           ),
//                         )
//                 ],
//               ),
//             )
//           : Stack(
//               children: [
//                 CameraLiveScreen(
//                   widget.cameras,
//                   setRecognitions,
//                 ),
//                 EnclosedBox(
//                   _recognitions == null ? [] : _recognitions,
//                   math.max(_imageHeight, _imageWidth),
//                   math.min(_imageHeight, _imageWidth),
//                   size.height,
//                   size.width,
//                 ),
//               ],
//             ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(20),
//               height: 100,
//               width: 350,
//               child: RaisedButton(
//                 child: Text(
//                   "Image Feed",
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 32,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 color: Color(0xffd6bdd5),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     side: BorderSide(color: Colors.black)),
//                 onPressed: () {
//                   setState(() {
//                     liveFeed = true;
//                   });
//                   chooseImage();
//                 },
//               ),
//             ),
//             // RaisedButton(
//             //   child: Text("Live Feed"),
//             //   onPressed: () {
//             //     setState(() {
//             //       liveFeed = true;
//             //     });
//             //     loadMyModel();
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
