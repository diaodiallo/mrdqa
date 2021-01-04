import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mrdqa_tool/menus/MenuManager.dart';
import 'package:mrdqa_tool/routes/Routes.dart';
import '../models/Indicator.dart';
import '../models/IndicatorType.dart';
import '../models/DataSource.dart';
import '../models/DataElement.dart';
import '../forms/IndicatorForm.dart';
import '../forms/IndicatorTypeForm.dart';
import '../forms/DataElementForm.dart';
import '../forms/DataSourceForm.dart';

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
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(height: 450.0, child: _indicatorsView()),
                  ),
                  Container(child: IconButton(
                    icon: Icon(Icons.add_box),
                    color: Colors.blue,
                    onPressed: () => IndicatorForm(context, Routes()).getDrawer(),
                  ),),
                ]),
              ),
            ]),
          ),
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(height: 450.0, child: _dataElementsView()),
                  ),
                  Container(child: IconButton(
                    icon: Icon(Icons.add_box),
                    color: Colors.blue,
                    onPressed: () => {},
                  ),),
                ]),
              ),
            ]),
          ),
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(height: 450.0, child: _dataSourcesView()),
                  ),
                  Container(child: IconButton(
                    icon: Icon(Icons.add_box),
                    color: Colors.blue,
                    onPressed: () => {},
                  ),),
                ]),
              ),
            ]),
          ),
          IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(height: 450.0, child: _indicatorTypesView()),
                  ),
                  Container(child: IconButton(
                    icon: Icon(Icons.add_box),
                    color: Colors.blue,
                    onPressed: () => {},
                  ),),
                ]),
              ),
            ]),
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
      IndicatorType(id: 1, name: 'Type 1'),
      IndicatorType(id: 2, name: 'Type 2'),
      IndicatorType(id: 3, name: 'Type 3'),
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
      DataElement(id: "element001", name: 'Public'),
      DataElement(id: "element002", name: 'Private'),
      DataElement(id: "element003", name: 'Confessionnal'),
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
      DataSource(id: "source001", name: 'Public'),
      DataSource(id: "source002", name: 'Private'),
      DataSource(id: "source003", name: 'Confessionnal'),
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
