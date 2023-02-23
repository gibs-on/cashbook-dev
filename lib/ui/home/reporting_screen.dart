import 'package:cashbook/models/graphs/chart_data.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/reporting_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/home/barchart_screen.dart';
import 'package:cashbook/ui/home/time_filters.dart';
import 'package:cashbook/utils/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../service_locator.dart';
import 'transaction_view_screen.dart';

class ReportingScreen extends StatefulWidget {
  final bool openTotalCashOutFirst;

  const ReportingScreen({Key? key, this.openTotalCashOutFirst = false})
      : super(key: key);

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  final ReportingStore _reportingStore = getIt<ReportingStore>();

  final TransactionStore _transactionStore = getIt<TransactionStore>();

  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();

  @override
  void initState() {
    if (widget.openTotalCashOutFirst) {
      _reportingStore.changeSelectedScreen(1);
    } else {
      _reportingStore.changeSelectedScreen(0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reporting',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Observer(builder: (_) {
                print('Change screen observer');
                // _homeScreenStore.cashInChartData;
                // _homeScreenStore.cashOutChartData;
                // _homeScreenStore.columnChartData;

                return Column(children: [
                  timeFilter(context),
                  const SizedBox(height: 10),
                  _tabs(),
                  const SizedBox(height: 10),
                  seletedScreen(context, _homeScreenStore,
                      _reportingStore.selectedScreen, _transactionStore),
                ]);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSegmentedControl(
        children: const <int, Widget>{
          0: Text("Cash In"),
          1: Text("Cash Out"),
          // 2: Text("Balances"),
        },
        onValueChanged: (int value) {
          _reportingStore.changeSelectedScreen(value);
        },
        groupValue: _reportingStore.selectedScreen,
      ),
    );
  }

  Widget timeFilter(BuildContext context) {
    return TextButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (ctx) => TimeFilterBottomSheet(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.access_time_outlined,
          ),
          const SizedBox(width: 8),
          Observer(builder: (_) {
            return Text(
              _transactionStore.timeFilterIndicator ?? 'All Time',
            );
          }),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget seletedScreen(BuildContext context, HomeScreenStore _homeScreenStore,
      int screen, TransactionStore _transactionStore) {
    final ThemeData _theme = Theme.of(context);
    switch (screen) {
      case 0:
        {
          return Observer(builder: (_) {
            print('CashIn doughnut observer');
            return _doughnutReportScreen(true, _theme);
          });
        }
      case 1:
        {
          return Observer(builder: (_) {
            print(
                'CashOut doughnut observer: ${_homeScreenStore.cashOutChartData.length}');
            return _doughnutReportScreen(false, _theme);
          });
        }
      // ignore: todo
      //TODO- decide to comment this. this does not looks good. will do it in future.
      // case 2:
      //   {
      //     return Observer(builder: (_) {
      //       print('column chart observer');
      //       return BarChartScreen(
      //         chartData: _homeScreenStore.columnChartData,
      //       );
      //     });
      //   }
      default:
        {
          return _doughnutReportScreen(true, _theme);
        }
    }
  }

  Widget _doughnutReportScreen(bool isCashIn, ThemeData _theme) {
    double total = _homeScreenStore.preparePieChartData(isCashIn);
    List<ChartData> chartData = [];
    if (isCashIn) {
      chartData = _homeScreenStore.cashInChartData;
    } else {
      chartData = _homeScreenStore.cashOutChartData;
    }

    return chartData.isEmpty
        ? _noRecordFound(_theme)
        : Column(
            children: [
              SizedBox(child: _chat(chartData)),
              const SizedBox(height: 20),
              _total(total, _theme),
              const SizedBox(height: 20),
              _categoryList(chartData, _theme),
              const SizedBox(height: 80),
            ],
          );
  }

  Widget _categoryList(List<ChartData> chartData, ThemeData _theme) {
    return ListView.builder(
      itemCount: chartData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        ChartData currentItem = chartData[index];
        return Column(
          children: [
            InkWell(
              onTap: () async {
                _transactionStore.changeCategoryFilter(currentItem.category);
                await Navigator.of(context)
                    .pushNamed(TrasactionViewScreen.routeName);
                _transactionStore.changeCategoryFilter(null);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
                child: Row(
                  children: [
                    Text(
                      currentItem.category.title.capitalize(),
                      style: _theme.textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '${_transactionStore.selectedCurrency}  ${currentItem.value.toStringAsFixed(2).priceCommas()}',
                      style: _theme.textTheme.headline5!.copyWith(),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.navigate_next,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
          ],
        );
      },
    );
  }

  Widget _chat(List<ChartData> chartData) {
    return SfCircularChart(
      legend: Legend(
        isVisible: false,
        // Overflowing legend content will be wraped
        // overflowMode: LegendItemOverflowMode.wrap,
      ),
      series: <CircularSeries>[
        // Renders doughnut chart
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.category.title,
          yValueMapper: (ChartData data, _) => data.value,
          dataLabelMapper: (ChartData data, _) =>
              '${data.percent}\n ${data.category.title.capitalize()}',
          dataLabelSettings: const DataLabelSettings(
            // Renders the data label
            isVisible: true,

            // labelPosition: ChartDataLabelPosition.outside,
          ),
        ),
      ],
    );
  }

  Widget _total(double total, ThemeData _theme) {
    return Text(
      'Total : ${total.toStringAsFixed(2).priceCommas()}',
      style: _theme.textTheme.headline3,
    );
  }

  Widget _noRecordFound(ThemeData _theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Image.asset('assets/images/open-box.png', height: 100),
        const SizedBox(height: 16),
        Text(
          'No record found, try clearing filters',
          style: _theme.textTheme.headline5,
        ),
      ],
    );
  }
}
