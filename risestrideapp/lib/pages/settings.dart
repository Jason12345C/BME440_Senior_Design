import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(backgroundColor: ThemeColors.primaryColor3);
  }
}
