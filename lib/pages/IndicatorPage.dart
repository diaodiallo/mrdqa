import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class IndicatorPage extends StatefulWidget {
  static String routeName = '/indicators';

  @override _IndicatorPageState createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  //String _title = "Enter the indicator type, and indicators for up to five indicators.  Select \"Other_specify\" to enter user-defined types and indicators.";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Indicators"),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                  future: rootBundle.loadString('assets/indicator_page_title.md'),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot){

                    if (snapshot.hasData){
                      return Markdown(
                        data: snapshot.data,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}