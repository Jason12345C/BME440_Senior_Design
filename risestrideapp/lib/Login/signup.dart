import 'package:flutter/material.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/bottomNav.dart';
import 'package:risestride/pages/home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.primaryColor1,
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 55),
              width: media.width * .75,
              height: media.height * .85,
              decoration: BoxDecoration(
                  color: ThemeColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                      width: media.width * .6,
                      child: const TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.mail),
                              labelText: "Enter Email"))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: media.width * .6,
                    child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.people),
                            labelText: "Enter Username")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: media.width * .6,
                    child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Enter Password")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: media.width * .6,
                    child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Confirm Password")),
                  ),
                ),
                const SizedBox(height: 80),
                SizedBox(
                    width: media.width * .5,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.primaryColor1),
                        // for now just go to dashboard
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BottomNav()));
                        },
                        child: Text('SIGNUP',
                            style: TextStyle(
                                color: ThemeColors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)))),
                const SizedBox(height: 30),
              ])),
        ));
  }
}
