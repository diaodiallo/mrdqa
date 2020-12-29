class Supervision{
  Supervision(this.id, this.period, this.countryId, this.visits);
  final int id;
  final DateTime period;
  final String countryId; // a reference to Country
  final List visits;
}