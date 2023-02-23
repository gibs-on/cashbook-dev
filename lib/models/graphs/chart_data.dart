import 'package:flutter/material.dart';

import '../cash_category.dart';

class ChartData {
  ChartData(this.value, this.category, this.percent,
      [this.color = Colors.orange]);
  final CashCategory category;
  final double value;
  final String percent;
  final Color color;
}
