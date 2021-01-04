import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';


class DataEntryPage extends StatelessWidget {

  static const String routeName = '/data_entry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('MRDQA APP'),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Data entry page'),
        ),
      ),
    );
  }
}