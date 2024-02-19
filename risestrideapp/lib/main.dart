import 'package:flutter/material.dart';
import 'package:risestride/onboarding/onboarding_view.dart';
// import 'package:risestride/pages/home.dart';
import 'common/colors_extension.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Start(),
    ),
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const OnBoardingView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            width: media.width,
            height: media.height,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text("RiseStride",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
              const SizedBox(width: 100, height: 100),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: const Alignment(0.2, 1),
                                      colors: <Color>[
                                        ThemeColors.primaryColor2,
                                        ThemeColors.primaryColor1,
                                      ])),
                              child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 160,
                                      minWidth: 80.0,
                                      minHeight: 38.0),
                                  alignment: Alignment.center,
                                  child: const Text("Let's Get Started",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))))
                          // child: Container(
                          //     width: media.width * .6,
                          //     height: media.height * .05,
                          //     decoration: BoxDecoration(
                          //         gradient: LinearGradient(
                          //             begin: Alignment.topLeft,
                          //             end: Alignment(0.2, 1),
                          //             colors: <Color>[
                          //               ThemeColors.primaryColor2,
                          //               ThemeColors.primaryColor1,
                          //             ]),
                          //         borderRadius: BorderRadius.circular(20)),
                          //     child: const Padding(
                          //       padding: EdgeInsets.all(8.0),
                          //       child: Text("Let's Get Started!",
                          //           textAlign: TextAlign.center,
                          //           style: TextStyle(
                          //               fontSize: 15, fontWeight: FontWeight.bold)),
                          //     ))
                          )))
            ])));
  }
}

// class Page2 extends StatelessWidget {
//   const Page2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Center(
//         child: Text('Page 2'),
//       ),
//     );
//   }
// }
