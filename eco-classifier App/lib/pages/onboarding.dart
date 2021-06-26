import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:sigmahacks/pages/option.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Option()),
    );
  }

  Widget _buildImage(String assetName, [double width = 150]) {
    return Image.network(
      '$assetName',
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xffe2efe6),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xffe2efe6),
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage(
                'https://image.flaticon.com/icons/png/512/2917/2917995.png',
                50),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Capture",
          body: "Click image of the product or the label",
          image: _buildImage(
              'https://image.flaticon.com/icons/png/512/4978/4978335.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Recognize",
          body: "Identify ingredients used in the product quickly",
          image: _buildImage(
              'https://image.flaticon.com/icons/png/512/2920/2920349.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Analyze",
          body:
              "Classifies different ingredients based on how harmful or how good they are for your skin and environment",
          image: _buildImage(
              'https://image.flaticon.com/icons/png/512/1006/1006534.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Yayyy!!!",
          body: "With Eco-Classifier choose what's right for you",
          image: _buildImage(
              'https://image.flaticon.com/icons/png/512/4336/4336844.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Are you ready?",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "to find what products are best \nfor you and for environment that \nyou deeply care about",
                  style: bodyStyle),
            ],
          ),
          decoration: pageDecoration,
          image: _buildImage(
              'https://image.flaticon.com/icons/png/512/2997/2997085.png'),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Yesss!!!',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xffe2efe6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
