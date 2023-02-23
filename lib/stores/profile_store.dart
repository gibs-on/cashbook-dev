import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/profile_api_helper.dart';
import 'package:cashbook/models/api_response/profile_response.dart';
import 'package:mobx/mobx.dart';

import '../service_locator.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

class HelpQNA {
  String id;
  String category;
  String question;
  String answer;
  HelpQNA(
      {required this.id,
      required this.category,
      required this.question,
      required this.answer});
}

abstract class _ProfileStore with Store {
  late ProfileApiHelper _profileApiHelper;
  _ProfileStore(this._profileApiHelper);

  @observable
  String name = 'undefined';
  @observable
  String image = '';

  @observable
  ProfileResponse _profileResponse = ProfileResponse(
      imageUrl: "Undefined",
      logo: null,
      custId: "Undefined",
      organizationName: "Undefined",
      fullnames: "Undefined",
      primaryPhone: "Undefined",
      secondaryPhone: null,
      primaryEmail: "a10@a.co",
      secondaryEmail: null,
      website: null,
      imageFile: null,
      city: null,
      address: null,
      addressCode: null,
      country: "Undefined",
      location: null,
      businessType: null);

  @observable
  String phone = 'undefined';

  Future<void> getProfileInfo() async {
    //TODO: use db to store user info
    try {
      ProfileResponse? _profileInfo =
          await _profileApiHelper.getProfile() ?? _profileResponse;

      name = _profileInfo.fullnames!;
      phone = _profileInfo.primaryPhone!;
      if (_profileInfo.logo != null && _profileInfo.logo!.isNotEmpty) {
        image = _profileInfo.logo!;
        print('Image was Update');
      }
      _profileResponse = _profileInfo;
    } catch (e) {
      print('Error getting profile info : $e');
    }
  }

  Future<FunctionResponse> updateProfileName(String _name) async {
    try {
      FunctionResponse _response = await _profileApiHelper.updateProfileName(
          profile: _profileResponse, name: _name);

      if (_response.success) {
        name = _name;
      }

      return _response;
    } catch (e) {
      return FunctionResponse(
          success: false,
          message: 'Error Processing Update Request Profile: $e');
    }
  }

  Future<FunctionResponse> updateProfileImage(String _image) async {
    try {
      FunctionResponse _response = await _profileApiHelper.updateProfileImage(
          profile: _profileResponse, image: _image);

      if (_response.success) {
        print('Image was Update');

        image = _image;
      }

      return _response;
    } catch (e) {
      return FunctionResponse(
          success: false,
          message: 'Error Processing Update Request Profile: $e');
    }
  }

  @observable
  ObservableList<HelpQNA> helpQNA = ObservableList<HelpQNA>.of([
    HelpQNA(
        id: '1',
        category: 'Privacy',
        question: 'Is My Data Secure.',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),

    HelpQNA(
        id: '3',
        category: 'Backup',
        question: 'Is My Data Safe.',
        answer:
            'Yes, Your data has a backup. Lorem Ipsum dolor set amit delet.'),

    HelpQNA(
        id: '12',
        category: 'Profile',
        question: 'How to change my currency',
        answer: 'Step 1 - Click on the navigation bar and tap on Settings\n \n'
            'Step 2 - You will land on the Your Profile screen. \n \n'
            'Step 3 - On the settings section, click on the drop down beside \'Default Currency\' to choose your desired currency'),
    HelpQNA(
        id: '4',
        category: 'About',
        question: 'What is Tenzi Book',
        answer: 'Tenzi is a bookkeeping app that is designed for simple and easy use to track your cash flow and calculate your balance automatically.'),
    HelpQNA(
        id: '5',
        category: 'How to',
        question: 'How to add a new Book',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),
    HelpQNA(
        id: '6',
        category: 'How to',
        question: 'How to edit a Book',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),
    HelpQNA(
        id: '7',
        category: 'How to',
        question: 'How to delete a Book',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),
    HelpQNA(
        id: '8',
        category: 'How to',
        question: 'How to do a Cash In.',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),
    HelpQNA(
        id: '9',
        category: 'How to',
        question: 'How to do a Cash Out',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.'),
    HelpQNA(
        id: '10',
        category: 'How to',
        question: 'How to edit an existing Cash In or Cash out',
        answer: 'Yes. Lorem Ipsum dolor set amit delet.')
  ]);
}
