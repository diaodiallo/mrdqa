import 'package:flutter/material.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/models/Supervision.dart';
import 'package:mrdqa_tool/routes/Routes.dart';
import '../models/Indicator.dart';
import '../models/Facility.dart';

class SupervisionPage extends StatefulWidget {
  static String routeName = '/supervisions';

  @override
  _SupervisionPageState createState() => _SupervisionPageState();
}

class _SupervisionPageState extends State<SupervisionPage> {
  @override
  Widget build(BuildContext context) {
    Supervision supervision = _getSupervision();
    // List<Indicator> indicators = List(3);
    // List<Facility> facilities = List(3);
    return Scaffold(
        appBar: AppBar(
          title: Text('Supervision planning'),
        ),
        drawer: Drawer(
          child: MenuManager(context, Routes()).getDrawer(),
        ),
        body: SafeArea(
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              //child: _buildSupervisionForm(),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Supervision details'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Designation'),
                            Text('Period'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              supervision.designation,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              supervision.period.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            setState(() {
                              Navigator.pushReplacementNamed(
                                  context, Routes().addSupervision);
                            });
                          },
                          child: const Text('Edit'),
                        ),
                        FlatButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            // Save everything
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: _facilitiesView(_getFacilities()),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: _indicatorsView(_getIndicators()),
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text('Facility'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text('Indicator'),
                icon: Icon(Icons.add),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ));
  }

  Widget _buildSupervisionForm() {
    final _formKey = GlobalKey<FormState>();
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              ))
    ]);
  }

  Widget _indicatorsView(List<Indicator> indicators) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: DataTable(
        columns: [
          DataColumn(label: Text('Id')),
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Name')),
        ],
        rows: indicators
            .map((indicator) => DataRow(cells: <DataCell>[
                  DataCell(Container(
                      width: 20, //SET width
                      child: Text(indicator.id))),
                  DataCell(Container(
                      width: 50, //SET width
                      child: Text(indicator.typeId.toString()))),
                  DataCell(Container(//SET width
                      child: Text(indicator.name))),
                ]))
            .toList(),
      )),
    );
  }

  List<Indicator> _getIndicators() {
    List<Indicator> indicators = [
      Indicator(id: 'ind001', name: 'Number of malaria cases', typeId: 1),
      Indicator(id: 'ind002', name: 'Number of malaria cases', typeId: 1),
      Indicator(id: 'ind003', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind004', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind005', name: 'Number of malaria cases', typeId: 3),
    ];
    return indicators;
  }

  Widget _facilitiesView(List<Facility> facilities) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: DataTable(
        columns: [
          DataColumn(label: Text('Id')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('District')),
          DataColumn(label: Text('Type')),
        ],
        rows: facilities
            .map((facility) => DataRow(cells: <DataCell>[
                  DataCell(Container(
                      width: 20, //SET width
                      child: Text(facility.id))),
                  DataCell(Container(
                      //SET width
                      child: Text(facility.name))),
                  DataCell(Container(
                      width: 50, //SET width
                      child: Text(facility.district))),
                  DataCell(Container(
                      width: 50, //SET width
                      child: Text(facility.facilityTypeId.toString()))),
                ]))
            .toList(),
      )),
    );
  }

  List<Facility> _getFacilities() {
    List<Facility> facilities = [
      Facility(
          id: 'facility01',
          name: 'Gnaly Health Center',
          countryId: 'guinea',
          townVillage: 'Timbi madina',
          district: 'Pita',
          region: 'Mamou',
          facilityTypeId: 1,
          phone: '623909413',
          email: 'exemple@gmail.come'),
      Facility(
          id: 'facility02',
          name: 'Hafia Health Center',
          countryId: 'guinea',
          townVillage: 'Hafia',
          district: 'Labe',
          region: 'Labe',
          facilityTypeId: 2,
          phone: '623909413',
          email: 'exemple@gmail.come'),
      Facility(
          id: 'facility03',
          name: 'Dixinn Health Center',
          countryId: 'guinea',
          townVillage: 'Dixinn',
          district: 'Dixinn',
          region: 'Conakry',
          facilityTypeId: 1,
          phone: '623909413',
          email: 'exemple@gmail.come'),
      Facility(
          id: 'facility04',
          name: 'Diountou Health Center',
          countryId: 'guinea',
          townVillage: 'Diountou',
          district: 'Lelouma',
          region: 'Labe',
          facilityTypeId: 1,
          phone: '623909413',
          email: 'exemple@gmail.come'),
    ];
    return facilities;
  }

  Supervision _getSupervision() {
    Supervision supervision = Supervision(
        id: 1,
        designation: 'Gnaly Health Center',
        period: new DateTime.now(),
        countryId: 'guinea');
    return supervision;
  }
}
