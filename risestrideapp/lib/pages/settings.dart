import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:risestride/common/colors_extension.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemeColors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: media.width * .08,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 20),
                          Text("General",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400)),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ]))),
            Divider(color: ThemeColors.gray),
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: media.width * .08,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.lightbulb),
                          SizedBox(width: 20),
                          Text("Notifications",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400)),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ]))),
            Divider(color: ThemeColors.gray),
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: media.width * .08,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.people),
                          SizedBox(width: 20),
                          Text("Account",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400)),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ]))),
            Divider(color: ThemeColors.gray),
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: media.width * .08,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.mail),
                          const SizedBox(width: 20),
                          Text("Email Settings",
                              style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400)),
                          const Spacer(),
                          const Icon(Icons.navigate_next)
                        ]))),
            Divider(color: ThemeColors.gray),
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    height: media.width * .08,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: 20),
                          Text("Logout",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400)),
                          Spacer(),
                          Icon(Icons.navigate_next)
                        ]))),
            Divider(color: ThemeColors.gray)
          ]),
        ));
  }
}
