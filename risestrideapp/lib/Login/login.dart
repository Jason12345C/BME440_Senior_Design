import 'package:flutter/material.dart';
import 'package:risestride/Login/signup.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.primaryColor1,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 55),
              width: media.width * .75,
              height: media.height * .7,
              decoration: BoxDecoration(
                  color: ThemeColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0))),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: SizedBox(
                      width: media.width * .6,
                      child: const TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.people),
                              labelText: "Enter Email or Username"))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: media.width * .6,
                    child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Enter Password")),
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Forgot username or password?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            )))),
                const SizedBox(height: 80),
                SizedBox(
                    width: media.width * .5,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColors.primaryColor1),
                        // for now just go to dashboard
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: ThemeColors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold)))),
                const SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Don't have an account?",
                      style: TextStyle(fontSize: 11)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("Register now",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 11,
                                  decoration: TextDecoration.underline))))
                ])
              ])),
        ));
  }
}
