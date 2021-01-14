class Facility{
  Facility({this.id, this.name, this.countryId, this.townVillage, this.district, this.region, this.facilityTypeId, this.phone, this.email});
  final String id;
  final String name;
  final String countryId; // a reference to Country
  final String townVillage;
  final String district; // District and Region may be a reference later as well let's discuss more
  final String region;
  final int facilityTypeId; // a reference to type
  final String phone;
  final String email;
}