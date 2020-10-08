import 'package:mrdqa_tool/models/IndicatorData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {

  static const String routeName = '/dashboards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(), // Initialize category axis.
                    series: <LineSeries<IndicatorData, String>>[ // Initialize line series.
                      LineSeries<IndicatorData, String>(
                          dataSource: [
                            IndicatorData('Jan', 35),
                            IndicatorData('Feb', 28),
                            IndicatorData('Mar', 34),
                            IndicatorData('Apr', 32),
                            IndicatorData('May', 40)
                          ],
                          xValueMapper: (IndicatorData indicator, _) => indicator.year,
                          yValueMapper: (IndicatorData indicator, _) => indicator.value
                      )
                    ]
                )
            )
        )
    );
  }
}