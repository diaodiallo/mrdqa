import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';
import 'package:select_form_field/select_form_field.dart';

class FacilityInformationPage extends StatefulWidget {
  static String routeName = '/facility_information';

  @override
  _FacilityInformationPageState createState() =>
      _FacilityInformationPageState();
}

class _FacilityInformationPageState extends State<FacilityInformationPage> {
  //String _heading = "Enter details for health facilities selected for review.  Select the number of facilities using the drop-down combo box below. (Click on the facility number to jump to the health facility page)";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facility Information"),
      ),
      drawer: Drawer(
        child: MenuManager(context, Routes()).getDrawer(),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: FutureBuilder(
                future:
                    rootBundle.loadString('assets/facility_info_page_title.md'),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Markdown(
                      data: snapshot.data,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: _facilityForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _facilityForm() {
    final _formKey = GlobalKey<FormState>();
    final List<Map<String, dynamic>> _items = [
      {
        'value': "1",
        'label': 'Public',
        //'icon': Icon(Icons),
      },
      {
        'value': "2",
        'label': 'Private',
        //'icon': Icon(Icons.public_off),
      },
      {
        'value': "3",
        'label': 'Confessionnal',
      },
    ];

    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            decoration: InputDecoration(labelText: 'Facility name'),
            autofocus: true,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The facility should have a name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Town/village'),
            // The validator receives the text that the user has entered.
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'District'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The facility should have a District';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Region'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The facility should have a Region';
              }
              return null;
            },
          ),
          SelectFormField(
            type: SelectFormFieldType.dropdown, // or can be dialog
            icon: Icon(Icons.local_hospital),
            labelText: 'Facility type',
            items: _items,
            validator: (value) {
              if (value.isEmpty) {
                return 'The facility should have a Type';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Facility unique code'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'The facility should have a unique code';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone'),
            // The validator receives the text that the user has entered.
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            // The validator receives the text that the user has entered.
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Creating facility')));
              }
            },
            child: Text('Create'),
          ),
        ]));
  }
}
