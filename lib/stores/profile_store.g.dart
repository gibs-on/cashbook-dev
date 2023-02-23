// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$nameAtom = Atom(name: '_ProfileStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$imageAtom = Atom(name: '_ProfileStore.image');

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$_profileResponseAtom = Atom(name: '_ProfileStore._profileResponse');

  @override
  ProfileResponse get _profileResponse {
    _$_profileResponseAtom.reportRead();
    return super._profileResponse;
  }

  @override
  set _profileResponse(ProfileResponse value) {
    _$_profileResponseAtom.reportWrite(value, super._profileResponse, () {
      super._profileResponse = value;
    });
  }

  final _$phoneAtom = Atom(name: '_ProfileStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$helpQNAAtom = Atom(name: '_ProfileStore.helpQNA');

  @override
  ObservableList<HelpQNA> get helpQNA {
    _$helpQNAAtom.reportRead();
    return super.helpQNA;
  }

  @override
  set helpQNA(ObservableList<HelpQNA> value) {
    _$helpQNAAtom.reportWrite(value, super.helpQNA, () {
      super.helpQNA = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
image: ${image},
phone: ${phone},
helpQNA: ${helpQNA}
    ''';
  }
}
