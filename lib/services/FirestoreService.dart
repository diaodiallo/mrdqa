import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrdqa_tool/models/Assessment.dart';

class FirestoreService {

  final db = Firestore.instance;

  Future < void > addAssessment(Assessment assessment) async {
    print('INSERTING INTO FIRESTORE');
    await db.collection("assessments").add({"facility_id": assessment.facility_id, "data": assessment.assessment_data})
        .then((documentReference){
          print(documentReference.documentID);
    }).catchError((e){
      print(e.toString());
    });
  }
}