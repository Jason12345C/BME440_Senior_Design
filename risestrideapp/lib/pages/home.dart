import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:risestride/common/colors_extension.dart';
import 'package:risestride/pages/activity.dart';
import 'package:risestride/pages/settings.dart';
import 'package:risestride/pages/training.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ThemeColors.white);
  }
}
