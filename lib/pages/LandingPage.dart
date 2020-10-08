import 'package:flutter/material.dart';

import '../menus/MenuManager.dart';
import '../routes/Routes.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MRDQA APP'),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset('assets/landing_page.png'),
            ],
          ),
        ),
      ),
    );
  }
}