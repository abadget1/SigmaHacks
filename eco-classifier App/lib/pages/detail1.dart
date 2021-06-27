import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail1 extends StatefulWidget {
  @override
  _Detail1State createState() => _Detail1State();
}

class _Detail1State extends State<Detail1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffe2efe6),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70)),
              ),
              child: Image.network(
                  'https://jeyamsupermarket.com/images/thumbs/0004645_head-shoulders-anti-dandruff-shampoo-cool-menthol-72-ml_550.png'),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.only(
                //       topRight: Radius.circular(70),
                //       topLeft: Radius.circular(70)),
                // ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage('assets/angry.png'),
                                height: 50,
                                width: 50),
                            Text(
                              'Hazardous',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '2',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage('assets/sad.png'),
                                height: 50,
                                width: 50),
                            Text(
                              'Neutral',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '8',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage('assets/happy1.png'),
                                height: 50,
                                width: 50),
                            Text(
                              'Good',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              '18',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Image(
                          image: AssetImage('assets/concerns.png'),
                          height: 350,
                          width: 350,
                        ),
                        Text(
                          'Ingredient List',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage('assets/angry.png'),
                                height: 50,
                                width: 50),
                            Text('METHYLISOTHIAZOLINONE'),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage('assets/angry.png'),
                                height: 50,
                                width: 50),
                            Text('FD&C YELLOW NO. 5 (CI 19140)'),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage('assets/sad.png'),
                                height: 50,
                                width: 50),
                            Text('METHYLCHLOROISOTHIAZOLINONE'),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage('assets/happy1.png'),
                                height: 50,
                                width: 50),
                            Text('ZINC CARBONATE'),
                          ],
                        ),
                        Divider(color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
