import 'DatabaseHelper.dart';

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
      DatabaseHelper.FACILITY_ID: facility_id,
      DatabaseHelper.ASSESSMENT_DATA: assessment_data,
    };
  }
}