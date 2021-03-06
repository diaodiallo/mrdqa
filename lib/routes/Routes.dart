import 'package:mrdqa_tool/pages/ConfigurationPage.dart';
import 'package:mrdqa_tool/pages/TestDatabasePage.dart';
import 'package:mrdqa_tool/pages/DashboardPage.dart';
import 'package:mrdqa_tool/pages/FacilityInformationPage.dart';
import 'package:mrdqa_tool/pages/IndicatorPage.dart';
import 'package:mrdqa_tool/pages/InstructionPage.dart';
import 'package:mrdqa_tool/pages/SupervisionPage.dart';
import 'package:mrdqa_tool/pages/DataEntryPage.dart';
import 'package:mrdqa_tool/forms/IndicatorForm.dart';
import 'package:mrdqa_tool/forms/IndicatorTypeForm.dart';
import 'package:mrdqa_tool/forms/DataElementForm.dart';
import 'package:mrdqa_tool/forms/DataSourceForm.dart';
import 'package:mrdqa_tool/forms/SupervisionForm.dart';

class Routes {
  String _instructions = InstructionPage.routeName;
  String _facilityInformation = FacilityInformationPage.routeName;
  String _indicator = IndicatorPage.routeName;
  String _dashboards = DashboardPage.routeName;
  String _supervisions = SupervisionPage.routeName;
  String _databaseTest = TestDatabasePage.routeName;
  String _dataEntry = DataEntryPage.routeName;
  String _addIndicator = IndicatorForm.routeName;
  String _addIndicatorType = IndicatorTypeForm.routeName;
  String _addDataElement = DataElementForm.routeName;
  String _addDataSource = DataSourceForm.routeName;
  String _addSupervision = SupervisionForm.routeName;
  String _configuration = ConfigurationPage.routeName;

  String get instructions => _instructions;

  String get facilityInformation => _facilityInformation;

  String get indicator => _indicator;

  String get dashboards => _dashboards;

  String get supervisions => _supervisions;

  String get databaseTest => _databaseTest;

  String get dataEntry => _dataEntry;

  String get addIndicator => _addIndicator;

  String get addIndicatorType => _addIndicatorType;

  String get addDataElement => _addDataElement;

  String get addDataSource => _addDataSource;

  String get addSupervision => _addSupervision;

  String get configRouteName => _configuration;
}
