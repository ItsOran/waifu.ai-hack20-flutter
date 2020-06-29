import 'package:flutter/material.dart';
import 'package:hack2020/components/horizontal_icons_view.dart';
import 'package:hack2020/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

//Works as of 27/06/2020.
//Docs were wrong as to how to fetch the response text.
//Use fulfillmentText instead of queryText (which makes total sense!!)
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryBlack,
        body: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'waifu.ai',
                          style: GoogleFonts.lekton(
                            color: kAccentColor,
                            fontSize: 40.0,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      Divider(
                        color: kAccentDarkGrey,
                        thickness: 2.0,
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      Text(
                        'ChatBot A.I',
                        style: GoogleFonts.lekton(
                          color: kAccentGrey,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryBlack,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        width: 2,
                        color: kAccentColor,
                      ),
                    ),
                    child: Container(
                      child: Image.asset(
                        'assets/gif/green.gif',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                HosIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
