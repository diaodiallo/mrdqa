import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class SupervisionPage extends StatefulWidget {
  static String routeName = '/supervision';

  @override
  _SupervisionPageState createState() => _SupervisionPageState();
}

class _SupervisionPageState extends State<SupervisionPage> {

  static const String routeName = '/supervisions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supervision planning'),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
      body: Center(
        //child: //_supervisionView(),
        ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addDataElement);
                });
              },
              label: Text('Facility'),
              icon: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addDataElement);
                });
              },
              label: Text('Indicator'),
              icon: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      )
    );
  }
}