import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/SqliteDatabaseManager.dart';

class Assessment {
  String facility_id;
  String assessment_data;

  Assessment({this.facility_id, this.assessment_data});

  Assessment.fromMap(Map<String, dynamic> map){
    facility_id = map['facility_id'];
    assessment_data = map['assessment_data'];
  }

  Map<String, dynamic> toMap() {
    return {
      SqliteDatabaseManager.FACILITY_ID: facility_id,
      SqliteDatabaseManager.ASSESSMENT_DATA: assessment_data,
    };
  }
}