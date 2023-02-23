import 'package:cashbook/constants/function_response.dart';
import 'package:mobx/mobx.dart';
part 'pdf_screen_store.g.dart';

class PdfScreenStore = _PdfScreenStore with _$PdfScreenStore;

abstract class _PdfScreenStore with Store {
  @observable
  bool isBuildingPdf = false;

  @action
  void changeBuildingPdfStatus(bool val) {
    isBuildingPdf = val;
  }
}
