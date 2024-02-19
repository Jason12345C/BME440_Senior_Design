import 'package:flutter/material.dart';
import 'package:risestride/Login/login.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/onboarding/onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Get back on your feet!",
      "subtitle": "Get live feedback when you train your sit-to-stand motion",
      "image": "assets/images/onboarding_img1.png",
      // "button_text": "Swipe"
    },
    {
      "title": "Correct your gait",
      "subtitle":
          "Improve your posture and stride with personalized gait correction tops tailored just for you",
      "image": "assets/images/onboarding_img2.png",
      // "button_text": "assets/images/arrows.png"
    },
    {
      "title": "Track your progress and goals!",
      "subtitle": "Start your journey now and get ready to Rise and Stride!",
      "image": "assets/images/onboarding_img2.png",
      // "button_text": "assets/images/arrows.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.primaryColor1,
        body: Stack(alignment: Alignment.bottomRight, children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(pObj: pObj);
              }),
          SizedBox(
              width: 120,
              height: 120,
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: media.width * .15,
                  height: media.width * .15,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            ThemeColors.white,
                            ThemeColors.primaryColor1,
                          ])),
                  child: IconButton(
                      icon: Icon(Icons.navigate_next, color: ThemeColors.black),
                      onPressed: () {
                        if (selectPage < pageArr.length) {
                          //go to next onboarding view
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceInOut);
                          // controller.jumpToPage(selectPage);
                          setState(() {});
                        } else {
                          //welcome page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        }
                      }),
                ),
                SizedBox(
                    width: media.width * .117,
                    height: media.width * .117,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      backgroundColor: ThemeColors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ThemeColors.primaryColor3),
                      value: (selectPage + 1) / 3,
                    ))
              ]))
        ]));
  }
}
