import 'package:flutter/material.dart';
import 'package:mrdqa_tool/models/Assessment.dart';
import 'package:mrdqa_tool/models/Country.dart';
import 'package:mrdqa_tool/repository/CountryRepository.dart';
import 'package:mrdqa_tool/services/DataElementManager.dart';
import 'package:mrdqa_tool/services/FirestoreDatabaseManager.dart';
import 'package:mrdqa_tool/models/Config.dart';

import '../services/SqliteDatabaseManager.dart';

class TestDatabasePage extends StatefulWidget {

  static String routeName = '/test_database';
  @override
  _TestDatabasePageState createState() => _TestDatabasePageState();
}

class _TestDatabasePageState extends State<TestDatabasePage> {
  @override
  void initState(){
    super.initState();
    debugPrint('CREATING DATABASE::::');
    SqliteDatabaseManager.instance.database;
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('TESTING LOCAL DATA STORAGE'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: "HAHA",
                labelText: "PHONE",
              ),
              controller: textController,
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(child: const Text('Save'),onPressed: (){
                if (_formKey.currentState.validate()){
                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  String id = textController.text;
                  debugPrint('Saving to SQLite: '+id);

                  _addToSqliteDb();
                  CountryRepository cr = new CountryRepository();
                  cr.addCountry(new Country("7890", "KENYA"));

                  Config config = new Config();
                  DataElementManager dataMan = new DataElementManager(config);
                  dataMan.getData();
                  //FirestoreDatabaseManager firestore = FirestoreDatabaseManager();
                  //firestore.addAssessment(Assessment(facility_id: "908", assessment_data: id));
                  //firestore.deleteAssessment('p445wFjpl65JEzzRDYQI');
                  //firestore.getAssessmentByFacility("908");
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  /**
   * Just an example of how to store data into SQLITE
   */
  void _addToSqliteDb() async {
    String task = textController.text;
    var data = {'ASSESSMENT_ID': task, 'DATA': '4325'};
    var id = await SqliteDatabaseManager.instance.insert('assessments', data);
  }
}