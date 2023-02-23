extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String onlyFirstLetterCapitalise() {
    if (isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  static RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  String priceCommas() {
    return replaceAllMapped(reg, mathFunc);
  }
}
