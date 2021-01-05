import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrdqa_tool/models/Country.dart';
import '../services/SqliteDatabaseManager.dart';

class CountryRepository {
  final _db = Firestore.instance;
  final _dbSqlite = SqliteDatabaseManager.instance;

  Future<void> addCountry(Country country) async {

    await _db.collection("countries").add({"country_id": country.id, "name": country.name})
        .then((documentReference){
      print(documentReference.documentID);
    }).catchError((e){
      print(e.toString());
    });
  }
}