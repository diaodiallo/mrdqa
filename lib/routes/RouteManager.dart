import 'package:flutter/material.dart';
import 'package:mrdqa_tool/pages/DashboardPage.dart';
import 'package:mrdqa_tool/pages/FacilityInformationPage.dart';
import 'package:mrdqa_tool/pages/IndicatorPage.dart';
import 'package:mrdqa_tool/pages/InstructionPage.dart';

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