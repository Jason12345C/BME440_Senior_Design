import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/bluetooth.dart';
import 'package:risestride/pages/activity.dart';
import 'package:risestride/pages/home.dart';
import 'package:risestride/pages/settings.dart';
import 'package:risestride/pages/training.dart';
import 'package:risestride/services/device.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _selectedIndex = 0;

  //used to swap between pages on the bottom nav bar
  final List<Widget> _widgetOptions = <Widget>[
    Bluetooth(),
    HomePage(),
    TrainingPage(),
    Activity(device: BLEDevice.displayedDevice),
    SettingsPage(),
  ];

// used to swap titles
  static final List<Widget> _titles = <Widget>[
    Text(
      'Bluetooth',
      style: TextStyle(
          color: ThemeColors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Home',
      style: TextStyle(
          color: ThemeColors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Training',
      style: TextStyle(
          color: ThemeColors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Activity',
      style: TextStyle(
          color: ThemeColors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      'Settings',
      style: TextStyle(
          color: ThemeColors.black, fontSize: 18, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: navBar())));
  }

  GNav navBar() {
    return GNav(
        backgroundColor: const Color.fromRGBO(187, 224, 226, 1),
        color: Colors.black,
        activeColor: Colors.white,
        gap: 5,
        tabs: const [
          GButton(icon: Icons.bluetooth, text: 'Bluetooth'),
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

  AppBar appBar() {
    return AppBar(
      title: _titles.elementAt(_selectedIndex),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      // leading: GestureDetector(
      //     onTap: () {},
      //     child: Container(
      //         margin: const EdgeInsets.all(10),
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //             color: Color(0xffF7F8F8),
      //             borderRadius: BorderRadius.circular(10)),
      //         child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
      //             height: 20, width: 20))),
      // actions: [
      //   GestureDetector(
      //       onTap: () {},
      //       child: Container(
      //           margin: const EdgeInsets.all(10),
      //           alignment: Alignment.center,
      //           width: 37,
      //           height: 37,
      //           decoration: BoxDecoration(
      //               color: const Color(0xffF7F8F8),
      //               borderRadius: BorderRadius.circular(10)),
      //           child: SvgPicture.asset('assets/icons/dots.svg',
      //               height: 5, width: 5)))]
    );
  }
}
