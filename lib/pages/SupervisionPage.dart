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
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 3,
              child: Container(
                color: Colors.amber,
              ),
            ),
            AspectRatio(
              aspectRatio: 1 / 3,
              child: Container(
                color: Colors.blue,
              ),
            ),
            AspectRatio(
              aspectRatio: 1 / 3,
              child: Container(
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
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

              },
              label: Text('Facility'),
              icon: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
            FloatingActionButton.extended(
              onPressed: () {

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

  Widget _buildSupervisionForm() {
    final _formKey = GlobalKey<FormState>();
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                // Add TextFormFields and ElevatedButton here.
                TextFormField(
                  decoration: InputDecoration(labelText: 'Designation'),
                  autofocus: true,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'The Supervision should have a designation';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Period'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'The Supervision should have a period';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Saving the supervision')));
                    }
                  },
                  child: Text('Save'),
                ),
              ])))
    ]);
  }
}