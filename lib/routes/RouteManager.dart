import 'package:flutter/material.dart';
import 'package:mrdqa_tool/forms/IndicatorForm.dart';
import 'package:mrdqa_tool/pages/TestDatabasePage.dart';
import 'package:mrdqa_tool/pages/DashboardPage.dart';
import 'package:mrdqa_tool/pages/FacilityInformationPage.dart';
import 'package:mrdqa_tool/pages/IndicatorPage.dart';
import 'package:mrdqa_tool/pages/InstructionPage.dart';
import 'package:mrdqa_tool/pages/SupervisionPage.dart';
import 'package:mrdqa_tool/pages/DataEntryPage.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name){
      case '/instructions':

        return MaterialPageRoute(builder: (_) => InstructionPage());

      case '/facility_information':

          return MaterialPageRoute(builder: (_) => FacilityInformationPage());
        //return _errorRoute();

      case '/indicators':

        return MaterialPageRoute(builder: (_) => IndicatorPage());
        //return _errorRoute();

      case '/dashboards':

        return MaterialPageRoute(builder: (_) => DashboardPage());
        //return _errorRoute();
      
      case '/supervisions':

        return MaterialPageRoute(builder: (_) => SupervisionPage());
        //return _errorRoute();
      case '/test_database':

        return MaterialPageRoute(builder: (_) => TestDatabasePage());

      case '/data_entry':

        return MaterialPageRoute(builder: (_) => DataEntryPage());

    case '/indicators/add_indicator':

    return MaterialPageRoute(builder: (_) => IndicatorForm());

    default:

        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error: "),
            ),
            body: Center(
              child: Text("Error: "),
            ),
          );
        }
    );
  }
}