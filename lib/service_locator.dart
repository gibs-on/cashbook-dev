import 'package:cashbook/api_utils/api_provider.dart';
import 'package:cashbook/api_utils/api_settings.dart';
import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/helpers/api_helpers/profile_api_helper.dart';
import 'package:cashbook/helpers/api_helpers/remarks_api_helper.dart';

import 'package:cashbook/helpers/shared_preferences_helper.dart';
import 'package:cashbook/local_module.dart';
import 'package:cashbook/stores/auth_store.dart';
import 'package:cashbook/stores/book_store.dart';
import 'package:cashbook/stores/cash_category_store.dart';
import 'package:cashbook/stores/home_screen_store.dart';
import 'package:cashbook/stores/payment_mode_store.dart';
import 'package:cashbook/stores/pdf_screen_store.dart';
import 'package:cashbook/stores/profile_store.dart';
import 'package:cashbook/stores/remarks_store.dart';
import 'package:cashbook/utils/connectivity_helper.dart';
import 'package:cashbook/utils/custom_alerts.dart';
import 'package:cashbook/utils/validator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './stores/transaction_store.dart';

import 'helpers/api_helpers/api_helper.dart';
import 'helpers/api_helpers/auth_api_helper.dart';
import 'helpers/api_helpers/books_api_helper.dart';
import 'helpers/api_helpers/cash_category_api_helper.dart';
import 'helpers/api_helpers/image_upload_api_helper.dart';
import 'helpers/api_helpers/payment_mode_api_helper.dart';
import 'helpers/api_helpers/transactions_api_helper.dart';
import 'helpers/db_helper.dart';
import 'stores/reporting_store.dart';
import 'utils/image_helper.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerFactory(() => ImageUploadHelper());
  getIt.registerFactory(() => FunctionResponse());

  getIt.registerSingletonAsync<SharedPreferences>(
    () => LocalModule.provideSharedPreferences(),
  );

  getIt.registerSingleton(
    SharedPreferencesHelper(
      await getIt.getAsync<SharedPreferences>(),
    ),
  );

  getIt.registerSingleton(DbHelper());

  getIt.registerSingleton(
    AuthApiHelper(
      getIt<SharedPreferencesHelper>(),
    ),
  );
  getIt.registerSingleton(
    RemarksApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );
  getIt.registerSingleton(
    PaymentModeApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );

  getIt.registerSingleton(
    TransactionsApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
      getIt<ImageUploadHelper>(),
    ),
  );

  getIt.registerSingleton(
    BooksApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );

  getIt.registerSingleton(RemarksStore(
    getIt<DbHelper>(),
  ));
  getIt.registerSingleton(
    TransactionStore(
      getIt<DbHelper>(),
      getIt<TransactionsApiHelper>(),
      getIt<RemarksStore>(),
    ),
  );
  getIt.registerSingleton(ReportingStore());
  getIt.registerSingleton(
    PaymentModeStore(
      getIt<DbHelper>(),
      getIt<PaymentModeApiHelper>(),
    ),
  );

  getIt.registerSingleton(
    CashCategoryApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );

  getIt.registerSingleton(
    CashCategoryStore(
      getIt<DbHelper>(),
      getIt<CashCategoryApiHelper>(),
      getIt<TransactionStore>(),
    ),
  );

  getIt.registerSingleton(
    BookStore(
      getIt<DbHelper>(),
      getIt<BooksApiHelper>(),
      getIt<TransactionsApiHelper>(),
      getIt<TransactionStore>(),
      getIt<PaymentModeStore>(),
      getIt<CashCategoryStore>(),
      getIt<SharedPreferencesHelper>(),
    ),
  );

  getIt.registerSingleton(
    ApiHelper(
      getIt<BooksApiHelper>(),
      getIt<TransactionsApiHelper>(),
      getIt<CashCategoryApiHelper>(),
      getIt<PaymentModeApiHelper>(),
      getIt<RemarksApiHelper>(),
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );

  getIt.registerSingleton(
    HomeScreenStore(
      getIt<BookStore>(),
      getIt<SharedPreferencesHelper>(),
      getIt<TransactionStore>(),
      getIt<CashCategoryStore>(),
      getIt<ReportingStore>(),
      getIt<DbHelper>(),
      getIt<ApiHelper>(),
      getIt<PaymentModeStore>(),
    ),
  );

  getIt.registerSingleton(
    ProfileApiHelper(
      getIt<AuthApiHelper>(),
      getIt<DbHelper>(),
    ),
  );

  getIt.registerSingleton(
    ProfileStore(
      getIt<ProfileApiHelper>(),
    ),
  );

  getIt.registerSingleton(
    AuthStore(
      getIt<HomeScreenStore>(),
      getIt<BookStore>(),
      getIt<AuthApiHelper>(),
      getIt<SharedPreferencesHelper>(),
    ),
  );
  getIt.registerSingleton(PdfScreenStore());

  //API Helpers

  //Custom Utilities
  getIt.registerFactory(() => CustomAlerts());
  getIt.registerFactory(() => CustomValidator());
  getIt.registerFactory(() => CustomImageHelper());
  getIt.registerFactory(() => ConnectivityHelper());

  getIt.registerFactory(() => ApiSettings());

  getIt.registerSingleton(
    ApiProvider(
      apiSettings: getIt<ApiSettings>(),
      accessToken: await getIt<SharedPreferencesHelper>().getToken(),
      // accessToken: getIt<SharedPreferences>().getString('accessToken') ?? '',
    ),
  );
}
