import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Train',
      style: optionStyle,
    ),
    Text(
      'Activity',
      style: optionStyle,
    ),
    Text(
      'More',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        // body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           boxShadow: const [
        //             BoxShadow(color: Color.fromRGBO(187, 224, 226, 1))
        //           ]),
        //       height: 200,
        //       padding: const EdgeInsets.all(10.0),
        //       child: const Text(
        //           "test test test test test test test test test test test"),
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           boxShadow: const [
        //             BoxShadow(color: Color.fromRGBO(187, 224, 226, 1))
        //           ]),
        //       height: 200,
        //       padding: const EdgeInsets.all(10.0),
        //       child: const Text(
        //           "test test test test test test test test test test test"),
        //     ),
        //   )
        // ]),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: navBar()));
  }

  GNav navBar() {
    return GNav(
        backgroundColor: Color.fromRGBO(187, 224, 226, 1),
        color: Colors.black,
        activeColor: Colors.white,
        // tabBorderRadius: 50,
        // tabActiveBorder:
        //     Border.all(color: Colors.black, width: 1), // tab button border
        // tabBorder:
        //     Border.all(color: Colors.black, width: 1), // tab button border
        // tabShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8)
        // ], // tab button shadow
        // curve: Curves.easeOutExpo, // tab animation curves
        // duration: Duration(milliseconds: 900), // tab animation duration

        gap: 8,
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.fitness_center, text: 'Train'),
          GButton(icon: Icons.favorite_border, text: 'Activity'),
          GButton(icon: Icons.more_horiz, text: 'More'),
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
        title: const Text(
          'Dashboard',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
