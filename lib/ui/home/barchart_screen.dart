import 'package:cashbook/models/graphs/column_chart_data.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../service_locator.dart';

class BarChartScreen extends StatelessWidget {
  BarChartScreen({Key? key, required this.chartData}) : super(key: key);
  static const routeName = '/bar-chart-screen';

  List<ColumnChartData> chartData;

  //Stores
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    _homeScreenStore.prepareBarChart();
    // chartData = chartData as List<ColumnChartData>;
    return Center(
      child: chartData.isEmpty
          ? Text('No record found', style: _theme.textTheme.headline5)
          : SizedBox(
              // height: 350,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  visibleMaximum:
                      chartData.length < 4 ? chartData.length.toDouble() : 4,
                  visibleMinimum: 0,
                  // visibleMinimum: 2,
                ),
                zoomPanBehavior: ZoomPanBehavior(
                  enablePanning: true,
                ),
                series: <CartesianSeries>[
                  ColumnSeries<ColumnChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ColumnChartData data, _) => data.x,
                      yValueMapper: (ColumnChartData data, _) => data.y),
                ],
              ),
            ),
    );
  }
}
