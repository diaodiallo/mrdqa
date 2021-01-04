import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:mrdqa_tool/routes/Routes.dart';
import '../models/IndicatorType.dart';

class IndicatorForm {
  BuildContext context;
  Routes routes;

  final _formKey = GlobalKey<FormState>();
  // final List<Map<String, dynamic>> _items = [
  //   {
  //     'value': "type01",
  //     'label': 'Type 1',
  //     //'icon': Icon(Icons),
  //   },
  //   {
  //     'value': "type2",
  //     'label': 'Type 2',
  //     //'icon': Icon(Icons.public_off),
  //   },
  //   {
  //     'value': "type3",
  //     'label': 'Type 3',
  //   },
  // ];



  IndicatorForm(this.context, this.routes);

  List<Map<String, dynamic>> _getIndicatorTypes() {
    List<IndicatorType> indicatorTypes = [
      IndicatorType(id: 1, name: 'Number of malaria cases'),
      IndicatorType(id: 2, name: 'Number of malaria cases'),
      IndicatorType(id: 3, name: 'Number of malaria cases')
    ];
    final List<Map<String, dynamic>> items = [];
    indicatorTypes.map((indicatorType) => 
    items.add({'value': indicatorType.id.toString(), 'label': indicatorType.name})
    );
    return items;
  }

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
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            icon: Icon(Icons.local_hospital),
            labelText: 'Indicator type',
            items: _getIndicatorTypes(),
            validator: (value) {
              if (value.isEmpty) {
                return 'The Indicator should have a Type';
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

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Creating Indicator')));
              }
            },
            child: Text('Create'),
          ),
        ]));
  }
}
