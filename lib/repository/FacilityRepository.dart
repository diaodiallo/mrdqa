import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrdqa_tool/models/Facility.dart';

class FacilityRepository {
  final _db = Firestore.instance;

  Future<void> addCountry(Facility facility) async {
    await _db.collection("facilities").add(
        {"facility_id": facility.id, "name": facility.name, "phone": facility.phone, "email": facility.email}
        ).then((documentReference){
      print(documentReference.documentID);
    }).catchError((e){
      print(e.toString());
    });
  }
}