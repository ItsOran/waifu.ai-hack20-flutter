import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack2020/components/ob_data.dart';
import 'package:hack2020/constants.dart';
import 'package:hack2020/screens/landing_page.dart';

class OnboardingPage extends StatefulWidget {
  static final String id = 'onboarding_page';

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> slides = List<SliderModel>();
  int currentSliderIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kAccentColor : kAccentDarkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlack,
      body: GlowingOverscrollIndicator(
        color: kAccentColor,
        axisDirection: AxisDirection.right,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentSliderIndex = value;
            });
          },
          itemCount: slides.length,
          itemBuilder: (context, index) {
            return SliderTile(
              description: slides[index].getDesc(),
              descriptionTwo: slides[index].getDesc2(),
              text: slides[index].getText(),
              //imageAssetPath: slides[index].getImageAssetPath(),
            );
          },
        ),
      ),
      bottomSheet: currentSliderIndex != slides.length - 1
          ? Container(
              color: kPrimaryBlack,
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < slides.length; i++)
                          currentSliderIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              color: kPrimaryBlack,
              height: 50.0,
              width: (MediaQuery.of(context).size.width),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LandingPage.id);
                },
                child: Text(
                  'Get Started',
                  style: GoogleFonts.pressStart2p(color: kAccentColor),
                ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  SliderTile(
      {this.text, this.imageAssetPath, this.description, this.descriptionTwo});

  final String text;
  final String imageAssetPath;
  final String description;
  final String descriptionTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              text,
              style: GoogleFonts.pressStart2p(
                color: kAccentColor,
                fontSize: 30.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              description,
              style: GoogleFonts.poppins(
                color: kColorLightGrey,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: InkWell(
              child: Text(
                descriptionTwo,
                style: GoogleFonts.poppins(
                  color: kColorLightGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}