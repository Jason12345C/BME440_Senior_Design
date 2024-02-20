import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/activity.dart';
import 'package:risestride/pages/home.dart';
import 'package:risestride/pages/settings.dart';
import 'package:risestride/pages/training.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TrainingPage(),
    ActivityPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: navBar()));
  }

  GNav navBar() {
    return GNav(
        backgroundColor: const Color.fromRGBO(187, 224, 226, 1),
        color: Colors.black,
        activeColor: Colors.white,
        gap: 8,
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.fitness_center, text: 'Train'),
          GButton(icon: Icons.favorite_border, text: 'Activity'),
          GButton(icon: Icons.more_horiz, text: 'Settings'),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        });
  }

  static const List<Widget> _titles = <Widget>[
    Text(
      'Home',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Training',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Activity',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Settings',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    )
  ];

  AppBar appBar() {
    return AppBar(
        title: _titles.elementAt(_selectedIndex),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xffF7F8F8),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
                    height: 20, width: 20))),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                      color: const Color(0xffF7F8F8),
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset('assets/icons/dots.svg',
                      height: 5, width: 5)))
        ]);
  }
}
