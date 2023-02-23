import 'package:mobx/mobx.dart';

part 'reporting_store.g.dart';

class ReportingStore = _ReportingStore with _$ReportingStore;

abstract class _ReportingStore with Store {
  @observable
  int selectedScreen = 0;

  @action
  void changeSelectedScreen(int val) {
    selectedScreen = val;
  }
}
