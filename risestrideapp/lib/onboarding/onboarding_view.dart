import 'package:flutter/material.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/onboarding/onboarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Get back to your full potential",
      "subtitle": "It come with the egg wool",
      "image": "assets/images/onboarding_img1.png"
    },
    {
      "title": "Get back to your full potential",
      "subtitle": "It come with the fried rice!",
      "image": "assets/images/onboarding_img2.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.white,
        body: Stack(children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(pObj: pObj);
              })
        ]));
  }
}
