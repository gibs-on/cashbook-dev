import 'dart:io';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/image_upload_api_helper.dart';
import 'package:cashbook/stores/profile_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/profile/help_screen.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/image_helper.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_picker_dialog.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../service_locator.dart';
import 'package:share_plus/share_plus.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/user-profile-screen';


  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();


}

@override
class _UserProfileScreenState extends State<UserProfileScreen> {

  static const routeName = '/user-profile-screen';
  final ProfileStore _profileStore = getIt<ProfileStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final CustomImageHelper _customImageHelper = getIt<CustomImageHelper>();
  final ImageUploadHelper _imageUploadHelper = getIt<ImageUploadHelper>();

  final TextEditingController _nameController = TextEditingController();

  //mine
  final Country _selectedDialogCurrency = CountryPickerUtils.getCountryByCurrencyCode('KES');



  void sendEmailFeedback() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'tenzilabs@gmail.com',
      query: encodeQueryParameters(<String, String>{'subject': 'FeedBack '}),
    );

    launch(emailLaunchUri.toString());
  }

  Future<void> _uploadImage(BuildContext context) async {
    FunctionResponse _fResponse = FunctionResponse();
    try {
      _fResponse = await _customImageHelper.pickUserImage(context);

      if (_fResponse.success) {
        //Show Loader
        _customAlerts.showLoaderDialog(context);
        _fResponse =
        await _imageUploadHelper.uploadPicture(File(_fResponse.data));

        if (_fResponse.success) {
          print(_fResponse.data);
          _fResponse = await _profileStore.updateProfileImage(_fResponse.data);
        }
      }
    } catch (e) {
      _fResponse.message = 'Error Updating Image  : $e';
    }

    print(_fResponse.message);

    //Pop Loader
    Navigator.of(context).pop();

    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Your Profile')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FutureBuilder(
              future: _profileStore.getProfileInfo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  _nameController.text = _profileStore.name;
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          leading: Observer(builder: (_) {
                            return InkWell(
                              onTap: () async {
                                await _uploadImage(context);
                              },
                              child: _profileStore.image != ''
                                  ? CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                NetworkImage(_profileStore.image),
                                backgroundColor: Colors.transparent,
                              )
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                    'assets/images/default_user_image.png'),
                              ),
                            );
                          }),
                          title: Observer(builder: (_) {
                            return Text(_profileStore.name);
                          }),
                          subtitle: Text(_profileStore.phone),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Update Name'),
                                        const SizedBox(height: 10),
                                        TextField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            hintText: 'Full Name ',
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0),
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      20.0)),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      20.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Observer(builder: (_) {
                                          return ElevatedButton(
                                              onPressed: () async {
                                                //Show Loader
                                                _customAlerts
                                                    .showLoaderDialog(
                                                    context);
                                                FunctionResponse _response =
                                                await _profileStore
                                                    .updateProfileName(
                                                    _nameController
                                                        .text);
                                                //Pop Loader
                                                Navigator.of(context).pop();
                                                _customAlerts.showSnackBar(
                                                    _response.message,
                                                    context,
                                                    success:
                                                    _response.success);

                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Update'));
                                        }),
                                      ],
                                    ),
                                  ));
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      _settings(context),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }


  Widget _settings(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Settings',
            // textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.monetization_on),
                          const SizedBox(width: 10),
                          Text(
                            'Default Currency',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      // ListTile(),
                      TextButton(
                        onPressed: () {
                          // todo here is where we change the currency
                          // showCurrencyPicker(
                          //   context: context,
                          //   showFlag: true,
                          //   showCurrencyName: true,
                          //   showCurrencyCode: true,
                          //   onSelect: (Currency currency) async {
                          //     await _transactionStore
                          //         .changeSelectedCurrency(currency.code);
                          //   },
                          // );

                        },
                        child:CurrencyPickerDropdown(
                          initialValue: _transactionStore.selectedCurrency,
                          itemBuilder:_buildCurrencyDropdownItem,
                          onValuePicked: (Country? country) async {
                            await _transactionStore.changeSelectedCurrency(country?.currencyCode);
                          },
                        ),
                        // icon: const Icon(Icons.arrow_drop_down),
                        // label: Observer(builder: (_) {
                        //   return Text(_transactionStore.selectedCurrency);
                        // }),
                      ),

                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      HelpScreen.routeName,
                      arguments: _profileStore),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Icon(Icons.help),
                        const SizedBox(width: 10),
                        Text(
                          'Help (How to use)',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
                // const Divider(),
                // InkWell(
                //   onTap: () {
                //     Share.share('check out my website https://google.com',
                //         subject: 'Check out this amazing app!');
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(5.0),
                //     child: Row(
                //       children: [
                //         const Icon(Icons.group_add),
                //         const SizedBox(width: 10),
                //         Text(
                //           'Invite a friend',
                //           style: Theme.of(context).textTheme.headline5,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const Divider(),
                InkWell(
                  onTap: openwhatsapp,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        const Icon(Icons.feedback),
                        const SizedBox(width: 10),
                        Text(
                          'Feedback',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),

                // const Divider(),
                // InkWell(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.all(5.0),
                //     child: Row(
                //       children: [
                //         Icon(
                //           Icons.logout,
                //           color: Theme.of(context).errorColor,
                //         ),
                //         const SizedBox(width: 10),
                //         Text(
                //           'Logout',
                //           style:
                //               Theme.of(context).textTheme.headline5!.copyWith(
                //                     color: Theme.of(context).errorColor,
                //                   ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const Divider(),
                // InkWell(
                //   onTap: _openCurrencyPickerDialog,
                // ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ],
    );



  }

  Widget _buildCurrencyDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("${country.currencyCode}"),
      ],
    ),
  );

  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      // CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text("+${country.currencyCode}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name ?? ''))
    ],
  );


  // void _openCurrencyPickerDialog() => showDialog(
  //   context: context,
  //   builder: (context) => Theme(
  //       data: Theme.of(context).copyWith(primaryColor: Colors.pink),
  //       child: CurrencyPickerDialog(
  //           titlePadding: EdgeInsets.all(8.0),
  //           searchCursorColor: Colors.pinkAccent,
  //           searchInputDecoration: InputDecoration(hintText: 'Search...'),
  //           isSearchable: true,
  //           title: Text('Select your Currency'),
  //           onValuePicked: (Country country) =>
  //               setState(() => _selectedDialogCurrency = country),
  //           itemBuilder: _buildCurrencyDialogItem)),
  // );
  Widget _buildCurrencyDialogItem(Country country) => Row(
    children: <Widget>[
      Icon(Icons.ac_unit),
      const Text("Default Currency"),

      const SizedBox(width: 70.0),
      // const Expanded(child: Text("")),
      // CountryPickerUtils.getDefaultFlagImage(country),
      Text("\t${country.currencyCode}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name ?? ''))
    ],
  );


  void _openCountryPickerDialog() => showDialog(
    context: context,
    builder: (BuildContext context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.blue),
        child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                _transactionStore
                    .changeSelectedCurrency(country.isoCode),
            itemBuilder: _buildDialogItem)),

  );

  // void _openCurrencyPickerDialog() => showDialog(
  //   context: context,
  //   builder: (context) => Theme(
  //       data: Theme.of(context).copyWith(primaryColor: Colors.pink),
  //       child: CurrencyPickerDialog(
  //           titlePadding: EdgeInsets.all(8.0),
  //           searchCursorColor: Colors.pinkAccent,
  //           searchInputDecoration: InputDecoration(hintText: 'Search...'),
  //           isSearchable: true,
  //           itemBuilder: _buildCurrencyDialogItem,
  //           onValuePicked: (Country country) async {
  //             await _transactionStore
  //           .changeSelectedCurrency(country.currencyCode);
  //         ))
  // )
  // void _openCurrencyPickerDialog() {

    // CurrencyPickerDialog(
    //     titlePadding: EdgeInsets.all(8.0),
    //     searchCursorColor: Colors.pinkAccent,
    //     searchInputDecoration: InputDecoration(hintText: 'Search...'),
    //     isSearchable: true,
    //     title: Text('Select your Currency'),
    //     onValuePicked: (Country country) =>
    //         setState(() => _selectedDialogCurrency = country),
    //     itemBuilder: _buildCurrencyDialogItem)),

  openwhatsapp() async{
    var whatsapp ="+254769007416";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }


}
