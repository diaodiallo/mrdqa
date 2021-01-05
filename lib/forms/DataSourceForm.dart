import 'package:flutter/material.dart';

class DataSourceForm extends StatefulWidget {
  static String routeName = '/indicators/add_data_source';

  @override
  _DataSourceFormState createState() => _DataSourceFormState();
}

class _DataSourceFormState extends State<DataSourceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Data source"),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    final _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Data Source id'),
                    autofocus: true,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The Data Source should have an id';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Data Source name'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The Data Source should have a name';
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
                            SnackBar(content: Text('Creating Data Source')));
                      }
                    },
                    child: Text('Create'),
                  ),
                ])))
      ],
    );
  }
}
