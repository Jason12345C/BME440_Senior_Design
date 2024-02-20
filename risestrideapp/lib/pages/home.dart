import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risestride/common/colors_extension.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.white,
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 50, left: 30, right: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/user.svg",
                        height: 50, width: 50),
                    const SizedBox(width: 10),
                    const Text("Welcome Back",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ])),
          Container(
              width: media.width * .8,
              height: media.height * .5,
              decoration: BoxDecoration(
                  color: ThemeColors.primaryColor1,
                  borderRadius: const BorderRadius.all(Radius.circular(30))))
        ]));
  }
}
