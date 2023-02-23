// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportingStore on _ReportingStore, Store {
  final _$selectedScreenAtom = Atom(name: '_ReportingStore.selectedScreen');

  @override
  int get selectedScreen {
    _$selectedScreenAtom.reportRead();
    return super.selectedScreen;
  }

  @override
  set selectedScreen(int value) {
    _$selectedScreenAtom.reportWrite(value, super.selectedScreen, () {
      super.selectedScreen = value;
    });
  }

  final _$_ReportingStoreActionController =
      ActionController(name: '_ReportingStore');

  @override
  void changeSelectedScreen(int val) {
    final _$actionInfo = _$_ReportingStoreActionController.startAction(
        name: '_ReportingStore.changeSelectedScreen');
    try {
      return super.changeSelectedScreen(val);
    } finally {
      _$_ReportingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedScreen: ${selectedScreen}
    ''';
  }
}
