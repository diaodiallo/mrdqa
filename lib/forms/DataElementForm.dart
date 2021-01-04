import 'package:flutter/material.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class DataElementForm {
  BuildContext context;
  Routes routes;

  final _formKey = GlobalKey<FormState>();

  DataElementForm(this.context, this.routes);

  Widget getDrawer() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            decoration: InputDecoration(labelText: 'Data Element id'),
            autofocus: true,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The Data Element should have an id';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Data Element name'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The Data Element should have a name';
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
                    SnackBar(content: Text('Creating Data Element')));
              }
            },
            child: Text('Create'),
          ),
        ]));
  }
}
