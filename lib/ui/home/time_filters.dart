import 'package:cashbook/stores/transaction_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../service_locator.dart';

enum TimeFilter {
  allTime,
  today,
  yesterday,
  thisMonth,
  lastMonth,
  singleDay,
  dateRange,
}

extension TimeFilterExtension on TimeFilter {
  String get title {
    switch (this) {
      case TimeFilter.allTime:
        return 'All Time';
      case TimeFilter.today:
        return 'Today';
      case TimeFilter.yesterday:
        return 'Yesterday';
      case TimeFilter.thisMonth:
        return 'This Month';
      case TimeFilter.lastMonth:
        return 'Last Month';
      case TimeFilter.singleDay:
        return 'Single Day';
      case TimeFilter.dateRange:
        return 'Date Range';
      default:
        return 'undefiend';
    }
  }
}

class TimeFilterBottomSheet extends StatelessWidget {
  final TransactionStore transactionStore = getIt<TransactionStore>();
  TimeFilterBottomSheet({Key? key}) : super(key: key);

  Future<DateTime?> _selectDate(
      BuildContext context, DateTime? val, DateTime? initDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: initDate ?? DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != val) {
      return picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Observer(builder: (_) {
              return Text(
                transactionStore.timeFilter?.title ?? 'Undefined',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              );
            }),
            const Divider(),
            Observer(builder: (_) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      transactionStore.changeTimeFilter(TimeFilter.allTime);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio<TimeFilter>(
                          key: const ValueKey(0),
                          groupValue: transactionStore.timeFilter,
                          value: TimeFilter.allTime,
                          onChanged: (TimeFilter? val) {
                            transactionStore.changeTimeFilter(val);
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'All Time',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      transactionStore.changeTimeFilter(TimeFilter.today);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio(
                            key: const ValueKey(1),
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.today,
                            onChanged: (TimeFilter? val) {
                              transactionStore.changeTimeFilter(val);
                              Navigator.of(context).pop();
                            }),
                        Text(
                          'Today',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      transactionStore.changeTimeFilter(TimeFilter.yesterday);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio(
                            key: const ValueKey(2),
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.yesterday,
                            onChanged: (TimeFilter? val) {
                              transactionStore.changeTimeFilter(val);
                              Navigator.of(context).pop();
                            }),
                        Text(
                          'Yesterday',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      transactionStore.changeTimeFilter(TimeFilter.thisMonth);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio(
                            key: const ValueKey(3),
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.thisMonth,
                            onChanged: (TimeFilter? val) {
                              transactionStore.changeTimeFilter(val);
                              Navigator.of(context).pop();
                            }),
                        Text(
                          'This Month',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      transactionStore.changeTimeFilter(TimeFilter.lastMonth);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio(
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.lastMonth,
                            onChanged: (TimeFilter? val) {
                              transactionStore.changeTimeFilter(val);
                              Navigator.of(context).pop();
                            }),
                        Text(
                          'Last Month',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      transactionStore.changeTimeFilter(TimeFilter.singleDay);
                      DateTime? picked = await _selectDate(
                          context, transactionStore.timeFilterSingleDate, null);
                      transactionStore.changetimeFilterSingleDate(picked);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Radio<TimeFilter>(
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.singleDay,
                            onChanged: (TimeFilter? val) async {
                              transactionStore.changeTimeFilter(val);
                              DateTime? picked = await _selectDate(context,
                                  transactionStore.timeFilterSingleDate, null);
                              transactionStore
                                  .changetimeFilterSingleDate(picked);
                              Navigator.of(context).pop();
                            }),
                        Text(
                          transactionStore.timeFilter == TimeFilter.singleDay
                              ? DateFormat('d MMM y')
                                  .format(transactionStore.timeFilterSingleDate)
                              : 'Single Day',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await showDateRangeDialogue(context);
                      transactionStore.changeTimeFilter(TimeFilter.dateRange);
                    },
                    child: Row(
                      children: [
                        Radio<TimeFilter>(
                            groupValue: transactionStore.timeFilter,
                            value: TimeFilter.dateRange,
                            onChanged: (_) async {
                              await showDateRangeDialogue(context);
                              transactionStore
                                  .changeTimeFilter(TimeFilter.dateRange);
                            }),
                        Text(
                          'Date Range',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Apply')))
                    ],
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Future<void> showDateRangeDialogue(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text('Start Date'),
                              TextButton(
                                onPressed: () async {
                                  DateTime? picked = await _selectDate(
                                      context,
                                      transactionStore.timeFilterRangeStart,
                                      null);

                                  transactionStore.changetimeFilterRange(
                                      picked, true);
                                },
                                child: Observer(builder: (_) {
                                  return Text(
                                    DateFormat('d MMM y').format(
                                        transactionStore.timeFilterRangeStart),
                                  );
                                }),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('End Date'),
                              TextButton(
                                onPressed: () async {
                                  DateTime? picked = await _selectDate(
                                      context,
                                      transactionStore.timeFilterRangeEnd,
                                      transactionStore.timeFilterRangeStart);

                                  transactionStore.changetimeFilterRange(
                                      picked, false);
                                },
                                child: Observer(builder: (_) {
                                  return Text(
                                    DateFormat('d MMM y').format(
                                        transactionStore.timeFilterRangeEnd),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Apply')),
                          ),
                        ],
                      ),
                    ],
                  )),
            ));
  }
}
