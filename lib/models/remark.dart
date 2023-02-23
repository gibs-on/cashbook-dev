class Remark {
  String id;
  int bookId;
  String title;
  int useCount;
  bool isCashIn;
  bool isSynced;
  Remark({
    required this.id,
    required this.bookId,
    required this.title,
    required this.useCount,
    required this.isCashIn,
    required this.isSynced,
  });
}
