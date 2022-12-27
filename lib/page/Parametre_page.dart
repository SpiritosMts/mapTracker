import 'package:flutter/material.dart';
import 'package:map/Screens/Settings/Settings.dart';

import 'package:map/widget/navigation_drawer_widget.dart';

class ParametrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Paramètres'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Settings(),
    );
  }
}
