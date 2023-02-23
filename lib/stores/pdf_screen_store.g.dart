// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PdfScreenStore on _PdfScreenStore, Store {
  final _$isBuildingPdfAtom = Atom(name: '_PdfScreenStore.isBuildingPdf');

  @override
  bool get isBuildingPdf {
    _$isBuildingPdfAtom.reportRead();
    return super.isBuildingPdf;
  }

  @override
  set isBuildingPdf(bool value) {
    _$isBuildingPdfAtom.reportWrite(value, super.isBuildingPdf, () {
      super.isBuildingPdf = value;
    });
  }

  final _$_PdfScreenStoreActionController =
      ActionController(name: '_PdfScreenStore');

  @override
  void changeBuildingPdfStatus(bool val) {
    final _$actionInfo = _$_PdfScreenStoreActionController.startAction(
        name: '_PdfScreenStore.changeBuildingPdfStatus');
    try {
      return super.changeBuildingPdfStatus(val);
    } finally {
      _$_PdfScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBuildingPdf: ${isBuildingPdf}
    ''';
  }
}
