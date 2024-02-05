// import 'package:flutter/material.dart';
// import 'package:risestride/common/colors_extension.dart';

// class OnBoardingPage extends StatelessWidget {
//   final Map pObj;
//   const OnBoardingPage({super.key, required this.pObj});

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return SizedBox(
//                     width: media.width,
//                     height: media.height,
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(top: 300),
//                             child: Text("RiseStride",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FontStyle.italic)),
//                           ),
//                           GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                   width: media.width * .6,
//                                   height: media.height * .05,
//                                   margin: EdgeInsets.only(top: 300),
//                                   decoration: BoxDecoration(
//                                       gradient: LinearGradient(
//                                           begin: Alignment.topLeft,
//                                           end: Alignment(0.2, 1),
//                                           colors: <Color>[
//                                             ThemeColors.primaryColor2,
//                                             ThemeColors.primaryColor1,
//                                           ]),
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Text("Let's Get Started!",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold)),
//                                   )))
//                         ]));
//   }
// }
