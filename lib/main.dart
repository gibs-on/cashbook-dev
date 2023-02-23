import 'dart:io';

import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/service_locator.dart';
import 'package:cashbook/ui/auth_screen/login_screen.dart';
import 'package:cashbook/ui/auth_screen/reset_password_screen.dart';
import 'package:cashbook/ui/auth_screen/validate_phone_screen.dart';
import 'package:cashbook/ui/home/no_book_screen.dart';
import 'package:cashbook/ui/home/pdf_view_screen.dart';
import 'package:cashbook/ui/profile/help_screen.dart';
import 'package:cashbook/ui/profile/question_details.dart';
import 'package:cashbook/ui/profile/user_profile_screen.dart';
import 'package:cashbook/ui/transaction_details/transaction_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'ui/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import './ui/theme/light_theme.dart';
import './ui/manage_transaction/manage_transaction.dart';
import './ui/manage_transaction/choose_category.dart';
import 'constants/function_response.dart';
import 'ui/auth_screen/change_password_screen.dart';
import 'ui/auth_screen/register_screen.dart';
import 'ui/auth_screen/verify_otp_screen.dart';

import 'package:logging/logging.dart';

import 'ui/home/barchart_screen.dart';
import 'ui/home/transaction_view_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  _setupLogging();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedPreferencesHelper sharedPreferencesHelper =
      getIt<SharedPreferencesHelper>();
  @override
  Future<void> didChangeDependencies() async {
    final SharedPreferencesHelper sharedPreferencesHelper =
        getIt<SharedPreferencesHelper>();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      // home: const ImageUploadScreen(),
      routes: {
        '/': (ctx) => FutureBuilder(
            future: sharedPreferencesHelper.tryAutoLogin(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                ));
              }
              if (snapshot.hasData) {
                final data = snapshot.data as FunctionResponse;
                print(data.message);
                if (data.success) {
                  return HomeScreen();
                } else {
                  if (data.data == 'OTP') {
                    return VerifyOTPScreen(
                      isChangePasswordOtp: false,
                    );
                  }
                  return ValidatePhoneScreen();
                }
              }
              return const CircularProgressIndicator();
            }),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        PdfViewScreen.routeName: (ctx) => PdfViewScreen(),
        ManageTransaction.routeName: (ctx) => ManageTransaction(),
        ChooseCategoryView.routeName: (ctx) => ChooseCategoryView(),
        TransactionDetailsScreen.routeName: (ctx) => TransactionDetailsScreen(),
        UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
        HelpScreen.routeName: (ctx) => const HelpScreen(),
        QuestionDetailScreen.routeName: (ctx) => const QuestionDetailScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        NoBookScreen.routeName: (ctx) => NoBookScreen(),
        ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
        ChangePasswordScreen.routeName: (ctx) => ChangePasswordScreen(),
        TrasactionViewScreen.routeName: (ctx) => TrasactionViewScreen(),
        ValidatePhoneScreen.routeName: (ctx) => ValidatePhoneScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => LoginScreen()),
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
