import 'package:flutter/material.dart';
import 'package:risestride/common/colors_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
        width: media.width,
        height: media.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(pObj["image"].toString(),
              width: media.width, fit: BoxFit.fitWidth),
          SizedBox(height: media.width * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(pObj["title"].toString(),
                style: TextStyle(
                    color: ThemeColors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  pObj["subtitle"].toString())),
          // SizedBox(height: media.width * 0.5),

        ]), 
        );
  }
}
