import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/transaction_store.dart';
import 'package:cashbook/ui/auth_screen/login_screen.dart';
import 'package:cashbook/ui/auth_screen/validate_phone_screen.dart';
import 'package:cashbook/ui/profile/user_profile_screen.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../service_locator.dart';

class CustomDrawer extends StatelessWidget {
//Stores
  final HomeScreenStore _homeScreenStore = getIt<HomeScreenStore>();
  final BookStore _bookStore = getIt<BookStore>();
  final TransactionStore _transactionStore = getIt<TransactionStore>();

  //Storage Helpers
  final SharedPreferencesHelper _sharedPreferencesHelper =
      getIt<SharedPreferencesHelper>();
//Utilities
  final CustomAlerts _customAlerts = getIt<CustomAlerts>();
  final ConnectivityHelper _connectivityHelper = getIt<ConnectivityHelper>();

  CustomDrawer({
    Key? key,
  }) : super(key: key);

  Future<void> _userLogout(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    _customAlerts.showLoaderDialog(context);

    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      _fResponse = await _homeScreenStore.userLogout();
      if (_fResponse.success) {
        _fResponse.message = 'Logout successful';

        //popLoader
        Navigator.of(context).pop();
        _customAlerts.showSnackBar(_fResponse.message, context,
            success: _fResponse.success);
        Navigator.of(context)
            .pushReplacementNamed(ValidatePhoneScreen.routeName);
      }
    } else {
      //popLoader
      Navigator.of(context).pop();
      //popDrawer
      Navigator.of(context).pop();

      _customAlerts.showSnackBar(_fResponse.message, context,
          success: _fResponse.success);
    }
  }

  Future<void> _backupData(BuildContext context) async {
    FunctionResponse _fResponse = getIt<FunctionResponse>();
    String syncDate = 'No record';

    _customAlerts.showLoaderDialog(context);

    _fResponse = await _connectivityHelper.checkInternetConnection();
    if (_fResponse.success) {
      _fResponse = await _sharedPreferencesHelper.getLastSync();
      if (_fResponse.success) {
        syncDate = _fResponse.data;
      }
      _fResponse = await _customAlerts.confirmAction(
        context: context,
        title: 'Backup Confirmation',
        message: 'Last Sync Date : $syncDate',
      );
      print(_fResponse.message);
      if (_fResponse.success) {
        await _homeScreenStore.uploadAllData();
        _transactionStore.clearTransactions();
        _bookStore.downloadedBookList.clear();
        //set sync date
        await _sharedPreferencesHelper
            .setLastSync(DateFormat('h:mm a d MMM y').format(DateTime.now()));

        await _transactionStore.fetchAndSetTransactions();
        _fResponse.success = true;
        _fResponse.message = 'Data Backup successful';
      }
    }
    //pop loader
    Navigator.of(context).pop();
    //popDrawer
    Navigator.of(context).pop();

    _customAlerts.showSnackBar(_fResponse.message, context,
        success: _fResponse.success);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Center(
                  child: Image.asset(
                'assets/images/tenziBook_splash_image.png',
                fit: BoxFit.contain,
              )),
              // color: Theme.of(context).primaryColor,
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(UserProfileScreen.routeName),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  // contentPadding:
                  //     EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  leading: const Icon(Icons.manage_accounts),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Share.share(
                    'Try TenziBook to manage your cash flow. https://play.google.com/store/apps/details?id=com.tenzilabs.tenzibook',
                    subject: 'Check out this amazing app!');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  // contentPadding:
                  //     EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  leading: const Icon(Icons.group_add),
                  title: Text(
                    'Invite a friend',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return InkWell(
                onTap: () async {
                  await _backupData(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                    leading: const Icon(Icons.upload),
                    title: Text(
                      'Backup Data',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              );
            }),
            InkWell(
              onTap: () async {
                await _userLogout(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  // contentPadding:
                  //     EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                  leading: const Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
            // const SizedBox.expand(),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text('Version 1.0.3'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
