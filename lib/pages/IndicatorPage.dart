import 'package:flutter/material.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';
import '../models/Indicator.dart';
import '../models/IndicatorType.dart';
import '../models/DataSource.dart';
import '../models/DataElement.dart';

class IndicatorPage extends StatefulWidget {
  static String routeName = '/indicators';

  @override
  _IndicatorPageState createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  //String _title = "Enter the indicator type, and indicators for up to five indicators.  Select \"Other_specify\" to enter user-defined types and indicators.";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // The number of tabs / content sections to display.
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Indicators', icon: Icon(Icons.computer)),
              Tab(text: 'Elements', icon: Icon(Icons.drag_indicator)),
              Tab(text: 'Sources', icon: Icon(Icons.book)),
              Tab(text: 'Types', icon: Icon(Icons.drag_indicator)),
            ],
          ),
          title: Text("Indicators"),
        ),
        drawer: Drawer(
          child: MenuManager(context, Routes()).getDrawer(),
        ),
        body: TabBarView(children: [
          Scaffold(
            body: Center(
              child: IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                height: 450, child: _indicatorsView()),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addIndicator);
                });
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
          Scaffold(
            body: Center(
                child: IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                              height: 450.0, child: _dataElementsView()),
                        ),
                      ]),
                    ),
                  ]),
            )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addDataElement);
                });
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ), //IndicatorForm(context, Routes()).getDrawer(
          Scaffold(
            body: Center(
              child: IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                height: 450.0, child: _dataSourcesView()),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addDataSource);
                });
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
          Scaffold(
            body: Center(
              child: IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                height: 450.0, child: _indicatorTypesView()),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, Routes().addIndicatorType);
                });
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _indicatorsView() {
    List<Indicator> indicators = _getIndicators();
    return Container(
      child: ListView(
        children: indicators
            .map((indicator) => _buildIndicatorRow(indicator))
            .toList(),
      ),
    );
  }

  List<Indicator> _getIndicators() {
    List<Indicator> indicators = [
      Indicator(id: 'ind001', name: 'Number of malaria cases', typeId: 1),
      Indicator(id: 'ind002', name: 'Number of malaria cases', typeId: 1),
      Indicator(id: 'ind003', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind004', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind005', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind006', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind007', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind008', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind009', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind010', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind011', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind012', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind0013', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind014', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind015', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind016', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind017', name: 'Number of malaria cases', typeId: 2),
      Indicator(id: 'ind018', name: 'Number of malaria cases', typeId: 3),
      Indicator(id: 'ind019', name: 'Number of malaria cases', typeId: 3),
    ];
    return indicators;
  }

  Widget _buildIndicatorRow(Indicator indicator) {
    return Column(
      children: [
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(indicator.id),
          Text(indicator.name),
          Text(indicator.typeId.toString())
        ]),
      ],
    );
  }

  Widget _indicatorTypesView() {
    List<IndicatorType> indicatorsType = _getIndicatorsType();
    return Container(
      child: ListView(
        children: indicatorsType
            .map((indicatorType) => _buildIndicatorsTypeRow(indicatorType))
            .toList(),
      ),
    );
  }

  List<IndicatorType> _getIndicatorsType() {
    List<IndicatorType> indicators = [
      IndicatorType(id: 1, name: 'Indicator Type 1'),
      IndicatorType(id: 2, name: 'Indicator Type 2'),
      IndicatorType(id: 3, name: 'Indicator Type 3'),
      IndicatorType(id: 4, name: 'Indicator Type 4'),
      IndicatorType(id: 5, name: 'Indicator Type 5'),
      IndicatorType(id: 6, name: 'Indicator Type 6'),
    ];
    return indicators;
  }

  Widget _buildIndicatorsTypeRow(IndicatorType indicatorType) {
    return Column(
      children: [
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(indicatorType.id.toString()),
          Text(indicatorType.name)
        ]),
      ],
    );
  }

  Widget _dataElementsView() {
    List<DataElement> dataElements = _getDataElements();
    return Container(
      child: ListView(
        children: dataElements
            .map((dataElement) => _buildDataElementsRow(dataElement))
            .toList(),
      ),
    );
  }

  List<DataElement> _getDataElements() {
    List<DataElement> dataElements = [
      DataElement(id: "element001", name: 'Data Element 1'),
      DataElement(id: "element002", name: 'Data Element 2'),
      DataElement(id: "element003", name: 'Data Element 3'),
      DataElement(id: "element004", name: 'Data Element 4'),
      DataElement(id: "element005", name: 'Data Element 5'),
      DataElement(id: "element006", name: 'Data Element 6'),
      DataElement(id: "element007", name: 'Data Element 7'),
      DataElement(id: "element008", name: 'Data Element 8'),
      DataElement(id: "element009", name: 'Data Element 9'),
      DataElement(id: "element010", name: 'Data Element 10'),
      DataElement(id: "element011", name: 'Data Element 11'),
      DataElement(id: "element012", name: 'Data Element 12'),
    ];
    return dataElements;
  }

  Widget _buildDataElementsRow(DataElement dataElement) {
    return Column(
      children: [
        Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(dataElement.id), Text(dataElement.name)]),
      ],
    );
  }

  Widget _dataSourcesView() {
    List<DataSource> dataSources = _getDataSources();
    return Container(
      child: ListView(
        children: dataSources
            .map((dataSource) => _buildDataSourcesRow(dataSource))
            .toList(),
      ),
    );
  }

  List<DataSource> _getDataSources() {
    List<DataSource> dataSources = [
      DataSource(id: "source001", name: 'Data Source 1'),
      DataSource(id: "source002", name: 'Data Source 2'),
      DataSource(id: "source003", name: 'Data Source 3'),
      DataSource(id: "source004", name: 'Data Source 4'),
      DataSource(id: "source005", name: 'Data Source 5'),
      DataSource(id: "source006", name: 'Data Source 6'),
      DataSource(id: "source007", name: 'Data Source 7'),
      DataSource(id: "source008", name: 'Data Source 8'),
      DataSource(id: "source009", name: 'Data Source 9'),
      DataSource(id: "source010", name: 'Data Source 10'),
      DataSource(id: "source011", name: 'Data Source 11'),
      DataSource(id: "source012", name: 'Data Source 12'),
    ];
    return dataSources;
  }

  Widget _buildDataSourcesRow(DataSource dataSource) {
    return Column(
      children: [
        Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(dataSource.id), Text(dataSource.name)]),
      ],
    );
  }
}
