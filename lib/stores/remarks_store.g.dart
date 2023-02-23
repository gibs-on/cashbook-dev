// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remarks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RemarksStore on _RemarksStore, Store {
  final _$isLoadingAtom = Atom(name: '_RemarksStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$remarksListAtom = Atom(name: '_RemarksStore.remarksList');

  @override
  ObservableList<Remark> get remarksList {
    _$remarksListAtom.reportRead();
    return super.remarksList;
  }

  @override
  set remarksList(ObservableList<Remark> value) {
    _$remarksListAtom.reportWrite(value, super.remarksList, () {
      super.remarksList = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
remarksList: ${remarksList}
    ''';
  }
}
