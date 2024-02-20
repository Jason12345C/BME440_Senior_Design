import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:risestride/common/colors_extension.dart';


class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ThemeColors.primaryColor1, body: const Text("test test test test"));
  }
}
