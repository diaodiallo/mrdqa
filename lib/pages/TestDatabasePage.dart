import 'package:flutter/material.dart';
import 'package:mrdqa_tool/models/Assessment.dart';
import 'package:mrdqa_tool/services/FirestoreService.dart';

import '../services/DatabaseHelper.dart';

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
    DatabaseHelper.instance.database;
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

                  _addToDb();
                  FirestoreService firestore = FirestoreService();
                  firestore.addAssessment(Assessment(facility_id: "908", assessment_data: id));
                }
              }),
            )
          ],
        ),
      ),
    );
  }
  void _addToDb() async {
    String task = textController.text;
    var id = await DatabaseHelper.instance.insert(Assessment(facility_id: task, assessment_data: '123'));
  }
}