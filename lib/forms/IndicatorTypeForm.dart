import 'package:flutter/material.dart';
import 'package:mrdqa_tool/routes/Routes.dart';

class IndicatorTypeForm {
  BuildContext context;
  Routes routes;

  final _formKey = GlobalKey<FormState>();

  IndicatorTypeForm(this.context, this.routes);

  Widget getDrawer() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            decoration: InputDecoration(labelText: 'Indicator id'),
            autofocus: true,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The Indicator should have an id';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Indicator name'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The Indicator should have a name';
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
                    SnackBar(content: Text('Creating Indicator type')));
              }
            },
            child: Text('Create'),
          ),
        ]));
  }
}
