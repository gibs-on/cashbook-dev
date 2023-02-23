import 'package:cashbook/generated_api_code/api_client.enums.swagger.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'api_client.enums.swagger.dart' as enums;
export 'api_client.enums.swagger.dart';

part 'api_client.swagger.chopper.dart';
part 'api_client.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiClient extends ChopperService {
  static ApiClient create([ChopperClient? client]) {
    if (client != null) {
      return _$ApiClient(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiClient()],
        converter: $JsonSerializableConverter(),
        baseUrl: 'https://');
    return _$ApiClient(newClient);
  }

  ///
  ///@param businessId
  @Get(path: '/api/Account/GetProfile/{businessId}')
  Future<chopper.Response<CustomerDTOView>> apiAccountGetProfileBusinessIdGet(
      {@Path('businessId') required String? businessId});

  ///
  @Get(path: '/api/Account/GetBusinessType')
  Future<chopper.Response> apiAccountGetBusinessTypeGet();

  ///
  ///@param businessId
  @Post(path: '/api/Account/UpdateBusinessProfile/{businessId}')
  Future<chopper.Response<Response$>>
      apiAccountUpdateBusinessProfileBusinessIdPost(
          {@Path('businessId') required String? businessId,
          @Body() required CustomerDTOEdit? body});

  ///
  ///@param userId
  @Post(path: '/api/Account/ResendOTP/{userId}', optionalBody: true)
  Future<chopper.Response> apiAccountResendOTPUserIdPost(
      {@Path('userId') required String? userId});

  ///
  @Post(path: '/api/Account/ValidateOTP')
  Future<chopper.Response> apiAccountValidateOTPPost(
      {@Body() required OTPValidation? body});

  ///
  ///@param businessId
  @Delete(path: '/api/Auth/deleteBusiness/{businessId}')
  Future<chopper.Response> apiAuthDeleteBusinessBusinessIdDelete(
      {@Path('businessId') required String? businessId});

  ///
  @Post(path: '/api/Auth/ValidatePhone')
  Future<chopper.Response> apiAuthValidatePhonePost(
      {@Body() required ValidateDetails? body});

  ///
  @Post(path: '/api/Auth/register')
  Future<chopper.Response> apiAuthRegisterPost(
      {@Body() required TenzibookRegisterDTO? body});

  ///
  @Post(path: '/api/Auth/changePassword')
  Future<chopper.Response<CustomerDTOView>> apiAuthChangePasswordPost(
      {@Body() required ChangePassword? body});

  ///
  @Post(path: '/api/Auth/verifyChangepasswordOTP')
  Future<chopper.Response<Response$>> apiAuthVerifyChangepasswordOTPPost(
      {@Body() required VerifyChangepasswordOTP? body});

  ///
  @Post(path: '/api/Auth/ResetPassword')
  Future<chopper.Response> apiAuthResetPasswordPost(
      {@Body() required ResetPassword? body});

  ///
  @Post(path: '/api/Auth/login')
  Future<chopper.Response> apiAuthLoginPost(
      {@Body() required TenziBookLogin? body});

  ///
  ///@param businessId
  ///@param bookId
  @Patch(path: '/api/CashBook/UpdateCashbookTransaction/{businessId}/{bookId}')
  Future<chopper.Response>
      apiCashBookUpdateCashbookTransactionBusinessIdBookIdPatch(
          {@Path('businessId') required String? businessId,
          @Path('bookId') required String? bookId,
          @Body() required LedgerBookDTOEdit? body});

  ///
  ///@param businessId
  ///@param transactionId
  @Get(
      path:
          '/api/CashBook/GetCashbookSingleTransaction/{businessId}/{transactionId}')
  Future<chopper.Response>
      apiCashBookGetCashbookSingleTransactionBusinessIdTransactionIdGet(
          {@Path('businessId') required String? businessId,
          @Path('transactionId') required String? transactionId});

  ///
  ///@param businessId
  ///@param bookId
  @Get(path: '/api/CashBook/GetCashbookTransactions/{businessId}/{bookId}')
  Future<chopper.Response>
      apiCashBookGetCashbookTransactionsBusinessIdBookIdGet(
          {@Path('businessId') required String? businessId,
          @Path('bookId') required String? bookId});

  ///
  ///@param businessid
  ///@param bookid
  @Post(path: '/api/CashBook/GetCashbookBalances/{businessid}/{bookid}')
  Future<chopper.Response> apiCashBookGetCashbookBalancesBusinessidBookidPost(
      {@Path('businessid') required String? businessid,
      @Path('bookid') required String? bookid,
      @Body() required FilterBy? body});

  ///
  ///@param businessid
  @Get(path: '/api/CashBook/GetLastTimeBackup/{businessid}')
  Future<chopper.Response> apiCashBookGetLastTimeBackupBusinessidGet(
      {@Path('businessid') required String? businessid});

  ///
  @Post(path: '/api/CashBook/addlastbackupdate')
  Future<chopper.Response> apiCashBookAddlastbackupdatePost(
      {@Body() required LastBackupDTOAdd? body});

  ///
  ///@param businessid
  ///@param bookId
  @Post(path: '/api/CashBook/AddCashbookTransaction/{businessid}/{bookId}')
  Future<chopper.Response>
      apiCashBookAddCashbookTransactionBusinessidBookIdPost(
          {@Path('businessid') required String? businessid,
          @Path('bookId') required String? bookId,
          @Body() required List<LedgerBookDTO>? body});

  ///
  ///@param businessid
  ///@param bookId
  @Delete(path: '/api/CashBook/DeleteCashbookTransaction/{businessid}/{bookId}')
  Future<chopper.Response>
      apiCashBookDeleteCashbookTransactionBusinessidBookIdDelete(
          {@Path('businessid') required String? businessid,
          @Path('bookId') required String? bookId,
          @Body() required List<LedgerBookDTODelete>? body});

  ///
  ///@param businessid
  @Post(path: '/api/CashBook/CreateNewbook/{businessid}')
  Future<chopper.Response> apiCashBookCreateNewbookBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Body() required BookDTO? body});

  ///
  ///@param businessid
  @Get(path: '/api/CashBook/GetPaymentmodes/{businessid}')
  Future<chopper.Response> apiCashBookGetPaymentmodesBusinessidGet(
      {@Path('businessid') required String? businessid});

  ///
  @Post(path: '/api/CashBook/AddPaymentMode')
  Future<chopper.Response> apiCashBookAddPaymentModePost(
      {@Body() required PaymentmodeAdd? body});

  ///
  @Get(path: '/api/CashBook')
  Future<chopper.Response> apiCashBookGet(
      {@Body() required PaymentmodeAdd? body});

  ///
  @Post(path: '/api/CashBook/GetCashbookRemarks')
  Future<chopper.Response> apiCashBookGetCashbookRemarksPost(
      {@Body() required CashbookRemarksQuery? body});

  ///
  ///@param businessId
  @Post(path: '/api/CashBook/AddCashbookRemarks/{businessId}')
  Future<chopper.Response> apiCashBookAddCashbookRemarksBusinessIdPost(
      {@Path('businessId') required String? businessId,
      @Body() required CashbookRemarksDTO? body});

  ///
  ///@param businessId
  ///@param remarkId
  ///@param bookId
  @Delete(
      path:
          '/api/CashBook/DeleteCashbookRemarks/{businessId}/{remarkId}/{bookId}')
  Future<chopper.Response>
      apiCashBookDeleteCashbookRemarksBusinessIdRemarkIdBookIdDelete(
          {@Path('businessId') required String? businessId,
          @Path('remarkId') required String? remarkId,
          @Path('bookId') required int? bookId});

  ///
  ///@param paymentmodeId
  ///@param businessId
  @Delete(path: '/api/CashBook/DeletePaymentMode/{businessId}/{paymentmodeId}')
  Future<chopper.Response>
      apiCashBookDeletePaymentModeBusinessIdPaymentmodeIdDelete(
          {@Path('paymentmodeId') required int? paymentmodeId,
          @Path('businessId') required String? businessId});

  ///
  @Patch(path: '/api/CashBook/UpdatePaymentMode')
  Future<chopper.Response> apiCashBookUpdatePaymentModePatch(
      {@Body() required PaymentmodeEdit? body});

  ///
  ///@param businessId
  @Post(path: '/api/CashBook/CreateCashbookCategory/{businessId}')
  Future<chopper.Response> apiCashBookCreateCashbookCategoryBusinessIdPost(
      {@Path('businessId') required String? businessId,
      @Body() required CashbookCategorisDTOAdd? body});

  ///
  ///@param businessId
  @Patch(path: '/api/CashBook/UpdateCashbookcategories/{businessId}')
  Future<chopper.Response> apiCashBookUpdateCashbookcategoriesBusinessIdPatch(
      {@Path('businessId') required String? businessId,
      @Body() required CashbookCategorisDTOEdit? body});

  ///
  ///@param categoryId
  ///@param businessId
  @Delete(
      path: '/api/CashBook/DeleteCashbookcategories/{businessId}/{categoryId}')
  Future<chopper.Response>
      apiCashBookDeleteCashbookcategoriesBusinessIdCategoryIdDelete(
          {@Path('categoryId') required int? categoryId,
          @Path('businessId') required String? businessId});

  ///
  @Post(path: '/api/CashBook/GetCashbookcategories')
  Future<chopper.Response> apiCashBookGetCashbookcategoriesPost(
      {@Body() required CashbookCategoriesfilters? body});

  ///
  ///@param businessId
  @Get(path: '/api/CashBook/Getbooks/{businessId}')
  Future<chopper.Response> apiCashBookGetbooksBusinessIdGet(
      {@Path('businessId') required String? businessId});

  ///
  ///@param businessId
  @Patch(path: '/api/CashBook/EditBook/{businessId}')
  Future<chopper.Response> apiCashBookEditBookBusinessIdPatch(
      {@Path('businessId') required String? businessId,
      @Body() required BookDTOEdit? body});

  ///
  ///@param businessId
  ///@param bookId
  @Delete(path: '/api/CashBook/DeleteBook/{businessId}/{bookId}')
  Future<chopper.Response> apiCashBookDeleteBookBusinessIdBookIdDelete(
      {@Path('businessId') required String? businessId,
      @Path('bookId') required String? bookId});

  ///
  ///@param businessid
  @Post(path: '/api/Customers/addcustomer/{businessid}')
  Future<chopper.Response<Response$>> apiCustomersAddcustomerBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Body() required CustomerClientDTOAdd? body});

  ///
  ///@param businessid
  ///@param customerid
  @Delete(path: '/api/Customers/DeleteCustomer/{businessid}/{customerid}')
  Future<chopper.Response<Response$>>
      apiCustomersDeleteCustomerBusinessidCustomeridDelete(
          {@Path('businessid') required String? businessid,
          @Path('customerid') required String? customerid});

  ///
  ///@param businessid
  ///@param customerid
  @Post(path: '/api/Customers/Editcustomer/{businessid}/{customerid}')
  Future<chopper.Response<Response$>>
      apiCustomersEditcustomerBusinessidCustomeridPost(
          {@Path('businessid') required String? businessid,
          @Path('customerid') required String? customerid,
          @Body() required CustomerClientEditDTO? body});

  ///
  ///@param businessid
  ///@param order
  @Post(path: '/api/Customers/GetCustomer/{businessid}')
  Future<chopper.Response<CustomerDTO>> apiCustomersGetCustomerBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Query('order') OrderCriteria? order,
      @Body() required GetCustomerClientBy? body});

  ///
  ///@param businessid
  ///@param order
  @Get(path: '/api/Customers/GetCustomersList/{businessid}')
  Future<chopper.Response<CustomerDTO>>
      apiCustomersGetCustomersListBusinessidGet(
          {@Path('businessid') required String? businessid,
          @Query('order') OrderCriteria? order});

  ///
  ///@param businessId
  @Get(path: '/api/Dashboard/GetTotalsBalanceCustomers/{businessId}')
  Future<chopper.Response> apiDashboardGetTotalsBalanceCustomersBusinessIdGet(
      {@Path('businessId') required String? businessId});

  ///
  ///@param businessid
  @Get(path: '/GetServices/{businessid}')
  Future<chopper.Response<List<ProductViewDTO>>> getServicesBusinessidGet(
      {@Path('businessid') required String? businessid});

  ///
  ///@param businessid
  @Get(path: '/GetProducts/{businessid}')
  Future<chopper.Response<List<ProductViewDTO>>> getProductsBusinessidGet(
      {@Path('businessid') required String? businessid});

  ///
  ///@param businessId
  ///@param productId
  @Get(path: '/GetProduct/{businessId}/{productId}')
  Future<chopper.Response> getProductBusinessIdProductIdGet(
      {@Path('businessId') required String? businessId,
      @Path('productId') required String? productId});

  ///
  ///@param businessId
  ///@param productId
  @Get(path: '/GetProductActivity/{businessId}/{productId}')
  Future<chopper.Response> getProductActivityBusinessIdProductIdGet(
      {@Path('businessId') required String? businessId,
      @Path('productId') required String? productId});

  ///
  ///@param businessId
  ///@param productId
  @Post(path: '/UpdateStock/{businessId}/{productId}')
  Future<chopper.Response> updateStockBusinessIdProductIdPost(
      {@Path('businessId') required String? businessId,
      @Path('productId') required String? productId,
      @Body() required AdustProducts? body});

  ///
  ///@param businessId
  ///@param productId
  @Get(path: '/DuplicateProduct/{businessId}/{productId}')
  Future<chopper.Response> duplicateProductBusinessIdProductIdGet(
      {@Path('businessId') required String? businessId,
      @Path('productId') required String? productId});

  ///
  ///@param businessid
  ///@param productid
  @Post(path: '/editProduct/{businessid}/{productid}')
  Future<chopper.Response> editProductBusinessidProductidPost(
      {@Path('businessid') required String? businessid,
      @Path('productid') required String? productid,
      @Body() required ProductEditDTO? body});

  ///
  ///@param businessid
  ///@param productid
  @Delete(path: '/deleteProduct/{businessid}/{productid}')
  Future<chopper.Response> deleteProductBusinessidProductidDelete(
      {@Path('businessid') required String? businessid,
      @Path('productid') required String? productid});

  ///
  ///@param businessId
  @Post(path: '/AddProducts/{businessId}')
  Future<chopper.Response> addProductsBusinessIdPost(
      {@Path('businessId') required String? businessId,
      @Body() required ProductDTOAdd? body});

  ///
  ///@param businessId
  ///@param categoryId
  @Delete(path: '/DeleteCategory/{businessId}/{categoryId}')
  Future<chopper.Response> deleteCategoryBusinessIdCategoryIdDelete(
      {@Path('businessId') required String? businessId,
      @Path('categoryId') required String? categoryId});

  ///
  ///@param businessId
  @Get(path: '/GetCategories/{businessId}')
  Future<chopper.Response> getCategoriesBusinessIdGet(
      {@Path('businessId') required String? businessId});

  ///
  ///@param businessId
  @Post(path: '/EditCategories/{businessId}')
  Future<chopper.Response> editCategoriesBusinessIdPost(
      {@Path('businessId') required String? businessId,
      @Body() required CategoryEditDTO? body});

  ///
  ///@param businessId
  @Post(path: '/AddCategories/{businessId}')
  Future<chopper.Response> addCategoriesBusinessIdPost(
      {@Path('businessId') required String? businessId,
      @Body() required CategoryDTO? body});

  ///
  ///@param businessid
  @Post(path: '/api/Supplier/addSupplier/{businessid}')
  Future<chopper.Response<Response$>> apiSupplierAddSupplierBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Body() required CustomerSupplierDTOADD? body});

  ///
  ///@param supplierid
  ///@param businessid
  @Get(path: '/api/Supplier/GetSupplier/{supplierid}/{businessid}')
  Future<chopper.Response<CustomerSupplierDTO>>
      apiSupplierGetSupplierSupplieridBusinessidGet(
          {@Path('supplierid') required String? supplierid,
          @Path('businessid') required String? businessid});

  ///
  ///@param supplierid
  ///@param businessid
  @Delete(path: '/api/Supplier/DeleteSupplier/{supplierid}/{businessid}')
  Future<chopper.Response<Response$>>
      apiSupplierDeleteSupplierSupplieridBusinessidDelete(
          {@Path('supplierid') required String? supplierid,
          @Path('businessid') required String? businessid});

  ///
  ///@param supplierid
  ///@param businessid
  @Post(path: '/api/Supplier/EditSupplier/{supplierid}/{businessid}')
  Future<chopper.Response<Response$>>
      apiSupplierEditSupplierSupplieridBusinessidPost(
          {@Path('supplierid') required String? supplierid,
          @Path('businessid') required String? businessid,
          @Body() required CustomerSupplierDTOEdit? body});

  ///
  ///@param businessid
  @Get(path: '/api/Supplier/GetSuppliers/{businessid}')
  Future<chopper.Response<CustomerSupplierDTOView>>
      apiSupplierGetSuppliersBusinessidGet(
          {@Path('businessid') required String? businessid});

  ///
  ///@param businessid
  @Post(path: '/api/SupplierTransactions/PostExistingPaymentEntry/{businessid}')
  Future<chopper.Response<Response$>>
      apiSupplierTransactionsPostExistingPaymentEntryBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required SupplierPaymentsDTO? body});

  ///
  ///@param businessid
  @Post(path: '/api/SupplierTransactions/EditDueDate/{businessid}')
  Future<chopper.Response<Response$>>
      apiSupplierTransactionsEditDueDateBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required EditDueDate? body});

  ///
  ///@param transactionId
  ///@param businessid
  @Get(
      path:
          '/api/SupplierTransactions/GetTransactionProducts/{transactionId}/{businessid}')
  Future<chopper.Response<SaleProductsDTO>>
      apiSupplierTransactionsGetTransactionProductsTransactionIdBusinessidGet(
          {@Path('transactionId') required String? transactionId,
          @Path('businessid') required String? businessid});

  ///
  ///@param businessid
  @Post(path: '/api/SupplierTransactions/GetTransactionDetails/{businessid}')
  Future<chopper.Response<CustomerCreditAccountsDTO>>
      apiSupplierTransactionsGetTransactionDetailsBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required Transaction? body});

  ///
  ///@param businessId
  @Post(path: '/api/SupplierTransactions/AddSupplierTransactions/{businessId}')
  Future<chopper.Response>
      apiSupplierTransactionsAddSupplierTransactionsBusinessIdPost(
          {@Path('businessId') required String? businessId,
          @Body() required SupplierTransactionsDTOADD? body});

  ///
  ///@param businessId
  @Get(
      path: '/api/SupplierTransactions/GetSupplierAllTransactions/{businessId}')
  Future<chopper.Response>
      apiSupplierTransactionsGetSupplierAllTransactionsBusinessIdGet(
          {@Path('businessId') required String? businessId});

  ///
  ///@param businessId
  ///@param supplierId
  @Get(
      path:
          '/api/SupplierTransactions/GetSupplierTransactions/{businessId}/{supplierId}')
  Future<chopper.Response>
      apiSupplierTransactionsGetSupplierTransactionsBusinessIdSupplierIdGet(
          {@Path('businessId') required String? businessId,
          @Path('supplierId') required String? supplierId});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/PostExistingPaymentEntry/{businessid}')
  Future<chopper.Response<Response$>>
      apiTransactionsPostExistingPaymentEntryBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required CustomerPaymentsDTOADD? body});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/EditDueDate/{businessid}')
  Future<chopper.Response<Response$>> apiTransactionsEditDueDateBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Body() required EditDueDate? body});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/addNewentry/{businessid}')
  Future<chopper.Response<Response$>> apiTransactionsAddNewentryBusinessidPost(
      {@Path('businessid') required String? businessid,
      @Body() required CustomerCreditAccountsDTOAdd? body});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/GetCustomerPayments/{businessid}')
  Future<chopper.Response<CustomerCreditAccountsDTO>>
      apiTransactionsGetCustomerPaymentsBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required Customer? body});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/GetTransactionDetails/{businessid}')
  Future<chopper.Response<CustomerCreditAccountsDTO>>
      apiTransactionsGetTransactionDetailsBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required Transaction? body});

  ///
  ///@param businessid
  @Post(path: '/api/Transactions/GetPaymentList/{businessid}')
  Future<chopper.Response<CustomerCreditAccountsListDTO>>
      apiTransactionsGetPaymentListBusinessidPost(
          {@Path('businessid') required String? businessid,
          @Body() required Customer? body});

  ///
  ///@param transactionId
  ///@param businessid
  @Get(
      path:
          '/api/Transactions/GetTransactionProducts/{transactionId}/{businessid}')
  Future<chopper.Response<SaleProductsDTO>>
      apiTransactionsGetTransactionProductsTransactionIdBusinessidGet(
          {@Path('transactionId') required String? transactionId,
          @Path('businessid') required String? businessid});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ApiClientJsonDecoderMappings = {
  AddressDetails: AddressDetails.fromJsonFactory,
  AdustProducts: AdustProducts.fromJsonFactory,
  BankDetails: BankDetails.fromJsonFactory,
  BookDTO: BookDTO.fromJsonFactory,
  BookDTOEdit: BookDTOEdit.fromJsonFactory,
  CashbookCategoriesfilters: CashbookCategoriesfilters.fromJsonFactory,
  CashbookCategorisDTOAdd: CashbookCategorisDTOAdd.fromJsonFactory,
  CashbookCategorisDTOEdit: CashbookCategorisDTOEdit.fromJsonFactory,
  CashbookRemarksDTO: CashbookRemarksDTO.fromJsonFactory,
  CashbookRemarksQuery: CashbookRemarksQuery.fromJsonFactory,
  CategoryDTO: CategoryDTO.fromJsonFactory,
  CategoryEditDTO: CategoryEditDTO.fromJsonFactory,
  ChangePassword: ChangePassword.fromJsonFactory,
  Customer: Customer.fromJsonFactory,
  CustomerClientDTOAdd: CustomerClientDTOAdd.fromJsonFactory,
  CustomerClientEditDTO: CustomerClientEditDTO.fromJsonFactory,
  CustomerCreditAccountsDTO: CustomerCreditAccountsDTO.fromJsonFactory,
  CustomerCreditAccountsDTOAdd: CustomerCreditAccountsDTOAdd.fromJsonFactory,
  CustomerCreditAccountsListDTO: CustomerCreditAccountsListDTO.fromJsonFactory,
  CustomerCreditAccountsView: CustomerCreditAccountsView.fromJsonFactory,
  CustomerDTO: CustomerDTO.fromJsonFactory,
  CustomerDTOEdit: CustomerDTOEdit.fromJsonFactory,
  CustomerDTOView: CustomerDTOView.fromJsonFactory,
  CustomerPaymentsDTOADD: CustomerPaymentsDTOADD.fromJsonFactory,
  CustomerSupplierDTO: CustomerSupplierDTO.fromJsonFactory,
  CustomerSupplierDTOADD: CustomerSupplierDTOADD.fromJsonFactory,
  CustomerSupplierDTOEdit: CustomerSupplierDTOEdit.fromJsonFactory,
  CustomerSupplierDTOView: CustomerSupplierDTOView.fromJsonFactory,
  EditDueDate: EditDueDate.fromJsonFactory,
  FilterBy: FilterBy.fromJsonFactory,
  GetCustomerClientBy: GetCustomerClientBy.fromJsonFactory,
  LastBackupDTOAdd: LastBackupDTOAdd.fromJsonFactory,
  LedgerBookDTO: LedgerBookDTO.fromJsonFactory,
  LedgerBookDTODelete: LedgerBookDTODelete.fromJsonFactory,
  LedgerBookDTOEdit: LedgerBookDTOEdit.fromJsonFactory,
  OTPValidation: OTPValidation.fromJsonFactory,
  PaymentmodeAdd: PaymentmodeAdd.fromJsonFactory,
  PaymentmodeEdit: PaymentmodeEdit.fromJsonFactory,
  ProductDTOAdd: ProductDTOAdd.fromJsonFactory,
  ProductEditDTO: ProductEditDTO.fromJsonFactory,
  ProductViewDTO: ProductViewDTO.fromJsonFactory,
  ResetPassword: ResetPassword.fromJsonFactory,
  Response$: Response$.fromJsonFactory,
  SaleProductsDTO: SaleProductsDTO.fromJsonFactory,
  SupplierPaymentsDTO: SupplierPaymentsDTO.fromJsonFactory,
  SupplierTransactionsDTOADD: SupplierTransactionsDTOADD.fromJsonFactory,
  TenziBookLogin: TenziBookLogin.fromJsonFactory,
  TenzibookRegisterDTO: TenzibookRegisterDTO.fromJsonFactory,
  Transaction: Transaction.fromJsonFactory,
  ValidateDetails: ValidateDetails.fromJsonFactory,
  VerifyChangepasswordOTP: VerifyChangepasswordOTP.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class AddressDetails {
  AddressDetails({
    this.county,
    this.district,
    this.pinCode,
    this.location,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  @JsonKey(name: 'county', includeIfNull: false)
  final String? county;
  @JsonKey(name: 'district', includeIfNull: false)
  final String? district;
  @JsonKey(name: 'pinCode', includeIfNull: false)
  final String? pinCode;
  @JsonKey(name: 'location', includeIfNull: false)
  final String? location;
  static const fromJsonFactory = _$AddressDetailsFromJson;
  static const toJsonFactory = _$AddressDetailsToJson;
  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddressDetails &&
            (identical(other.county, county) ||
                const DeepCollectionEquality().equals(other.county, county)) &&
            (identical(other.district, district) ||
                const DeepCollectionEquality()
                    .equals(other.district, district)) &&
            (identical(other.pinCode, pinCode) ||
                const DeepCollectionEquality()
                    .equals(other.pinCode, pinCode)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(county) ^
      const DeepCollectionEquality().hash(district) ^
      const DeepCollectionEquality().hash(pinCode) ^
      const DeepCollectionEquality().hash(location) ^
      runtimeType.hashCode;
}

extension $AddressDetailsExtension on AddressDetails {
  AddressDetails copyWith(
      {String? county, String? district, String? pinCode, String? location}) {
    return AddressDetails(
        county: county ?? this.county,
        district: district ?? this.district,
        pinCode: pinCode ?? this.pinCode,
        location: location ?? this.location);
  }
}

@JsonSerializable(explicitToJson: true)
class AdustProducts {
  AdustProducts({
    this.qty,
    this.sellingPrice,
    this.buyingPrice,
  });

  factory AdustProducts.fromJson(Map<String, dynamic> json) =>
      _$AdustProductsFromJson(json);

  @JsonKey(name: 'qty', includeIfNull: false)
  final int? qty;
  @JsonKey(name: 'sellingPrice', includeIfNull: false)
  final double? sellingPrice;
  @JsonKey(name: 'buyingPrice', includeIfNull: false)
  final double? buyingPrice;
  static const fromJsonFactory = _$AdustProductsFromJson;
  static const toJsonFactory = _$AdustProductsToJson;
  Map<String, dynamic> toJson() => _$AdustProductsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AdustProducts &&
            (identical(other.qty, qty) ||
                const DeepCollectionEquality().equals(other.qty, qty)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.buyingPrice, buyingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.buyingPrice, buyingPrice)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(qty) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(buyingPrice) ^
      runtimeType.hashCode;
}

extension $AdustProductsExtension on AdustProducts {
  AdustProducts copyWith(
      {int? qty, double? sellingPrice, double? buyingPrice}) {
    return AdustProducts(
        qty: qty ?? this.qty,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice);
  }
}

@JsonSerializable(explicitToJson: true)
class BankDetails {
  BankDetails({
    this.bankName,
    this.bankCode,
    this.accountName,
    this.accountNumber,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsFromJson(json);

  @JsonKey(name: 'bankName', includeIfNull: false)
  final String? bankName;
  @JsonKey(name: 'bankCode', includeIfNull: false)
  final String? bankCode;
  @JsonKey(name: 'accountName', includeIfNull: false)
  final String? accountName;
  @JsonKey(name: 'accountNumber', includeIfNull: false)
  final String? accountNumber;
  static const fromJsonFactory = _$BankDetailsFromJson;
  static const toJsonFactory = _$BankDetailsToJson;
  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BankDetails &&
            (identical(other.bankName, bankName) ||
                const DeepCollectionEquality()
                    .equals(other.bankName, bankName)) &&
            (identical(other.bankCode, bankCode) ||
                const DeepCollectionEquality()
                    .equals(other.bankCode, bankCode)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.accountNumber, accountNumber) ||
                const DeepCollectionEquality()
                    .equals(other.accountNumber, accountNumber)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bankName) ^
      const DeepCollectionEquality().hash(bankCode) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(accountNumber) ^
      runtimeType.hashCode;
}

extension $BankDetailsExtension on BankDetails {
  BankDetails copyWith(
      {String? bankName,
      String? bankCode,
      String? accountName,
      String? accountNumber}) {
    return BankDetails(
        bankName: bankName ?? this.bankName,
        bankCode: bankCode ?? this.bankCode,
        accountName: accountName ?? this.accountName,
        accountNumber: accountNumber ?? this.accountNumber);
  }
}

@JsonSerializable(explicitToJson: true)
class BookDTO {
  BookDTO({
    this.bookName,
    this.shortname,
  });

  factory BookDTO.fromJson(Map<String, dynamic> json) =>
      _$BookDTOFromJson(json);

  @JsonKey(name: 'bookName', includeIfNull: false)
  final String? bookName;
  @JsonKey(name: 'shortname', includeIfNull: false)
  final String? shortname;
  static const fromJsonFactory = _$BookDTOFromJson;
  static const toJsonFactory = _$BookDTOToJson;
  Map<String, dynamic> toJson() => _$BookDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookDTO &&
            (identical(other.bookName, bookName) ||
                const DeepCollectionEquality()
                    .equals(other.bookName, bookName)) &&
            (identical(other.shortname, shortname) ||
                const DeepCollectionEquality()
                    .equals(other.shortname, shortname)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookName) ^
      const DeepCollectionEquality().hash(shortname) ^
      runtimeType.hashCode;
}

extension $BookDTOExtension on BookDTO {
  BookDTO copyWith({String? bookName, String? shortname}) {
    return BookDTO(
        bookName: bookName ?? this.bookName,
        shortname: shortname ?? this.shortname);
  }
}

@JsonSerializable(explicitToJson: true)
class BookDTOEdit {
  BookDTOEdit({
    this.id,
    this.bookName,
    this.shortname,
  });

  factory BookDTOEdit.fromJson(Map<String, dynamic> json) =>
      _$BookDTOEditFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'bookName', includeIfNull: false)
  final String? bookName;
  @JsonKey(name: 'shortname', includeIfNull: false)
  final String? shortname;
  static const fromJsonFactory = _$BookDTOEditFromJson;
  static const toJsonFactory = _$BookDTOEditToJson;
  Map<String, dynamic> toJson() => _$BookDTOEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookDTOEdit &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.bookName, bookName) ||
                const DeepCollectionEquality()
                    .equals(other.bookName, bookName)) &&
            (identical(other.shortname, shortname) ||
                const DeepCollectionEquality()
                    .equals(other.shortname, shortname)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(bookName) ^
      const DeepCollectionEquality().hash(shortname) ^
      runtimeType.hashCode;
}

extension $BookDTOEditExtension on BookDTOEdit {
  BookDTOEdit copyWith({int? id, String? bookName, String? shortname}) {
    return BookDTOEdit(
        id: id ?? this.id,
        bookName: bookName ?? this.bookName,
        shortname: shortname ?? this.shortname);
  }
}

@JsonSerializable(explicitToJson: true)
class CashbookCategoriesfilters {
  CashbookCategoriesfilters({
    this.cashbookType,
    this.businessId,
  });

  factory CashbookCategoriesfilters.fromJson(Map<String, dynamic> json) =>
      _$CashbookCategoriesfiltersFromJson(json);

  @JsonKey(
      name: 'cashbookType',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? cashbookType;
  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  static const fromJsonFactory = _$CashbookCategoriesfiltersFromJson;
  static const toJsonFactory = _$CashbookCategoriesfiltersToJson;
  Map<String, dynamic> toJson() => _$CashbookCategoriesfiltersToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CashbookCategoriesfilters &&
            (identical(other.cashbookType, cashbookType) ||
                const DeepCollectionEquality()
                    .equals(other.cashbookType, cashbookType)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(cashbookType) ^
      const DeepCollectionEquality().hash(businessId) ^
      runtimeType.hashCode;
}

extension $CashbookCategoriesfiltersExtension on CashbookCategoriesfilters {
  CashbookCategoriesfilters copyWith(
      {enums.CashbookType? cashbookType, String? businessId}) {
    return CashbookCategoriesfilters(
        cashbookType: cashbookType ?? this.cashbookType,
        businessId: businessId ?? this.businessId);
  }
}

@JsonSerializable(explicitToJson: true)
class CashbookCategorisDTOAdd {
  CashbookCategorisDTOAdd({
    this.categoryname,
    this.categorytype,
    this.customerId,
  });

  factory CashbookCategorisDTOAdd.fromJson(Map<String, dynamic> json) =>
      _$CashbookCategorisDTOAddFromJson(json);

  @JsonKey(name: 'categoryname', includeIfNull: false)
  final String? categoryname;
  @JsonKey(
      name: 'categorytype',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? categorytype;
  @JsonKey(name: 'customerId', includeIfNull: false)
  final String? customerId;
  static const fromJsonFactory = _$CashbookCategorisDTOAddFromJson;
  static const toJsonFactory = _$CashbookCategorisDTOAddToJson;
  Map<String, dynamic> toJson() => _$CashbookCategorisDTOAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CashbookCategorisDTOAdd &&
            (identical(other.categoryname, categoryname) ||
                const DeepCollectionEquality()
                    .equals(other.categoryname, categoryname)) &&
            (identical(other.categorytype, categorytype) ||
                const DeepCollectionEquality()
                    .equals(other.categorytype, categorytype)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryname) ^
      const DeepCollectionEquality().hash(categorytype) ^
      const DeepCollectionEquality().hash(customerId) ^
      runtimeType.hashCode;
}

extension $CashbookCategorisDTOAddExtension on CashbookCategorisDTOAdd {
  CashbookCategorisDTOAdd copyWith(
      {String? categoryname,
      enums.CashbookType? categorytype,
      String? customerId}) {
    return CashbookCategorisDTOAdd(
        categoryname: categoryname ?? this.categoryname,
        categorytype: categorytype ?? this.categorytype,
        customerId: customerId ?? this.customerId);
  }
}

@JsonSerializable(explicitToJson: true)
class CashbookCategorisDTOEdit {
  CashbookCategorisDTOEdit({
    this.id,
    this.categoryname,
    this.categorytype,
    this.customerId,
  });

  factory CashbookCategorisDTOEdit.fromJson(Map<String, dynamic> json) =>
      _$CashbookCategorisDTOEditFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'categoryname', includeIfNull: false)
  final String? categoryname;
  @JsonKey(
      name: 'categorytype',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? categorytype;
  @JsonKey(name: 'customerId', includeIfNull: false)
  final String? customerId;
  static const fromJsonFactory = _$CashbookCategorisDTOEditFromJson;
  static const toJsonFactory = _$CashbookCategorisDTOEditToJson;
  Map<String, dynamic> toJson() => _$CashbookCategorisDTOEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CashbookCategorisDTOEdit &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryname, categoryname) ||
                const DeepCollectionEquality()
                    .equals(other.categoryname, categoryname)) &&
            (identical(other.categorytype, categorytype) ||
                const DeepCollectionEquality()
                    .equals(other.categorytype, categorytype)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryname) ^
      const DeepCollectionEquality().hash(categorytype) ^
      const DeepCollectionEquality().hash(customerId) ^
      runtimeType.hashCode;
}

extension $CashbookCategorisDTOEditExtension on CashbookCategorisDTOEdit {
  CashbookCategorisDTOEdit copyWith(
      {int? id,
      String? categoryname,
      enums.CashbookType? categorytype,
      String? customerId}) {
    return CashbookCategorisDTOEdit(
        id: id ?? this.id,
        categoryname: categoryname ?? this.categoryname,
        categorytype: categorytype ?? this.categorytype,
        customerId: customerId ?? this.customerId);
  }
}

@JsonSerializable(explicitToJson: true)
class CashbookRemarksDTO {
  CashbookRemarksDTO({
    this.remark,
    this.bookId,
    this.ledgerbookType,
  });

  factory CashbookRemarksDTO.fromJson(Map<String, dynamic> json) =>
      _$CashbookRemarksDTOFromJson(json);

  @JsonKey(name: 'remark', includeIfNull: false)
  final String? remark;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final int? bookId;
  @JsonKey(
      name: 'ledgerbookType',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? ledgerbookType;
  static const fromJsonFactory = _$CashbookRemarksDTOFromJson;
  static const toJsonFactory = _$CashbookRemarksDTOToJson;
  Map<String, dynamic> toJson() => _$CashbookRemarksDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CashbookRemarksDTO &&
            (identical(other.remark, remark) ||
                const DeepCollectionEquality().equals(other.remark, remark)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.ledgerbookType, ledgerbookType) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerbookType, ledgerbookType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(remark) ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(ledgerbookType) ^
      runtimeType.hashCode;
}

extension $CashbookRemarksDTOExtension on CashbookRemarksDTO {
  CashbookRemarksDTO copyWith(
      {String? remark, int? bookId, enums.CashbookType? ledgerbookType}) {
    return CashbookRemarksDTO(
        remark: remark ?? this.remark,
        bookId: bookId ?? this.bookId,
        ledgerbookType: ledgerbookType ?? this.ledgerbookType);
  }
}

@JsonSerializable(explicitToJson: true)
class CashbookRemarksQuery {
  CashbookRemarksQuery({
    this.businessId,
    this.ledgerbookType,
    this.bookId,
  });

  factory CashbookRemarksQuery.fromJson(Map<String, dynamic> json) =>
      _$CashbookRemarksQueryFromJson(json);

  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  @JsonKey(
      name: 'ledgerbookType',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? ledgerbookType;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final int? bookId;
  static const fromJsonFactory = _$CashbookRemarksQueryFromJson;
  static const toJsonFactory = _$CashbookRemarksQueryToJson;
  Map<String, dynamic> toJson() => _$CashbookRemarksQueryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CashbookRemarksQuery &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)) &&
            (identical(other.ledgerbookType, ledgerbookType) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerbookType, ledgerbookType)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(businessId) ^
      const DeepCollectionEquality().hash(ledgerbookType) ^
      const DeepCollectionEquality().hash(bookId) ^
      runtimeType.hashCode;
}

extension $CashbookRemarksQueryExtension on CashbookRemarksQuery {
  CashbookRemarksQuery copyWith(
      {String? businessId, enums.CashbookType? ledgerbookType, int? bookId}) {
    return CashbookRemarksQuery(
        businessId: businessId ?? this.businessId,
        ledgerbookType: ledgerbookType ?? this.ledgerbookType,
        bookId: bookId ?? this.bookId);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDTO {
  CategoryDTO({
    this.categoryname,
    this.longdesc,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  @JsonKey(name: 'categoryname', includeIfNull: false)
  final String? categoryname;
  @JsonKey(name: 'longdesc', includeIfNull: false)
  final String? longdesc;
  static const fromJsonFactory = _$CategoryDTOFromJson;
  static const toJsonFactory = _$CategoryDTOToJson;
  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryDTO &&
            (identical(other.categoryname, categoryname) ||
                const DeepCollectionEquality()
                    .equals(other.categoryname, categoryname)) &&
            (identical(other.longdesc, longdesc) ||
                const DeepCollectionEquality()
                    .equals(other.longdesc, longdesc)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryname) ^
      const DeepCollectionEquality().hash(longdesc) ^
      runtimeType.hashCode;
}

extension $CategoryDTOExtension on CategoryDTO {
  CategoryDTO copyWith({String? categoryname, String? longdesc}) {
    return CategoryDTO(
        categoryname: categoryname ?? this.categoryname,
        longdesc: longdesc ?? this.longdesc);
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryEditDTO {
  CategoryEditDTO({
    this.id,
    this.categoryname,
    this.longdesc,
  });

  factory CategoryEditDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryEditDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'categoryname', includeIfNull: false)
  final String? categoryname;
  @JsonKey(name: 'longdesc', includeIfNull: false)
  final String? longdesc;
  static const fromJsonFactory = _$CategoryEditDTOFromJson;
  static const toJsonFactory = _$CategoryEditDTOToJson;
  Map<String, dynamic> toJson() => _$CategoryEditDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryEditDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryname, categoryname) ||
                const DeepCollectionEquality()
                    .equals(other.categoryname, categoryname)) &&
            (identical(other.longdesc, longdesc) ||
                const DeepCollectionEquality()
                    .equals(other.longdesc, longdesc)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryname) ^
      const DeepCollectionEquality().hash(longdesc) ^
      runtimeType.hashCode;
}

extension $CategoryEditDTOExtension on CategoryEditDTO {
  CategoryEditDTO copyWith({int? id, String? categoryname, String? longdesc}) {
    return CategoryEditDTO(
        id: id ?? this.id,
        categoryname: categoryname ?? this.categoryname,
        longdesc: longdesc ?? this.longdesc);
  }
}

@JsonSerializable(explicitToJson: true)
class ChangePassword {
  ChangePassword({
    this.userId,
    this.newpin,
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordFromJson(json);

  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'newpin', includeIfNull: false)
  final String? newpin;
  static const fromJsonFactory = _$ChangePasswordFromJson;
  static const toJsonFactory = _$ChangePasswordToJson;
  Map<String, dynamic> toJson() => _$ChangePasswordToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePassword &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.newpin, newpin) ||
                const DeepCollectionEquality().equals(other.newpin, newpin)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(newpin) ^
      runtimeType.hashCode;
}

extension $ChangePasswordExtension on ChangePassword {
  ChangePassword copyWith({String? userId, String? newpin}) {
    return ChangePassword(
        userId: userId ?? this.userId, newpin: newpin ?? this.newpin);
  }
}

@JsonSerializable(explicitToJson: true)
class Customer {
  Customer({
    this.customerid,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  @JsonKey(name: 'customerid', includeIfNull: false)
  final String? customerid;
  static const fromJsonFactory = _$CustomerFromJson;
  static const toJsonFactory = _$CustomerToJson;
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Customer &&
            (identical(other.customerid, customerid) ||
                const DeepCollectionEquality()
                    .equals(other.customerid, customerid)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerid) ^ runtimeType.hashCode;
}

extension $CustomerExtension on Customer {
  Customer copyWith({String? customerid}) {
    return Customer(customerid: customerid ?? this.customerid);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerClientDTOAdd {
  CustomerClientDTOAdd({
    this.clientName,
    this.clientEmail,
    this.clientPhone,
    this.photo,
    this.addressDetails,
    this.bankDetails,
  });

  factory CustomerClientDTOAdd.fromJson(Map<String, dynamic> json) =>
      _$CustomerClientDTOAddFromJson(json);

  @JsonKey(name: 'clientName', includeIfNull: false)
  final String? clientName;
  @JsonKey(name: 'clientEmail', includeIfNull: false)
  final String? clientEmail;
  @JsonKey(name: 'clientPhone', includeIfNull: false)
  final String? clientPhone;
  @JsonKey(name: 'photo', includeIfNull: false)
  final String? photo;
  @JsonKey(name: 'addressDetails', includeIfNull: false)
  final AddressDetails? addressDetails;
  @JsonKey(name: 'bankDetails', includeIfNull: false)
  final BankDetails? bankDetails;
  static const fromJsonFactory = _$CustomerClientDTOAddFromJson;
  static const toJsonFactory = _$CustomerClientDTOAddToJson;
  Map<String, dynamic> toJson() => _$CustomerClientDTOAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerClientDTOAdd &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.clientEmail, clientEmail) ||
                const DeepCollectionEquality()
                    .equals(other.clientEmail, clientEmail)) &&
            (identical(other.clientPhone, clientPhone) ||
                const DeepCollectionEquality()
                    .equals(other.clientPhone, clientPhone)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.addressDetails, addressDetails) ||
                const DeepCollectionEquality()
                    .equals(other.addressDetails, addressDetails)) &&
            (identical(other.bankDetails, bankDetails) ||
                const DeepCollectionEquality()
                    .equals(other.bankDetails, bankDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientEmail) ^
      const DeepCollectionEquality().hash(clientPhone) ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(addressDetails) ^
      const DeepCollectionEquality().hash(bankDetails) ^
      runtimeType.hashCode;
}

extension $CustomerClientDTOAddExtension on CustomerClientDTOAdd {
  CustomerClientDTOAdd copyWith(
      {String? clientName,
      String? clientEmail,
      String? clientPhone,
      String? photo,
      AddressDetails? addressDetails,
      BankDetails? bankDetails}) {
    return CustomerClientDTOAdd(
        clientName: clientName ?? this.clientName,
        clientEmail: clientEmail ?? this.clientEmail,
        clientPhone: clientPhone ?? this.clientPhone,
        photo: photo ?? this.photo,
        addressDetails: addressDetails ?? this.addressDetails,
        bankDetails: bankDetails ?? this.bankDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerClientEditDTO {
  CustomerClientEditDTO({
    this.clientName,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.favourite,
  });

  factory CustomerClientEditDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerClientEditDTOFromJson(json);

  @JsonKey(name: 'clientName', includeIfNull: false)
  final String? clientName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'favourite', includeIfNull: false)
  final bool? favourite;
  static const fromJsonFactory = _$CustomerClientEditDTOFromJson;
  static const toJsonFactory = _$CustomerClientEditDTOToJson;
  Map<String, dynamic> toJson() => _$CustomerClientEditDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerClientEditDTO &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(favourite) ^
      runtimeType.hashCode;
}

extension $CustomerClientEditDTOExtension on CustomerClientEditDTO {
  CustomerClientEditDTO copyWith(
      {String? clientName,
      String? phoneNumber,
      String? email,
      String? firstName,
      String? lastName,
      bool? favourite}) {
    return CustomerClientEditDTO(
        clientName: clientName ?? this.clientName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        favourite: favourite ?? this.favourite);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerCreditAccountsDTO {
  CustomerCreditAccountsDTO({
    this.id,
    this.customerContactId,
    this.customerContactFirstName,
    this.customerContactsLastName,
    this.customername,
    this.productName,
    this.totalOutstanding,
    this.amountPaid,
    this.amountBalance,
    this.itemDesc,
    this.remarks,
    this.createdOn,
    this.createdBy,
    this.createdByName,
    this.dueDate,
    this.fullyPaid,
    this.partialPaid,
    this.sendreminder,
    this.reminderSent,
    this.reminderCount,
    this.status,
  });

  factory CustomerCreditAccountsDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditAccountsDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'customerContactId', includeIfNull: false)
  final String? customerContactId;
  @JsonKey(name: 'customerContactFirstName', includeIfNull: false)
  final String? customerContactFirstName;
  @JsonKey(name: 'customerContactsLastName', includeIfNull: false)
  final String? customerContactsLastName;
  @JsonKey(name: 'customername', includeIfNull: false)
  final String? customername;
  @JsonKey(name: 'productName', includeIfNull: false)
  final String? productName;
  @JsonKey(name: 'totalOutstanding', includeIfNull: false)
  final double? totalOutstanding;
  @JsonKey(name: 'amountPaid', includeIfNull: false)
  final double? amountPaid;
  @JsonKey(name: 'amountBalance', includeIfNull: false)
  final double? amountBalance;
  @JsonKey(name: 'itemDesc', includeIfNull: false)
  final String? itemDesc;
  @JsonKey(name: 'remarks', includeIfNull: false)
  final String? remarks;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final String? createdOn;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final String? createdBy;
  @JsonKey(name: 'createdByName', includeIfNull: false)
  final String? createdByName;
  @JsonKey(name: 'dueDate', includeIfNull: false)
  final String? dueDate;
  @JsonKey(name: 'fullyPaid', includeIfNull: false)
  final bool? fullyPaid;
  @JsonKey(name: 'partialPaid', includeIfNull: false)
  final bool? partialPaid;
  @JsonKey(name: 'sendreminder', includeIfNull: false)
  final bool? sendreminder;
  @JsonKey(name: 'reminderSent', includeIfNull: false)
  final bool? reminderSent;
  @JsonKey(name: 'reminderCount', includeIfNull: false)
  final int? reminderCount;
  @JsonKey(name: 'status', includeIfNull: false)
  final String? status;
  static const fromJsonFactory = _$CustomerCreditAccountsDTOFromJson;
  static const toJsonFactory = _$CustomerCreditAccountsDTOToJson;
  Map<String, dynamic> toJson() => _$CustomerCreditAccountsDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerCreditAccountsDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.customerContactId, customerContactId) ||
                const DeepCollectionEquality()
                    .equals(other.customerContactId, customerContactId)) &&
            (identical(other.customerContactFirstName, customerContactFirstName) ||
                const DeepCollectionEquality().equals(
                    other.customerContactFirstName,
                    customerContactFirstName)) &&
            (identical(other.customerContactsLastName, customerContactsLastName) ||
                const DeepCollectionEquality().equals(
                    other.customerContactsLastName,
                    customerContactsLastName)) &&
            (identical(other.customername, customername) ||
                const DeepCollectionEquality()
                    .equals(other.customername, customername)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                const DeepCollectionEquality()
                    .equals(other.totalOutstanding, totalOutstanding)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.amountBalance, amountBalance) ||
                const DeepCollectionEquality()
                    .equals(other.amountBalance, amountBalance)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdByName, createdByName) ||
                const DeepCollectionEquality()
                    .equals(other.createdByName, createdByName)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality().equals(other.dueDate, dueDate)) &&
            (identical(other.fullyPaid, fullyPaid) || const DeepCollectionEquality().equals(other.fullyPaid, fullyPaid)) &&
            (identical(other.partialPaid, partialPaid) || const DeepCollectionEquality().equals(other.partialPaid, partialPaid)) &&
            (identical(other.sendreminder, sendreminder) || const DeepCollectionEquality().equals(other.sendreminder, sendreminder)) &&
            (identical(other.reminderSent, reminderSent) || const DeepCollectionEquality().equals(other.reminderSent, reminderSent)) &&
            (identical(other.reminderCount, reminderCount) || const DeepCollectionEquality().equals(other.reminderCount, reminderCount)) &&
            (identical(other.status, status) || const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(customerContactId) ^
      const DeepCollectionEquality().hash(customerContactFirstName) ^
      const DeepCollectionEquality().hash(customerContactsLastName) ^
      const DeepCollectionEquality().hash(customername) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(totalOutstanding) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(amountBalance) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdByName) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(fullyPaid) ^
      const DeepCollectionEquality().hash(partialPaid) ^
      const DeepCollectionEquality().hash(sendreminder) ^
      const DeepCollectionEquality().hash(reminderSent) ^
      const DeepCollectionEquality().hash(reminderCount) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $CustomerCreditAccountsDTOExtension on CustomerCreditAccountsDTO {
  CustomerCreditAccountsDTO copyWith(
      {String? id,
      String? customerContactId,
      String? customerContactFirstName,
      String? customerContactsLastName,
      String? customername,
      String? productName,
      double? totalOutstanding,
      double? amountPaid,
      double? amountBalance,
      String? itemDesc,
      String? remarks,
      String? createdOn,
      String? createdBy,
      String? createdByName,
      String? dueDate,
      bool? fullyPaid,
      bool? partialPaid,
      bool? sendreminder,
      bool? reminderSent,
      int? reminderCount,
      String? status}) {
    return CustomerCreditAccountsDTO(
        id: id ?? this.id,
        customerContactId: customerContactId ?? this.customerContactId,
        customerContactFirstName:
            customerContactFirstName ?? this.customerContactFirstName,
        customerContactsLastName:
            customerContactsLastName ?? this.customerContactsLastName,
        customername: customername ?? this.customername,
        productName: productName ?? this.productName,
        totalOutstanding: totalOutstanding ?? this.totalOutstanding,
        amountPaid: amountPaid ?? this.amountPaid,
        amountBalance: amountBalance ?? this.amountBalance,
        itemDesc: itemDesc ?? this.itemDesc,
        remarks: remarks ?? this.remarks,
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        createdByName: createdByName ?? this.createdByName,
        dueDate: dueDate ?? this.dueDate,
        fullyPaid: fullyPaid ?? this.fullyPaid,
        partialPaid: partialPaid ?? this.partialPaid,
        sendreminder: sendreminder ?? this.sendreminder,
        reminderSent: reminderSent ?? this.reminderSent,
        reminderCount: reminderCount ?? this.reminderCount,
        status: status ?? this.status);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerCreditAccountsDTOAdd {
  CustomerCreditAccountsDTOAdd({
    this.customerId,
    this.totalAmount,
    this.amountPaid,
    this.products,
    this.productImages,
    this.attachments,
    this.itemDesc,
    this.paidThrough,
    this.remarks,
    this.datedue,
    this.addedBy,
  });

  factory CustomerCreditAccountsDTOAdd.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditAccountsDTOAddFromJson(json);

  @JsonKey(name: 'customerId', includeIfNull: false)
  final String? customerId;
  @JsonKey(name: 'totalAmount', includeIfNull: false)
  final double? totalAmount;
  @JsonKey(name: 'amountPaid', includeIfNull: false)
  final double? amountPaid;
  @JsonKey(name: 'products', includeIfNull: false, defaultValue: <String>[])
  final List<String>? products;
  @JsonKey(
      name: 'productImages', includeIfNull: false, defaultValue: <String>[])
  final List<String>? productImages;
  @JsonKey(name: 'attachments', includeIfNull: false, defaultValue: <String>[])
  final List<String>? attachments;
  @JsonKey(name: 'itemDesc', includeIfNull: false)
  final String? itemDesc;
  @JsonKey(name: 'paidThrough', includeIfNull: false)
  final String? paidThrough;
  @JsonKey(name: 'remarks', includeIfNull: false)
  final String? remarks;
  @JsonKey(name: 'datedue', includeIfNull: false)
  final String? datedue;
  @JsonKey(name: 'addedBy', includeIfNull: false)
  final String? addedBy;
  static const fromJsonFactory = _$CustomerCreditAccountsDTOAddFromJson;
  static const toJsonFactory = _$CustomerCreditAccountsDTOAddToJson;
  Map<String, dynamic> toJson() => _$CustomerCreditAccountsDTOAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerCreditAccountsDTOAdd &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.totalAmount, totalAmount) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmount, totalAmount)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.productImages, productImages) ||
                const DeepCollectionEquality()
                    .equals(other.productImages, productImages)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.paidThrough, paidThrough) ||
                const DeepCollectionEquality()
                    .equals(other.paidThrough, paidThrough)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.datedue, datedue) ||
                const DeepCollectionEquality()
                    .equals(other.datedue, datedue)) &&
            (identical(other.addedBy, addedBy) ||
                const DeepCollectionEquality().equals(other.addedBy, addedBy)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(totalAmount) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(productImages) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(paidThrough) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(datedue) ^
      const DeepCollectionEquality().hash(addedBy) ^
      runtimeType.hashCode;
}

extension $CustomerCreditAccountsDTOAddExtension
    on CustomerCreditAccountsDTOAdd {
  CustomerCreditAccountsDTOAdd copyWith(
      {String? customerId,
      double? totalAmount,
      double? amountPaid,
      List<String>? products,
      List<String>? productImages,
      List<String>? attachments,
      String? itemDesc,
      String? paidThrough,
      String? remarks,
      String? datedue,
      String? addedBy}) {
    return CustomerCreditAccountsDTOAdd(
        customerId: customerId ?? this.customerId,
        totalAmount: totalAmount ?? this.totalAmount,
        amountPaid: amountPaid ?? this.amountPaid,
        products: products ?? this.products,
        productImages: productImages ?? this.productImages,
        attachments: attachments ?? this.attachments,
        itemDesc: itemDesc ?? this.itemDesc,
        paidThrough: paidThrough ?? this.paidThrough,
        remarks: remarks ?? this.remarks,
        datedue: datedue ?? this.datedue,
        addedBy: addedBy ?? this.addedBy);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerCreditAccountsListDTO {
  CustomerCreditAccountsListDTO({
    this.nextPaymentDue,
    this.totalAmount,
    this.customerCreditAccountsDTOs,
  });

  factory CustomerCreditAccountsListDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditAccountsListDTOFromJson(json);

  @JsonKey(name: 'nextPaymentDue', includeIfNull: false)
  final String? nextPaymentDue;
  @JsonKey(name: 'totalAmount', includeIfNull: false)
  final String? totalAmount;
  @JsonKey(
      name: 'customerCreditAccountsDTOs',
      includeIfNull: false,
      defaultValue: <CustomerCreditAccountsView>[])
  final List<CustomerCreditAccountsView>? customerCreditAccountsDTOs;
  static const fromJsonFactory = _$CustomerCreditAccountsListDTOFromJson;
  static const toJsonFactory = _$CustomerCreditAccountsListDTOToJson;
  Map<String, dynamic> toJson() => _$CustomerCreditAccountsListDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerCreditAccountsListDTO &&
            (identical(other.nextPaymentDue, nextPaymentDue) ||
                const DeepCollectionEquality()
                    .equals(other.nextPaymentDue, nextPaymentDue)) &&
            (identical(other.totalAmount, totalAmount) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmount, totalAmount)) &&
            (identical(other.customerCreditAccountsDTOs,
                    customerCreditAccountsDTOs) ||
                const DeepCollectionEquality().equals(
                    other.customerCreditAccountsDTOs,
                    customerCreditAccountsDTOs)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nextPaymentDue) ^
      const DeepCollectionEquality().hash(totalAmount) ^
      const DeepCollectionEquality().hash(customerCreditAccountsDTOs) ^
      runtimeType.hashCode;
}

extension $CustomerCreditAccountsListDTOExtension
    on CustomerCreditAccountsListDTO {
  CustomerCreditAccountsListDTO copyWith(
      {String? nextPaymentDue,
      String? totalAmount,
      List<CustomerCreditAccountsView>? customerCreditAccountsDTOs}) {
    return CustomerCreditAccountsListDTO(
        nextPaymentDue: nextPaymentDue ?? this.nextPaymentDue,
        totalAmount: totalAmount ?? this.totalAmount,
        customerCreditAccountsDTOs:
            customerCreditAccountsDTOs ?? this.customerCreditAccountsDTOs);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerCreditAccountsView {
  CustomerCreditAccountsView({
    this.id,
    this.productName,
    this.totalAmount,
    this.amountPaid,
    this.amountBalance,
    this.itemDesc,
    this.remarks,
    this.createdOn,
    this.dueDate,
    this.fullyPaid,
    this.partialPaid,
    this.sendreminder,
    this.reminderSent,
    this.reminderCount,
    this.status,
    this.customerClientId,
    this.customerIdCustId,
    this.paidThrough,
  });

  factory CustomerCreditAccountsView.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditAccountsViewFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'productName', includeIfNull: false)
  final String? productName;
  @JsonKey(name: 'totalAmount', includeIfNull: false)
  final double? totalAmount;
  @JsonKey(name: 'amountPaid', includeIfNull: false)
  final double? amountPaid;
  @JsonKey(name: 'amountBalance', includeIfNull: false)
  final double? amountBalance;
  @JsonKey(name: 'itemDesc', includeIfNull: false)
  final String? itemDesc;
  @JsonKey(name: 'remarks', includeIfNull: false)
  final String? remarks;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final String? createdOn;
  @JsonKey(name: 'dueDate', includeIfNull: false)
  final String? dueDate;
  @JsonKey(name: 'fullyPaid', includeIfNull: false)
  final bool? fullyPaid;
  @JsonKey(name: 'partialPaid', includeIfNull: false)
  final bool? partialPaid;
  @JsonKey(name: 'sendreminder', includeIfNull: false)
  final bool? sendreminder;
  @JsonKey(name: 'reminderSent', includeIfNull: false)
  final bool? reminderSent;
  @JsonKey(name: 'reminderCount', includeIfNull: false)
  final int? reminderCount;
  @JsonKey(name: 'status', includeIfNull: false)
  final String? status;
  @JsonKey(name: 'customerClientId', includeIfNull: false)
  final int? customerClientId;
  @JsonKey(name: 'customerIdCustId', includeIfNull: false)
  final String? customerIdCustId;
  @JsonKey(name: 'paidThrough', includeIfNull: false)
  final String? paidThrough;
  static const fromJsonFactory = _$CustomerCreditAccountsViewFromJson;
  static const toJsonFactory = _$CustomerCreditAccountsViewToJson;
  Map<String, dynamic> toJson() => _$CustomerCreditAccountsViewToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerCreditAccountsView &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.totalAmount, totalAmount) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmount, totalAmount)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.amountBalance, amountBalance) ||
                const DeepCollectionEquality()
                    .equals(other.amountBalance, amountBalance)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.fullyPaid, fullyPaid) ||
                const DeepCollectionEquality()
                    .equals(other.fullyPaid, fullyPaid)) &&
            (identical(other.partialPaid, partialPaid) ||
                const DeepCollectionEquality()
                    .equals(other.partialPaid, partialPaid)) &&
            (identical(other.sendreminder, sendreminder) ||
                const DeepCollectionEquality()
                    .equals(other.sendreminder, sendreminder)) &&
            (identical(other.reminderSent, reminderSent) ||
                const DeepCollectionEquality()
                    .equals(other.reminderSent, reminderSent)) &&
            (identical(other.reminderCount, reminderCount) ||
                const DeepCollectionEquality()
                    .equals(other.reminderCount, reminderCount)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.customerClientId, customerClientId) ||
                const DeepCollectionEquality()
                    .equals(other.customerClientId, customerClientId)) &&
            (identical(other.customerIdCustId, customerIdCustId) ||
                const DeepCollectionEquality()
                    .equals(other.customerIdCustId, customerIdCustId)) &&
            (identical(other.paidThrough, paidThrough) ||
                const DeepCollectionEquality()
                    .equals(other.paidThrough, paidThrough)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(totalAmount) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(amountBalance) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(fullyPaid) ^
      const DeepCollectionEquality().hash(partialPaid) ^
      const DeepCollectionEquality().hash(sendreminder) ^
      const DeepCollectionEquality().hash(reminderSent) ^
      const DeepCollectionEquality().hash(reminderCount) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(customerClientId) ^
      const DeepCollectionEquality().hash(customerIdCustId) ^
      const DeepCollectionEquality().hash(paidThrough) ^
      runtimeType.hashCode;
}

extension $CustomerCreditAccountsViewExtension on CustomerCreditAccountsView {
  CustomerCreditAccountsView copyWith(
      {String? id,
      String? productName,
      double? totalAmount,
      double? amountPaid,
      double? amountBalance,
      String? itemDesc,
      String? remarks,
      String? createdOn,
      String? dueDate,
      bool? fullyPaid,
      bool? partialPaid,
      bool? sendreminder,
      bool? reminderSent,
      int? reminderCount,
      String? status,
      int? customerClientId,
      String? customerIdCustId,
      String? paidThrough}) {
    return CustomerCreditAccountsView(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        totalAmount: totalAmount ?? this.totalAmount,
        amountPaid: amountPaid ?? this.amountPaid,
        amountBalance: amountBalance ?? this.amountBalance,
        itemDesc: itemDesc ?? this.itemDesc,
        remarks: remarks ?? this.remarks,
        createdOn: createdOn ?? this.createdOn,
        dueDate: dueDate ?? this.dueDate,
        fullyPaid: fullyPaid ?? this.fullyPaid,
        partialPaid: partialPaid ?? this.partialPaid,
        sendreminder: sendreminder ?? this.sendreminder,
        reminderSent: reminderSent ?? this.reminderSent,
        reminderCount: reminderCount ?? this.reminderCount,
        status: status ?? this.status,
        customerClientId: customerClientId ?? this.customerClientId,
        customerIdCustId: customerIdCustId ?? this.customerIdCustId,
        paidThrough: paidThrough ?? this.paidThrough);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerDTO {
  CustomerDTO({
    this.id,
    this.valuedueDate,
    this.clientName,
    this.phoneNumber,
    this.firstName,
    this.email,
    this.lastName,
    this.balance,
    this.paymentStatus,
    this.dueDate,
  });

  factory CustomerDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'valuedueDate', includeIfNull: false)
  final String? valuedueDate;
  @JsonKey(name: 'clientName', includeIfNull: false)
  final String? clientName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'balance', includeIfNull: false)
  final String? balance;
  @JsonKey(name: 'paymentStatus', includeIfNull: false)
  final String? paymentStatus;
  @JsonKey(name: 'dueDate', includeIfNull: false)
  final String? dueDate;
  static const fromJsonFactory = _$CustomerDTOFromJson;
  static const toJsonFactory = _$CustomerDTOToJson;
  Map<String, dynamic> toJson() => _$CustomerDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.valuedueDate, valuedueDate) ||
                const DeepCollectionEquality()
                    .equals(other.valuedueDate, valuedueDate)) &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.paymentStatus, paymentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.paymentStatus, paymentStatus)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality().equals(other.dueDate, dueDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(valuedueDate) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(paymentStatus) ^
      const DeepCollectionEquality().hash(dueDate) ^
      runtimeType.hashCode;
}

extension $CustomerDTOExtension on CustomerDTO {
  CustomerDTO copyWith(
      {int? id,
      String? valuedueDate,
      String? clientName,
      String? phoneNumber,
      String? firstName,
      String? email,
      String? lastName,
      String? balance,
      String? paymentStatus,
      String? dueDate}) {
    return CustomerDTO(
        id: id ?? this.id,
        valuedueDate: valuedueDate ?? this.valuedueDate,
        clientName: clientName ?? this.clientName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        lastName: lastName ?? this.lastName,
        balance: balance ?? this.balance,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        dueDate: dueDate ?? this.dueDate);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerDTOEdit {
  CustomerDTOEdit({
    this.custId,
    this.organizationName,
    this.fullnames,
    this.primaryPhone,
    this.secondaryPhone,
    this.primaryEmail,
    this.secondaryEmail,
    this.website,
    this.city,
    this.address,
    this.country,
    this.location,
    this.businessTypeId,
    this.editedby,
    this.imageFile,
    this.editedIP,
  });

  factory CustomerDTOEdit.fromJson(Map<String, dynamic> json) =>
      _$CustomerDTOEditFromJson(json);

  @JsonKey(name: 'custId', includeIfNull: false)
  final String? custId;
  @JsonKey(name: 'organizationName', includeIfNull: false)
  final String? organizationName;
  @JsonKey(name: 'fullnames', includeIfNull: false)
  final String? fullnames;
  @JsonKey(name: 'primaryPhone', includeIfNull: false)
  final String? primaryPhone;
  @JsonKey(name: 'secondaryPhone', includeIfNull: false)
  final String? secondaryPhone;
  @JsonKey(name: 'primaryEmail', includeIfNull: false)
  final String? primaryEmail;
  @JsonKey(name: 'secondaryEmail', includeIfNull: false)
  final String? secondaryEmail;
  @JsonKey(name: 'website', includeIfNull: false)
  final String? website;
  @JsonKey(name: 'city', includeIfNull: false)
  final String? city;
  @JsonKey(name: 'address', includeIfNull: false)
  final String? address;
  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;
  @JsonKey(name: 'location', includeIfNull: false)
  final String? location;
  @JsonKey(name: 'businessType_Id', includeIfNull: false)
  final String? businessTypeId;
  @JsonKey(name: 'editedby', includeIfNull: false)
  final String? editedby;
  @JsonKey(name: 'imageFile', includeIfNull: false)
  final String? imageFile;
  @JsonKey(name: 'editedIP', includeIfNull: false)
  final String? editedIP;
  static const fromJsonFactory = _$CustomerDTOEditFromJson;
  static const toJsonFactory = _$CustomerDTOEditToJson;
  Map<String, dynamic> toJson() => _$CustomerDTOEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerDTOEdit &&
            (identical(other.custId, custId) ||
                const DeepCollectionEquality().equals(other.custId, custId)) &&
            (identical(other.organizationName, organizationName) ||
                const DeepCollectionEquality()
                    .equals(other.organizationName, organizationName)) &&
            (identical(other.fullnames, fullnames) ||
                const DeepCollectionEquality()
                    .equals(other.fullnames, fullnames)) &&
            (identical(other.primaryPhone, primaryPhone) ||
                const DeepCollectionEquality()
                    .equals(other.primaryPhone, primaryPhone)) &&
            (identical(other.secondaryPhone, secondaryPhone) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryPhone, secondaryPhone)) &&
            (identical(other.primaryEmail, primaryEmail) ||
                const DeepCollectionEquality()
                    .equals(other.primaryEmail, primaryEmail)) &&
            (identical(other.secondaryEmail, secondaryEmail) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryEmail, secondaryEmail)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.businessTypeId, businessTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.businessTypeId, businessTypeId)) &&
            (identical(other.editedby, editedby) ||
                const DeepCollectionEquality()
                    .equals(other.editedby, editedby)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.editedIP, editedIP) ||
                const DeepCollectionEquality()
                    .equals(other.editedIP, editedIP)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(custId) ^
      const DeepCollectionEquality().hash(organizationName) ^
      const DeepCollectionEquality().hash(fullnames) ^
      const DeepCollectionEquality().hash(primaryPhone) ^
      const DeepCollectionEquality().hash(secondaryPhone) ^
      const DeepCollectionEquality().hash(primaryEmail) ^
      const DeepCollectionEquality().hash(secondaryEmail) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(businessTypeId) ^
      const DeepCollectionEquality().hash(editedby) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(editedIP) ^
      runtimeType.hashCode;
}

extension $CustomerDTOEditExtension on CustomerDTOEdit {
  CustomerDTOEdit copyWith(
      {String? custId,
      String? organizationName,
      String? fullnames,
      String? primaryPhone,
      String? secondaryPhone,
      String? primaryEmail,
      String? secondaryEmail,
      String? website,
      String? city,
      String? address,
      String? country,
      String? location,
      String? businessTypeId,
      String? editedby,
      String? imageFile,
      String? editedIP}) {
    return CustomerDTOEdit(
        custId: custId ?? this.custId,
        organizationName: organizationName ?? this.organizationName,
        fullnames: fullnames ?? this.fullnames,
        primaryPhone: primaryPhone ?? this.primaryPhone,
        secondaryPhone: secondaryPhone ?? this.secondaryPhone,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        website: website ?? this.website,
        city: city ?? this.city,
        address: address ?? this.address,
        country: country ?? this.country,
        location: location ?? this.location,
        businessTypeId: businessTypeId ?? this.businessTypeId,
        editedby: editedby ?? this.editedby,
        imageFile: imageFile ?? this.imageFile,
        editedIP: editedIP ?? this.editedIP);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerDTOView {
  CustomerDTOView({
    this.custId,
    this.organizationName,
    this.fullnames,
    this.primaryPhone,
    this.secondaryPhone,
    this.primaryEmail,
    this.secondaryEmail,
    this.website,
    this.city,
    this.address,
    this.country,
    this.location,
    this.logo,
    this.businessTypeName,
    this.businessTypeId,
  });

  factory CustomerDTOView.fromJson(Map<String, dynamic> json) =>
      _$CustomerDTOViewFromJson(json);

  @JsonKey(name: 'custId', includeIfNull: false)
  final String? custId;
  @JsonKey(name: 'organizationName', includeIfNull: false)
  final String? organizationName;
  @JsonKey(name: 'fullnames', includeIfNull: false)
  final String? fullnames;
  @JsonKey(name: 'primaryPhone', includeIfNull: false)
  final String? primaryPhone;
  @JsonKey(name: 'secondaryPhone', includeIfNull: false)
  final String? secondaryPhone;
  @JsonKey(name: 'primaryEmail', includeIfNull: false)
  final String? primaryEmail;
  @JsonKey(name: 'secondaryEmail', includeIfNull: false)
  final String? secondaryEmail;
  @JsonKey(name: 'website', includeIfNull: false)
  final String? website;
  @JsonKey(name: 'city', includeIfNull: false)
  final String? city;
  @JsonKey(name: 'address', includeIfNull: false)
  final String? address;
  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;
  @JsonKey(name: 'location', includeIfNull: false)
  final String? location;
  @JsonKey(name: 'logo', includeIfNull: false)
  final String? logo;
  @JsonKey(name: 'businessTypeName', includeIfNull: false)
  final String? businessTypeName;
  @JsonKey(name: 'businessTypeId', includeIfNull: false)
  final String? businessTypeId;
  static const fromJsonFactory = _$CustomerDTOViewFromJson;
  static const toJsonFactory = _$CustomerDTOViewToJson;
  Map<String, dynamic> toJson() => _$CustomerDTOViewToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerDTOView &&
            (identical(other.custId, custId) ||
                const DeepCollectionEquality().equals(other.custId, custId)) &&
            (identical(other.organizationName, organizationName) ||
                const DeepCollectionEquality()
                    .equals(other.organizationName, organizationName)) &&
            (identical(other.fullnames, fullnames) ||
                const DeepCollectionEquality()
                    .equals(other.fullnames, fullnames)) &&
            (identical(other.primaryPhone, primaryPhone) ||
                const DeepCollectionEquality()
                    .equals(other.primaryPhone, primaryPhone)) &&
            (identical(other.secondaryPhone, secondaryPhone) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryPhone, secondaryPhone)) &&
            (identical(other.primaryEmail, primaryEmail) ||
                const DeepCollectionEquality()
                    .equals(other.primaryEmail, primaryEmail)) &&
            (identical(other.secondaryEmail, secondaryEmail) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryEmail, secondaryEmail)) &&
            (identical(other.website, website) ||
                const DeepCollectionEquality()
                    .equals(other.website, website)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.businessTypeName, businessTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.businessTypeName, businessTypeName)) &&
            (identical(other.businessTypeId, businessTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.businessTypeId, businessTypeId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(custId) ^
      const DeepCollectionEquality().hash(organizationName) ^
      const DeepCollectionEquality().hash(fullnames) ^
      const DeepCollectionEquality().hash(primaryPhone) ^
      const DeepCollectionEquality().hash(secondaryPhone) ^
      const DeepCollectionEquality().hash(primaryEmail) ^
      const DeepCollectionEquality().hash(secondaryEmail) ^
      const DeepCollectionEquality().hash(website) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(businessTypeName) ^
      const DeepCollectionEquality().hash(businessTypeId) ^
      runtimeType.hashCode;
}

extension $CustomerDTOViewExtension on CustomerDTOView {
  CustomerDTOView copyWith(
      {String? custId,
      String? organizationName,
      String? fullnames,
      String? primaryPhone,
      String? secondaryPhone,
      String? primaryEmail,
      String? secondaryEmail,
      String? website,
      String? city,
      String? address,
      String? country,
      String? location,
      String? logo,
      String? businessTypeName,
      String? businessTypeId}) {
    return CustomerDTOView(
        custId: custId ?? this.custId,
        organizationName: organizationName ?? this.organizationName,
        fullnames: fullnames ?? this.fullnames,
        primaryPhone: primaryPhone ?? this.primaryPhone,
        secondaryPhone: secondaryPhone ?? this.secondaryPhone,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        website: website ?? this.website,
        city: city ?? this.city,
        address: address ?? this.address,
        country: country ?? this.country,
        location: location ?? this.location,
        logo: logo ?? this.logo,
        businessTypeName: businessTypeName ?? this.businessTypeName,
        businessTypeId: businessTypeId ?? this.businessTypeId);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerPaymentsDTOADD {
  CustomerPaymentsDTOADD({
    this.clientId,
    this.originalTranId,
    this.notes,
    this.paymentMode,
    this.paidBy,
    this.amount,
  });

  factory CustomerPaymentsDTOADD.fromJson(Map<String, dynamic> json) =>
      _$CustomerPaymentsDTOADDFromJson(json);

  @JsonKey(name: 'clientId', includeIfNull: false)
  final String? clientId;
  @JsonKey(name: 'originalTranId', includeIfNull: false)
  final String? originalTranId;
  @JsonKey(name: 'notes', includeIfNull: false)
  final String? notes;
  @JsonKey(name: 'paymentMode', includeIfNull: false)
  final String? paymentMode;
  @JsonKey(name: 'paidBy', includeIfNull: false)
  final String? paidBy;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double? amount;
  static const fromJsonFactory = _$CustomerPaymentsDTOADDFromJson;
  static const toJsonFactory = _$CustomerPaymentsDTOADDToJson;
  Map<String, dynamic> toJson() => _$CustomerPaymentsDTOADDToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerPaymentsDTOADD &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.originalTranId, originalTranId) ||
                const DeepCollectionEquality()
                    .equals(other.originalTranId, originalTranId)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.paymentMode, paymentMode) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMode, paymentMode)) &&
            (identical(other.paidBy, paidBy) ||
                const DeepCollectionEquality().equals(other.paidBy, paidBy)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(originalTranId) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(paymentMode) ^
      const DeepCollectionEquality().hash(paidBy) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $CustomerPaymentsDTOADDExtension on CustomerPaymentsDTOADD {
  CustomerPaymentsDTOADD copyWith(
      {String? clientId,
      String? originalTranId,
      String? notes,
      String? paymentMode,
      String? paidBy,
      double? amount}) {
    return CustomerPaymentsDTOADD(
        clientId: clientId ?? this.clientId,
        originalTranId: originalTranId ?? this.originalTranId,
        notes: notes ?? this.notes,
        paymentMode: paymentMode ?? this.paymentMode,
        paidBy: paidBy ?? this.paidBy,
        amount: amount ?? this.amount);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerSupplierDTO {
  CustomerSupplierDTO({
    this.id,
    this.supplierName,
    this.phoneNumber,
    this.customerInfo,
    this.email,
    this.firstName,
    this.lastName,
    this.active,
    this.favourite,
    this.approved,
    this.approvedBy,
    this.approvedOn,
    this.editedBy,
    this.editedOn,
    this.edited,
    this.editedIp,
    this.createdOn,
    this.createdBy,
    this.createdIp,
  });

  factory CustomerSupplierDTO.fromJson(Map<String, dynamic> json) =>
      _$CustomerSupplierDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'supplierName', includeIfNull: false)
  final String? supplierName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'customerInfo', includeIfNull: false)
  final String? customerInfo;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'favourite', includeIfNull: false)
  final bool? favourite;
  @JsonKey(name: 'approved', includeIfNull: false)
  final bool? approved;
  @JsonKey(name: 'approvedBy', includeIfNull: false)
  final String? approvedBy;
  @JsonKey(name: 'approvedOn', includeIfNull: false)
  final DateTime? approvedOn;
  @JsonKey(name: 'editedBy', includeIfNull: false)
  final String? editedBy;
  @JsonKey(name: 'editedOn', includeIfNull: false)
  final DateTime? editedOn;
  @JsonKey(name: 'edited', includeIfNull: false)
  final bool? edited;
  @JsonKey(name: 'editedIp', includeIfNull: false)
  final String? editedIp;
  @JsonKey(name: 'createdOn', includeIfNull: false)
  final DateTime? createdOn;
  @JsonKey(name: 'createdBy', includeIfNull: false)
  final String? createdBy;
  @JsonKey(name: 'createdIp', includeIfNull: false)
  final String? createdIp;
  static const fromJsonFactory = _$CustomerSupplierDTOFromJson;
  static const toJsonFactory = _$CustomerSupplierDTOToJson;
  Map<String, dynamic> toJson() => _$CustomerSupplierDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerSupplierDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.supplierName, supplierName) ||
                const DeepCollectionEquality()
                    .equals(other.supplierName, supplierName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.customerInfo, customerInfo) ||
                const DeepCollectionEquality()
                    .equals(other.customerInfo, customerInfo)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.approved, approved) ||
                const DeepCollectionEquality()
                    .equals(other.approved, approved)) &&
            (identical(other.approvedBy, approvedBy) ||
                const DeepCollectionEquality()
                    .equals(other.approvedBy, approvedBy)) &&
            (identical(other.approvedOn, approvedOn) ||
                const DeepCollectionEquality()
                    .equals(other.approvedOn, approvedOn)) &&
            (identical(other.editedBy, editedBy) ||
                const DeepCollectionEquality()
                    .equals(other.editedBy, editedBy)) &&
            (identical(other.editedOn, editedOn) ||
                const DeepCollectionEquality()
                    .equals(other.editedOn, editedOn)) &&
            (identical(other.edited, edited) ||
                const DeepCollectionEquality().equals(other.edited, edited)) &&
            (identical(other.editedIp, editedIp) ||
                const DeepCollectionEquality()
                    .equals(other.editedIp, editedIp)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.createdBy, createdBy) ||
                const DeepCollectionEquality()
                    .equals(other.createdBy, createdBy)) &&
            (identical(other.createdIp, createdIp) ||
                const DeepCollectionEquality()
                    .equals(other.createdIp, createdIp)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(supplierName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(customerInfo) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(approved) ^
      const DeepCollectionEquality().hash(approvedBy) ^
      const DeepCollectionEquality().hash(approvedOn) ^
      const DeepCollectionEquality().hash(editedBy) ^
      const DeepCollectionEquality().hash(editedOn) ^
      const DeepCollectionEquality().hash(edited) ^
      const DeepCollectionEquality().hash(editedIp) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(createdBy) ^
      const DeepCollectionEquality().hash(createdIp) ^
      runtimeType.hashCode;
}

extension $CustomerSupplierDTOExtension on CustomerSupplierDTO {
  CustomerSupplierDTO copyWith(
      {String? id,
      String? supplierName,
      String? phoneNumber,
      String? customerInfo,
      String? email,
      String? firstName,
      String? lastName,
      bool? active,
      bool? favourite,
      bool? approved,
      String? approvedBy,
      DateTime? approvedOn,
      String? editedBy,
      DateTime? editedOn,
      bool? edited,
      String? editedIp,
      DateTime? createdOn,
      String? createdBy,
      String? createdIp}) {
    return CustomerSupplierDTO(
        id: id ?? this.id,
        supplierName: supplierName ?? this.supplierName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        customerInfo: customerInfo ?? this.customerInfo,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        active: active ?? this.active,
        favourite: favourite ?? this.favourite,
        approved: approved ?? this.approved,
        approvedBy: approvedBy ?? this.approvedBy,
        approvedOn: approvedOn ?? this.approvedOn,
        editedBy: editedBy ?? this.editedBy,
        editedOn: editedOn ?? this.editedOn,
        edited: edited ?? this.edited,
        editedIp: editedIp ?? this.editedIp,
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        createdIp: createdIp ?? this.createdIp);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerSupplierDTOADD {
  CustomerSupplierDTOADD({
    this.supplierName,
    this.phoneNumber,
    this.email,
    this.addressDetails,
    this.bankDetails,
  });

  factory CustomerSupplierDTOADD.fromJson(Map<String, dynamic> json) =>
      _$CustomerSupplierDTOADDFromJson(json);

  @JsonKey(name: 'supplierName', includeIfNull: false)
  final String? supplierName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'addressDetails', includeIfNull: false)
  final AddressDetails? addressDetails;
  @JsonKey(name: 'bankDetails', includeIfNull: false)
  final BankDetails? bankDetails;
  static const fromJsonFactory = _$CustomerSupplierDTOADDFromJson;
  static const toJsonFactory = _$CustomerSupplierDTOADDToJson;
  Map<String, dynamic> toJson() => _$CustomerSupplierDTOADDToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerSupplierDTOADD &&
            (identical(other.supplierName, supplierName) ||
                const DeepCollectionEquality()
                    .equals(other.supplierName, supplierName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.addressDetails, addressDetails) ||
                const DeepCollectionEquality()
                    .equals(other.addressDetails, addressDetails)) &&
            (identical(other.bankDetails, bankDetails) ||
                const DeepCollectionEquality()
                    .equals(other.bankDetails, bankDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(supplierName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(addressDetails) ^
      const DeepCollectionEquality().hash(bankDetails) ^
      runtimeType.hashCode;
}

extension $CustomerSupplierDTOADDExtension on CustomerSupplierDTOADD {
  CustomerSupplierDTOADD copyWith(
      {String? supplierName,
      String? phoneNumber,
      String? email,
      AddressDetails? addressDetails,
      BankDetails? bankDetails}) {
    return CustomerSupplierDTOADD(
        supplierName: supplierName ?? this.supplierName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        addressDetails: addressDetails ?? this.addressDetails,
        bankDetails: bankDetails ?? this.bankDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerSupplierDTOEdit {
  CustomerSupplierDTOEdit({
    this.supplierName,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.active,
    this.favourite,
    this.editedIp,
  });

  factory CustomerSupplierDTOEdit.fromJson(Map<String, dynamic> json) =>
      _$CustomerSupplierDTOEditFromJson(json);

  @JsonKey(name: 'supplierName', includeIfNull: false)
  final String? supplierName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'favourite', includeIfNull: false)
  final bool? favourite;
  @JsonKey(name: 'editedIp', includeIfNull: false)
  final String? editedIp;
  static const fromJsonFactory = _$CustomerSupplierDTOEditFromJson;
  static const toJsonFactory = _$CustomerSupplierDTOEditToJson;
  Map<String, dynamic> toJson() => _$CustomerSupplierDTOEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerSupplierDTOEdit &&
            (identical(other.supplierName, supplierName) ||
                const DeepCollectionEquality()
                    .equals(other.supplierName, supplierName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.editedIp, editedIp) ||
                const DeepCollectionEquality()
                    .equals(other.editedIp, editedIp)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(supplierName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(editedIp) ^
      runtimeType.hashCode;
}

extension $CustomerSupplierDTOEditExtension on CustomerSupplierDTOEdit {
  CustomerSupplierDTOEdit copyWith(
      {String? supplierName,
      String? phoneNumber,
      String? email,
      String? firstName,
      String? lastName,
      bool? active,
      bool? favourite,
      String? editedIp}) {
    return CustomerSupplierDTOEdit(
        supplierName: supplierName ?? this.supplierName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        active: active ?? this.active,
        favourite: favourite ?? this.favourite,
        editedIp: editedIp ?? this.editedIp);
  }
}

@JsonSerializable(explicitToJson: true)
class CustomerSupplierDTOView {
  CustomerSupplierDTOView({
    this.id,
    this.valuedueDate,
    this.supplierName,
    this.phoneNumber,
    this.firstName,
    this.email,
    this.lastName,
    this.balance,
    this.dueDate,
    this.paymentStatus,
  });

  factory CustomerSupplierDTOView.fromJson(Map<String, dynamic> json) =>
      _$CustomerSupplierDTOViewFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'valuedueDate', includeIfNull: false)
  final String? valuedueDate;
  @JsonKey(name: 'supplierName', includeIfNull: false)
  final String? supplierName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'balance', includeIfNull: false)
  final String? balance;
  @JsonKey(name: 'dueDate', includeIfNull: false)
  final String? dueDate;
  @JsonKey(name: 'paymentStatus', includeIfNull: false)
  final String? paymentStatus;
  static const fromJsonFactory = _$CustomerSupplierDTOViewFromJson;
  static const toJsonFactory = _$CustomerSupplierDTOViewToJson;
  Map<String, dynamic> toJson() => _$CustomerSupplierDTOViewToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerSupplierDTOView &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.valuedueDate, valuedueDate) ||
                const DeepCollectionEquality()
                    .equals(other.valuedueDate, valuedueDate)) &&
            (identical(other.supplierName, supplierName) ||
                const DeepCollectionEquality()
                    .equals(other.supplierName, supplierName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.paymentStatus, paymentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.paymentStatus, paymentStatus)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(valuedueDate) ^
      const DeepCollectionEquality().hash(supplierName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(paymentStatus) ^
      runtimeType.hashCode;
}

extension $CustomerSupplierDTOViewExtension on CustomerSupplierDTOView {
  CustomerSupplierDTOView copyWith(
      {int? id,
      String? valuedueDate,
      String? supplierName,
      String? phoneNumber,
      String? firstName,
      String? email,
      String? lastName,
      String? balance,
      String? dueDate,
      String? paymentStatus}) {
    return CustomerSupplierDTOView(
        id: id ?? this.id,
        valuedueDate: valuedueDate ?? this.valuedueDate,
        supplierName: supplierName ?? this.supplierName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        lastName: lastName ?? this.lastName,
        balance: balance ?? this.balance,
        dueDate: dueDate ?? this.dueDate,
        paymentStatus: paymentStatus ?? this.paymentStatus);
  }
}

@JsonSerializable(explicitToJson: true)
class EditDueDate {
  EditDueDate({
    this.dueDate,
    this.transactionId,
  });

  factory EditDueDate.fromJson(Map<String, dynamic> json) =>
      _$EditDueDateFromJson(json);

  @JsonKey(name: 'dueDate', includeIfNull: false)
  final String? dueDate;
  @JsonKey(name: 'transactionId', includeIfNull: false)
  final String? transactionId;
  static const fromJsonFactory = _$EditDueDateFromJson;
  static const toJsonFactory = _$EditDueDateToJson;
  Map<String, dynamic> toJson() => _$EditDueDateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditDueDate &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(transactionId) ^
      runtimeType.hashCode;
}

extension $EditDueDateExtension on EditDueDate {
  EditDueDate copyWith({String? dueDate, String? transactionId}) {
    return EditDueDate(
        dueDate: dueDate ?? this.dueDate,
        transactionId: transactionId ?? this.transactionId);
  }
}

@JsonSerializable(explicitToJson: true)
class FilterBy {
  FilterBy({
    this.filteroption,
    this.filteroptionvalue,
  });

  factory FilterBy.fromJson(Map<String, dynamic> json) =>
      _$FilterByFromJson(json);

  @JsonKey(
      name: 'filteroption',
      includeIfNull: false,
      toJson: filteroptionToJson,
      fromJson: filteroptionFromJson)
  final enums.Filteroption? filteroption;
  @JsonKey(
      name: 'filteroptionvalue', includeIfNull: false, defaultValue: <String>[])
  final List<String>? filteroptionvalue;
  static const fromJsonFactory = _$FilterByFromJson;
  static const toJsonFactory = _$FilterByToJson;
  Map<String, dynamic> toJson() => _$FilterByToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilterBy &&
            (identical(other.filteroption, filteroption) ||
                const DeepCollectionEquality()
                    .equals(other.filteroption, filteroption)) &&
            (identical(other.filteroptionvalue, filteroptionvalue) ||
                const DeepCollectionEquality()
                    .equals(other.filteroptionvalue, filteroptionvalue)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(filteroption) ^
      const DeepCollectionEquality().hash(filteroptionvalue) ^
      runtimeType.hashCode;
}

extension $FilterByExtension on FilterBy {
  FilterBy copyWith(
      {enums.Filteroption? filteroption, List<String>? filteroptionvalue}) {
    return FilterBy(
        filteroption: filteroption ?? this.filteroption,
        filteroptionvalue: filteroptionvalue ?? this.filteroptionvalue);
  }
}

@JsonSerializable(explicitToJson: true)
class GetCustomerClientBy {
  GetCustomerClientBy({
    this.id,
  });

  factory GetCustomerClientBy.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerClientByFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  static const fromJsonFactory = _$GetCustomerClientByFromJson;
  static const toJsonFactory = _$GetCustomerClientByToJson;
  Map<String, dynamic> toJson() => _$GetCustomerClientByToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetCustomerClientBy &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^ runtimeType.hashCode;
}

extension $GetCustomerClientByExtension on GetCustomerClientBy {
  GetCustomerClientBy copyWith({int? id}) {
    return GetCustomerClientBy(id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class LastBackupDTOAdd {
  LastBackupDTOAdd({
    this.businessId,
    this.lastBackupDate,
  });

  factory LastBackupDTOAdd.fromJson(Map<String, dynamic> json) =>
      _$LastBackupDTOAddFromJson(json);

  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  @JsonKey(name: 'lastBackupDate', includeIfNull: false)
  final String? lastBackupDate;
  static const fromJsonFactory = _$LastBackupDTOAddFromJson;
  static const toJsonFactory = _$LastBackupDTOAddToJson;
  Map<String, dynamic> toJson() => _$LastBackupDTOAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastBackupDTOAdd &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)) &&
            (identical(other.lastBackupDate, lastBackupDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastBackupDate, lastBackupDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(businessId) ^
      const DeepCollectionEquality().hash(lastBackupDate) ^
      runtimeType.hashCode;
}

extension $LastBackupDTOAddExtension on LastBackupDTOAdd {
  LastBackupDTOAdd copyWith({String? businessId, String? lastBackupDate}) {
    return LastBackupDTOAdd(
        businessId: businessId ?? this.businessId,
        lastBackupDate: lastBackupDate ?? this.lastBackupDate);
  }
}

@JsonSerializable(explicitToJson: true)
class LedgerBookDTO {
  LedgerBookDTO({
    this.ledgerbookType,
    this.transactiondate,
    this.transactiontime,
    this.cashbookCategoryid,
    this.amount,
    this.remarks,
    this.attachments,
    this.paymentModeId,
  });

  factory LedgerBookDTO.fromJson(Map<String, dynamic> json) =>
      _$LedgerBookDTOFromJson(json);

  @JsonKey(
      name: 'ledgerbookType',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? ledgerbookType;
  @JsonKey(name: 'transactiondate', includeIfNull: false)
  final String? transactiondate;
  @JsonKey(name: 'transactiontime', includeIfNull: false)
  final String? transactiontime;
  @JsonKey(name: 'cashbookCategoryid', includeIfNull: false)
  final int? cashbookCategoryid;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double? amount;
  @JsonKey(name: 'remarks', includeIfNull: false)
  final String? remarks;
  @JsonKey(name: 'attachments', includeIfNull: false, defaultValue: <String>[])
  final List<String>? attachments;
  @JsonKey(name: 'paymentModeId', includeIfNull: false)
  final int? paymentModeId;
  static const fromJsonFactory = _$LedgerBookDTOFromJson;
  static const toJsonFactory = _$LedgerBookDTOToJson;
  Map<String, dynamic> toJson() => _$LedgerBookDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LedgerBookDTO &&
            (identical(other.ledgerbookType, ledgerbookType) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerbookType, ledgerbookType)) &&
            (identical(other.transactiondate, transactiondate) ||
                const DeepCollectionEquality()
                    .equals(other.transactiondate, transactiondate)) &&
            (identical(other.transactiontime, transactiontime) ||
                const DeepCollectionEquality()
                    .equals(other.transactiontime, transactiontime)) &&
            (identical(other.cashbookCategoryid, cashbookCategoryid) ||
                const DeepCollectionEquality()
                    .equals(other.cashbookCategoryid, cashbookCategoryid)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.paymentModeId, paymentModeId) ||
                const DeepCollectionEquality()
                    .equals(other.paymentModeId, paymentModeId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(ledgerbookType) ^
      const DeepCollectionEquality().hash(transactiondate) ^
      const DeepCollectionEquality().hash(transactiontime) ^
      const DeepCollectionEquality().hash(cashbookCategoryid) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(paymentModeId) ^
      runtimeType.hashCode;
}

extension $LedgerBookDTOExtension on LedgerBookDTO {
  LedgerBookDTO copyWith(
      {enums.CashbookType? ledgerbookType,
      String? transactiondate,
      String? transactiontime,
      int? cashbookCategoryid,
      double? amount,
      String? remarks,
      List<String>? attachments,
      int? paymentModeId}) {
    return LedgerBookDTO(
        ledgerbookType: ledgerbookType ?? this.ledgerbookType,
        transactiondate: transactiondate ?? this.transactiondate,
        transactiontime: transactiontime ?? this.transactiontime,
        cashbookCategoryid: cashbookCategoryid ?? this.cashbookCategoryid,
        amount: amount ?? this.amount,
        remarks: remarks ?? this.remarks,
        attachments: attachments ?? this.attachments,
        paymentModeId: paymentModeId ?? this.paymentModeId);
  }
}

@JsonSerializable(explicitToJson: true)
class LedgerBookDTODelete {
  LedgerBookDTODelete({
    this.id,
  });

  factory LedgerBookDTODelete.fromJson(Map<String, dynamic> json) =>
      _$LedgerBookDTODeleteFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  static const fromJsonFactory = _$LedgerBookDTODeleteFromJson;
  static const toJsonFactory = _$LedgerBookDTODeleteToJson;
  Map<String, dynamic> toJson() => _$LedgerBookDTODeleteToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LedgerBookDTODelete &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^ runtimeType.hashCode;
}

extension $LedgerBookDTODeleteExtension on LedgerBookDTODelete {
  LedgerBookDTODelete copyWith({int? id}) {
    return LedgerBookDTODelete(id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class LedgerBookDTOEdit {
  LedgerBookDTOEdit({
    this.id,
    this.ledgerbookType,
    this.transactionDate,
    this.transactionTime,
    this.cashbookCategoryid,
    this.amount,
    this.remarks,
    this.attachments,
    this.paymentModeId,
  });

  factory LedgerBookDTOEdit.fromJson(Map<String, dynamic> json) =>
      _$LedgerBookDTOEditFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(
      name: 'ledgerbookType',
      includeIfNull: false,
      toJson: cashbookTypeToJson,
      fromJson: cashbookTypeFromJson)
  final enums.CashbookType? ledgerbookType;
  @JsonKey(name: 'transaction_date', includeIfNull: false)
  final String? transactionDate;
  @JsonKey(name: 'transaction_time', includeIfNull: false)
  final String? transactionTime;
  @JsonKey(name: 'cashbookCategoryid', includeIfNull: false)
  final int? cashbookCategoryid;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double? amount;
  @JsonKey(name: 'remarks', includeIfNull: false)
  final String? remarks;
  @JsonKey(name: 'attachments', includeIfNull: false, defaultValue: <String>[])
  final List<String>? attachments;
  @JsonKey(name: 'paymentModeId', includeIfNull: false)
  final int? paymentModeId;
  static const fromJsonFactory = _$LedgerBookDTOEditFromJson;
  static const toJsonFactory = _$LedgerBookDTOEditToJson;
  Map<String, dynamic> toJson() => _$LedgerBookDTOEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LedgerBookDTOEdit &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ledgerbookType, ledgerbookType) ||
                const DeepCollectionEquality()
                    .equals(other.ledgerbookType, ledgerbookType)) &&
            (identical(other.transactionDate, transactionDate) ||
                const DeepCollectionEquality()
                    .equals(other.transactionDate, transactionDate)) &&
            (identical(other.transactionTime, transactionTime) ||
                const DeepCollectionEquality()
                    .equals(other.transactionTime, transactionTime)) &&
            (identical(other.cashbookCategoryid, cashbookCategoryid) ||
                const DeepCollectionEquality()
                    .equals(other.cashbookCategoryid, cashbookCategoryid)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.paymentModeId, paymentModeId) ||
                const DeepCollectionEquality()
                    .equals(other.paymentModeId, paymentModeId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ledgerbookType) ^
      const DeepCollectionEquality().hash(transactionDate) ^
      const DeepCollectionEquality().hash(transactionTime) ^
      const DeepCollectionEquality().hash(cashbookCategoryid) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(paymentModeId) ^
      runtimeType.hashCode;
}

extension $LedgerBookDTOEditExtension on LedgerBookDTOEdit {
  LedgerBookDTOEdit copyWith(
      {int? id,
      enums.CashbookType? ledgerbookType,
      String? transactionDate,
      String? transactionTime,
      int? cashbookCategoryid,
      double? amount,
      String? remarks,
      List<String>? attachments,
      int? paymentModeId}) {
    return LedgerBookDTOEdit(
        id: id ?? this.id,
        ledgerbookType: ledgerbookType ?? this.ledgerbookType,
        transactionDate: transactionDate ?? this.transactionDate,
        transactionTime: transactionTime ?? this.transactionTime,
        cashbookCategoryid: cashbookCategoryid ?? this.cashbookCategoryid,
        amount: amount ?? this.amount,
        remarks: remarks ?? this.remarks,
        attachments: attachments ?? this.attachments,
        paymentModeId: paymentModeId ?? this.paymentModeId);
  }
}

@JsonSerializable(explicitToJson: true)
class OTPValidation {
  OTPValidation({
    this.otp,
  });

  factory OTPValidation.fromJson(Map<String, dynamic> json) =>
      _$OTPValidationFromJson(json);

  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  static const fromJsonFactory = _$OTPValidationFromJson;
  static const toJsonFactory = _$OTPValidationToJson;
  Map<String, dynamic> toJson() => _$OTPValidationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OTPValidation &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(otp) ^ runtimeType.hashCode;
}

extension $OTPValidationExtension on OTPValidation {
  OTPValidation copyWith({String? otp}) {
    return OTPValidation(otp: otp ?? this.otp);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentmodeAdd {
  PaymentmodeAdd({
    this.name,
    this.businessId,
  });

  factory PaymentmodeAdd.fromJson(Map<String, dynamic> json) =>
      _$PaymentmodeAddFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  static const fromJsonFactory = _$PaymentmodeAddFromJson;
  static const toJsonFactory = _$PaymentmodeAddToJson;
  Map<String, dynamic> toJson() => _$PaymentmodeAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentmodeAdd &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(businessId) ^
      runtimeType.hashCode;
}

extension $PaymentmodeAddExtension on PaymentmodeAdd {
  PaymentmodeAdd copyWith({String? name, String? businessId}) {
    return PaymentmodeAdd(
        name: name ?? this.name, businessId: businessId ?? this.businessId);
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentmodeEdit {
  PaymentmodeEdit({
    this.name,
    this.paymentmodeId,
    this.businessId,
  });

  factory PaymentmodeEdit.fromJson(Map<String, dynamic> json) =>
      _$PaymentmodeEditFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'paymentmodeId', includeIfNull: false)
  final int? paymentmodeId;
  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  static const fromJsonFactory = _$PaymentmodeEditFromJson;
  static const toJsonFactory = _$PaymentmodeEditToJson;
  Map<String, dynamic> toJson() => _$PaymentmodeEditToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaymentmodeEdit &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.paymentmodeId, paymentmodeId) ||
                const DeepCollectionEquality()
                    .equals(other.paymentmodeId, paymentmodeId)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(paymentmodeId) ^
      const DeepCollectionEquality().hash(businessId) ^
      runtimeType.hashCode;
}

extension $PaymentmodeEditExtension on PaymentmodeEdit {
  PaymentmodeEdit copyWith(
      {String? name, int? paymentmodeId, String? businessId}) {
    return PaymentmodeEdit(
        name: name ?? this.name,
        paymentmodeId: paymentmodeId ?? this.paymentmodeId,
        businessId: businessId ?? this.businessId);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductDTOAdd {
  ProductDTOAdd({
    this.name,
    this.category,
    this.longDesc,
    this.sellingPrice,
    this.buyingPrice,
    this.quantity,
    this.businessId,
    this.active,
    this.isPhysicalProduct,
    this.productType,
    this.trackInventory,
  });

  factory ProductDTOAdd.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOAddFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'category', includeIfNull: false)
  final String? category;
  @JsonKey(name: 'longDesc', includeIfNull: false)
  final String? longDesc;
  @JsonKey(name: 'sellingPrice', includeIfNull: false)
  final double? sellingPrice;
  @JsonKey(name: 'buyingPrice', includeIfNull: false)
  final double? buyingPrice;
  @JsonKey(name: 'quantity', includeIfNull: false)
  final int? quantity;
  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'isPhysicalProduct', includeIfNull: false)
  final bool? isPhysicalProduct;
  @JsonKey(
      name: 'productType',
      includeIfNull: false,
      toJson: productTypeToJson,
      fromJson: productTypeFromJson)
  final enums.ProductType? productType;
  @JsonKey(name: 'trackInventory', includeIfNull: false)
  final bool? trackInventory;
  static const fromJsonFactory = _$ProductDTOAddFromJson;
  static const toJsonFactory = _$ProductDTOAddToJson;
  Map<String, dynamic> toJson() => _$ProductDTOAddToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductDTOAdd &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.longDesc, longDesc) ||
                const DeepCollectionEquality()
                    .equals(other.longDesc, longDesc)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.buyingPrice, buyingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.buyingPrice, buyingPrice)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.isPhysicalProduct, isPhysicalProduct) ||
                const DeepCollectionEquality()
                    .equals(other.isPhysicalProduct, isPhysicalProduct)) &&
            (identical(other.productType, productType) ||
                const DeepCollectionEquality()
                    .equals(other.productType, productType)) &&
            (identical(other.trackInventory, trackInventory) ||
                const DeepCollectionEquality()
                    .equals(other.trackInventory, trackInventory)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(longDesc) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(buyingPrice) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(businessId) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(isPhysicalProduct) ^
      const DeepCollectionEquality().hash(productType) ^
      const DeepCollectionEquality().hash(trackInventory) ^
      runtimeType.hashCode;
}

extension $ProductDTOAddExtension on ProductDTOAdd {
  ProductDTOAdd copyWith(
      {String? name,
      String? category,
      String? longDesc,
      double? sellingPrice,
      double? buyingPrice,
      int? quantity,
      String? businessId,
      bool? active,
      bool? isPhysicalProduct,
      enums.ProductType? productType,
      bool? trackInventory}) {
    return ProductDTOAdd(
        name: name ?? this.name,
        category: category ?? this.category,
        longDesc: longDesc ?? this.longDesc,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        quantity: quantity ?? this.quantity,
        businessId: businessId ?? this.businessId,
        active: active ?? this.active,
        isPhysicalProduct: isPhysicalProduct ?? this.isPhysicalProduct,
        productType: productType ?? this.productType,
        trackInventory: trackInventory ?? this.trackInventory);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductEditDTO {
  ProductEditDTO({
    this.name,
    this.category,
    this.longDesc,
    this.sellingPrice,
    this.buyingPrice,
    this.quantity,
    this.businessId,
    this.active,
    this.trackInventory,
  });

  factory ProductEditDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductEditDTOFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'category', includeIfNull: false)
  final String? category;
  @JsonKey(name: 'longDesc', includeIfNull: false)
  final String? longDesc;
  @JsonKey(name: 'sellingPrice', includeIfNull: false)
  final double? sellingPrice;
  @JsonKey(name: 'buyingPrice', includeIfNull: false)
  final double? buyingPrice;
  @JsonKey(name: 'quantity', includeIfNull: false)
  final int? quantity;
  @JsonKey(name: 'businessId', includeIfNull: false)
  final String? businessId;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'trackInventory', includeIfNull: false)
  final bool? trackInventory;
  static const fromJsonFactory = _$ProductEditDTOFromJson;
  static const toJsonFactory = _$ProductEditDTOToJson;
  Map<String, dynamic> toJson() => _$ProductEditDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductEditDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.longDesc, longDesc) ||
                const DeepCollectionEquality()
                    .equals(other.longDesc, longDesc)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.buyingPrice, buyingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.buyingPrice, buyingPrice)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.trackInventory, trackInventory) ||
                const DeepCollectionEquality()
                    .equals(other.trackInventory, trackInventory)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(longDesc) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(buyingPrice) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(businessId) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(trackInventory) ^
      runtimeType.hashCode;
}

extension $ProductEditDTOExtension on ProductEditDTO {
  ProductEditDTO copyWith(
      {String? name,
      String? category,
      String? longDesc,
      double? sellingPrice,
      double? buyingPrice,
      int? quantity,
      String? businessId,
      bool? active,
      bool? trackInventory}) {
    return ProductEditDTO(
        name: name ?? this.name,
        category: category ?? this.category,
        longDesc: longDesc ?? this.longDesc,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        quantity: quantity ?? this.quantity,
        businessId: businessId ?? this.businessId,
        active: active ?? this.active,
        trackInventory: trackInventory ?? this.trackInventory);
  }
}

@JsonSerializable(explicitToJson: true)
class ProductViewDTO {
  ProductViewDTO({
    this.id,
    this.name,
    this.category,
    this.quantity,
    this.categoryID,
    this.longDesc,
    this.sellingPrice,
    this.buyingPrice,
    this.customerId,
    this.active,
    this.deleted,
    this.userId,
  });

  factory ProductViewDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductViewDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'category', includeIfNull: false)
  final String? category;
  @JsonKey(name: 'quantity', includeIfNull: false)
  final int? quantity;
  @JsonKey(name: 'categoryID', includeIfNull: false)
  final String? categoryID;
  @JsonKey(name: 'longDesc', includeIfNull: false)
  final String? longDesc;
  @JsonKey(name: 'sellingPrice', includeIfNull: false)
  final double? sellingPrice;
  @JsonKey(name: 'buyingPrice', includeIfNull: false)
  final double? buyingPrice;
  @JsonKey(name: 'customerId', includeIfNull: false)
  final String? customerId;
  @JsonKey(name: 'active', includeIfNull: false)
  final bool? active;
  @JsonKey(name: 'deleted', includeIfNull: false)
  final bool? deleted;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  static const fromJsonFactory = _$ProductViewDTOFromJson;
  static const toJsonFactory = _$ProductViewDTOToJson;
  Map<String, dynamic> toJson() => _$ProductViewDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductViewDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.categoryID, categoryID) ||
                const DeepCollectionEquality()
                    .equals(other.categoryID, categoryID)) &&
            (identical(other.longDesc, longDesc) ||
                const DeepCollectionEquality()
                    .equals(other.longDesc, longDesc)) &&
            (identical(other.sellingPrice, sellingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.sellingPrice, sellingPrice)) &&
            (identical(other.buyingPrice, buyingPrice) ||
                const DeepCollectionEquality()
                    .equals(other.buyingPrice, buyingPrice)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(categoryID) ^
      const DeepCollectionEquality().hash(longDesc) ^
      const DeepCollectionEquality().hash(sellingPrice) ^
      const DeepCollectionEquality().hash(buyingPrice) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $ProductViewDTOExtension on ProductViewDTO {
  ProductViewDTO copyWith(
      {String? id,
      String? name,
      String? category,
      int? quantity,
      String? categoryID,
      String? longDesc,
      double? sellingPrice,
      double? buyingPrice,
      String? customerId,
      bool? active,
      bool? deleted,
      String? userId}) {
    return ProductViewDTO(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        quantity: quantity ?? this.quantity,
        categoryID: categoryID ?? this.categoryID,
        longDesc: longDesc ?? this.longDesc,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        customerId: customerId ?? this.customerId,
        active: active ?? this.active,
        deleted: deleted ?? this.deleted,
        userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class ResetPassword {
  ResetPassword({
    this.phonenumber,
    this.countrycode,
  });

  factory ResetPassword.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordFromJson(json);

  @JsonKey(name: 'phonenumber', includeIfNull: false)
  final String? phonenumber;
  @JsonKey(name: 'countrycode', includeIfNull: false)
  final String? countrycode;
  static const fromJsonFactory = _$ResetPasswordFromJson;
  static const toJsonFactory = _$ResetPasswordToJson;
  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ResetPassword &&
            (identical(other.phonenumber, phonenumber) ||
                const DeepCollectionEquality()
                    .equals(other.phonenumber, phonenumber)) &&
            (identical(other.countrycode, countrycode) ||
                const DeepCollectionEquality()
                    .equals(other.countrycode, countrycode)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phonenumber) ^
      const DeepCollectionEquality().hash(countrycode) ^
      runtimeType.hashCode;
}

extension $ResetPasswordExtension on ResetPassword {
  ResetPassword copyWith({String? phonenumber, String? countrycode}) {
    return ResetPassword(
        phonenumber: phonenumber ?? this.phonenumber,
        countrycode: countrycode ?? this.countrycode);
  }
}

@JsonSerializable(explicitToJson: true)
class Response$ {
  Response$({
    this.success,
    this.errordesc,
    this.result,
    this.id,
  });

  factory Response$.fromJson(Map<String, dynamic> json) =>
      _$Response$FromJson(json);

  @JsonKey(name: 'success', includeIfNull: false)
  final bool? success;
  @JsonKey(name: 'errordesc', includeIfNull: false)
  final String? errordesc;
  @JsonKey(name: 'result', includeIfNull: false)
  final String? result;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$Response$FromJson;
  static const toJsonFactory = _$Response$ToJson;
  Map<String, dynamic> toJson() => _$Response$ToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Response$ &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.errordesc, errordesc) ||
                const DeepCollectionEquality()
                    .equals(other.errordesc, errordesc)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(errordesc) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $Response$Extension on Response$ {
  Response$ copyWith(
      {bool? success, String? errordesc, String? result, String? id}) {
    return Response$(
        success: success ?? this.success,
        errordesc: errordesc ?? this.errordesc,
        result: result ?? this.result,
        id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class SaleProductsDTO {
  SaleProductsDTO({
    this.name,
    this.longDesc,
    this.price,
    this.id,
  });

  factory SaleProductsDTO.fromJson(Map<String, dynamic> json) =>
      _$SaleProductsDTOFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'longDesc', includeIfNull: false)
  final String? longDesc;
  @JsonKey(name: 'price', includeIfNull: false)
  final String? price;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$SaleProductsDTOFromJson;
  static const toJsonFactory = _$SaleProductsDTOToJson;
  Map<String, dynamic> toJson() => _$SaleProductsDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaleProductsDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.longDesc, longDesc) ||
                const DeepCollectionEquality()
                    .equals(other.longDesc, longDesc)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(longDesc) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $SaleProductsDTOExtension on SaleProductsDTO {
  SaleProductsDTO copyWith(
      {String? name, String? longDesc, String? price, String? id}) {
    return SaleProductsDTO(
        name: name ?? this.name,
        longDesc: longDesc ?? this.longDesc,
        price: price ?? this.price,
        id: id ?? this.id);
  }
}

@JsonSerializable(explicitToJson: true)
class SupplierPaymentsDTO {
  SupplierPaymentsDTO({
    this.supplierId,
    this.originalTranId,
    this.notes,
    this.paymentMode,
    this.paidBy,
    this.amount,
  });

  factory SupplierPaymentsDTO.fromJson(Map<String, dynamic> json) =>
      _$SupplierPaymentsDTOFromJson(json);

  @JsonKey(name: 'supplierId', includeIfNull: false)
  final String? supplierId;
  @JsonKey(name: 'originalTranId', includeIfNull: false)
  final String? originalTranId;
  @JsonKey(name: 'notes', includeIfNull: false)
  final String? notes;
  @JsonKey(name: 'paymentMode', includeIfNull: false)
  final String? paymentMode;
  @JsonKey(name: 'paidBy', includeIfNull: false)
  final String? paidBy;
  @JsonKey(name: 'amount', includeIfNull: false)
  final double? amount;
  static const fromJsonFactory = _$SupplierPaymentsDTOFromJson;
  static const toJsonFactory = _$SupplierPaymentsDTOToJson;
  Map<String, dynamic> toJson() => _$SupplierPaymentsDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SupplierPaymentsDTO &&
            (identical(other.supplierId, supplierId) ||
                const DeepCollectionEquality()
                    .equals(other.supplierId, supplierId)) &&
            (identical(other.originalTranId, originalTranId) ||
                const DeepCollectionEquality()
                    .equals(other.originalTranId, originalTranId)) &&
            (identical(other.notes, notes) ||
                const DeepCollectionEquality().equals(other.notes, notes)) &&
            (identical(other.paymentMode, paymentMode) ||
                const DeepCollectionEquality()
                    .equals(other.paymentMode, paymentMode)) &&
            (identical(other.paidBy, paidBy) ||
                const DeepCollectionEquality().equals(other.paidBy, paidBy)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(supplierId) ^
      const DeepCollectionEquality().hash(originalTranId) ^
      const DeepCollectionEquality().hash(notes) ^
      const DeepCollectionEquality().hash(paymentMode) ^
      const DeepCollectionEquality().hash(paidBy) ^
      const DeepCollectionEquality().hash(amount) ^
      runtimeType.hashCode;
}

extension $SupplierPaymentsDTOExtension on SupplierPaymentsDTO {
  SupplierPaymentsDTO copyWith(
      {String? supplierId,
      String? originalTranId,
      String? notes,
      String? paymentMode,
      String? paidBy,
      double? amount}) {
    return SupplierPaymentsDTO(
        supplierId: supplierId ?? this.supplierId,
        originalTranId: originalTranId ?? this.originalTranId,
        notes: notes ?? this.notes,
        paymentMode: paymentMode ?? this.paymentMode,
        paidBy: paidBy ?? this.paidBy,
        amount: amount ?? this.amount);
  }
}

@JsonSerializable(explicitToJson: true)
class SupplierTransactionsDTOADD {
  SupplierTransactionsDTOADD({
    this.supplierid,
    this.totalAmount,
    this.amountPaid,
    this.products,
    this.attachments,
    this.itemDesc,
    this.datedue,
  });

  factory SupplierTransactionsDTOADD.fromJson(Map<String, dynamic> json) =>
      _$SupplierTransactionsDTOADDFromJson(json);

  @JsonKey(name: 'supplierid', includeIfNull: false)
  final String? supplierid;
  @JsonKey(name: 'totalAmount', includeIfNull: false)
  final double? totalAmount;
  @JsonKey(name: 'amountPaid', includeIfNull: false)
  final double? amountPaid;
  @JsonKey(name: 'products', includeIfNull: false, defaultValue: <String>[])
  final List<String>? products;
  @JsonKey(name: 'attachments', includeIfNull: false, defaultValue: <String>[])
  final List<String>? attachments;
  @JsonKey(name: 'itemDesc', includeIfNull: false)
  final String? itemDesc;
  @JsonKey(name: 'datedue', includeIfNull: false)
  final String? datedue;
  static const fromJsonFactory = _$SupplierTransactionsDTOADDFromJson;
  static const toJsonFactory = _$SupplierTransactionsDTOADDToJson;
  Map<String, dynamic> toJson() => _$SupplierTransactionsDTOADDToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SupplierTransactionsDTOADD &&
            (identical(other.supplierid, supplierid) ||
                const DeepCollectionEquality()
                    .equals(other.supplierid, supplierid)) &&
            (identical(other.totalAmount, totalAmount) ||
                const DeepCollectionEquality()
                    .equals(other.totalAmount, totalAmount)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)) &&
            (identical(other.itemDesc, itemDesc) ||
                const DeepCollectionEquality()
                    .equals(other.itemDesc, itemDesc)) &&
            (identical(other.datedue, datedue) ||
                const DeepCollectionEquality().equals(other.datedue, datedue)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(supplierid) ^
      const DeepCollectionEquality().hash(totalAmount) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(attachments) ^
      const DeepCollectionEquality().hash(itemDesc) ^
      const DeepCollectionEquality().hash(datedue) ^
      runtimeType.hashCode;
}

extension $SupplierTransactionsDTOADDExtension on SupplierTransactionsDTOADD {
  SupplierTransactionsDTOADD copyWith(
      {String? supplierid,
      double? totalAmount,
      double? amountPaid,
      List<String>? products,
      List<String>? attachments,
      String? itemDesc,
      String? datedue}) {
    return SupplierTransactionsDTOADD(
        supplierid: supplierid ?? this.supplierid,
        totalAmount: totalAmount ?? this.totalAmount,
        amountPaid: amountPaid ?? this.amountPaid,
        products: products ?? this.products,
        attachments: attachments ?? this.attachments,
        itemDesc: itemDesc ?? this.itemDesc,
        datedue: datedue ?? this.datedue);
  }
}

@JsonSerializable(explicitToJson: true)
class TenziBookLogin {
  TenziBookLogin({
    this.username,
    this.countrycode,
    this.password,
  });

  factory TenziBookLogin.fromJson(Map<String, dynamic> json) =>
      _$TenziBookLoginFromJson(json);

  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;
  @JsonKey(name: 'countrycode', includeIfNull: false)
  final String? countrycode;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  static const fromJsonFactory = _$TenziBookLoginFromJson;
  static const toJsonFactory = _$TenziBookLoginToJson;
  Map<String, dynamic> toJson() => _$TenziBookLoginToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TenziBookLogin &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.countrycode, countrycode) ||
                const DeepCollectionEquality()
                    .equals(other.countrycode, countrycode)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(countrycode) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $TenziBookLoginExtension on TenziBookLogin {
  TenziBookLogin copyWith(
      {String? username, String? countrycode, String? password}) {
    return TenziBookLogin(
        username: username ?? this.username,
        countrycode: countrycode ?? this.countrycode,
        password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class TenzibookRegisterDTO {
  TenzibookRegisterDTO({
    this.password,
    this.firstName,
    this.lastName,
    this.businessName,
    this.email,
    this.phoneNumber,
    this.countryCode,
    this.deviceType,
    this.os,
    this.deviceId,
    this.country,
  });

  factory TenzibookRegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$TenzibookRegisterDTOFromJson(json);

  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'businessName', includeIfNull: false)
  final String? businessName;
  @JsonKey(name: 'email', includeIfNull: false)
  final String? email;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'countryCode', includeIfNull: false)
  final String? countryCode;
  @JsonKey(name: 'deviceType', includeIfNull: false)
  final String? deviceType;
  @JsonKey(name: 'os', includeIfNull: false)
  final String? os;
  @JsonKey(name: 'deviceId', includeIfNull: false)
  final String? deviceId;
  @JsonKey(name: 'country', includeIfNull: false)
  final String? country;
  static const fromJsonFactory = _$TenzibookRegisterDTOFromJson;
  static const toJsonFactory = _$TenzibookRegisterDTOToJson;
  Map<String, dynamic> toJson() => _$TenzibookRegisterDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TenzibookRegisterDTO &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.businessName, businessName) ||
                const DeepCollectionEquality()
                    .equals(other.businessName, businessName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.deviceType, deviceType) ||
                const DeepCollectionEquality()
                    .equals(other.deviceType, deviceType)) &&
            (identical(other.os, os) ||
                const DeepCollectionEquality().equals(other.os, os)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(businessName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(deviceType) ^
      const DeepCollectionEquality().hash(os) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(country) ^
      runtimeType.hashCode;
}

extension $TenzibookRegisterDTOExtension on TenzibookRegisterDTO {
  TenzibookRegisterDTO copyWith(
      {String? password,
      String? firstName,
      String? lastName,
      String? businessName,
      String? email,
      String? phoneNumber,
      String? countryCode,
      String? deviceType,
      String? os,
      String? deviceId,
      String? country}) {
    return TenzibookRegisterDTO(
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        businessName: businessName ?? this.businessName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        countryCode: countryCode ?? this.countryCode,
        deviceType: deviceType ?? this.deviceType,
        os: os ?? this.os,
        deviceId: deviceId ?? this.deviceId,
        country: country ?? this.country);
  }
}

@JsonSerializable(explicitToJson: true)
class Transaction {
  Transaction({
    this.transactionId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @JsonKey(name: 'transactionId', includeIfNull: false)
  final String? transactionId;
  static const fromJsonFactory = _$TransactionFromJson;
  static const toJsonFactory = _$TransactionToJson;
  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Transaction &&
            (identical(other.transactionId, transactionId) ||
                const DeepCollectionEquality()
                    .equals(other.transactionId, transactionId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(transactionId) ^ runtimeType.hashCode;
}

extension $TransactionExtension on Transaction {
  Transaction copyWith({String? transactionId}) {
    return Transaction(transactionId: transactionId ?? this.transactionId);
  }
}

@JsonSerializable(explicitToJson: true)
class ValidateDetails {
  ValidateDetails({
    this.countryCode,
    this.phonenumber,
  });

  factory ValidateDetails.fromJson(Map<String, dynamic> json) =>
      _$ValidateDetailsFromJson(json);

  @JsonKey(name: 'countryCode', includeIfNull: false)
  final String? countryCode;
  @JsonKey(name: 'phonenumber', includeIfNull: false)
  final String? phonenumber;
  static const fromJsonFactory = _$ValidateDetailsFromJson;
  static const toJsonFactory = _$ValidateDetailsToJson;
  Map<String, dynamic> toJson() => _$ValidateDetailsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateDetails &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.phonenumber, phonenumber) ||
                const DeepCollectionEquality()
                    .equals(other.phonenumber, phonenumber)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(phonenumber) ^
      runtimeType.hashCode;
}

extension $ValidateDetailsExtension on ValidateDetails {
  ValidateDetails copyWith({String? countryCode, String? phonenumber}) {
    return ValidateDetails(
        countryCode: countryCode ?? this.countryCode,
        phonenumber: phonenumber ?? this.phonenumber);
  }
}

@JsonSerializable(explicitToJson: true)
class VerifyChangepasswordOTP {
  VerifyChangepasswordOTP({
    this.otp,
    this.userId,
  });

  factory VerifyChangepasswordOTP.fromJson(Map<String, dynamic> json) =>
      _$VerifyChangepasswordOTPFromJson(json);

  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  static const fromJsonFactory = _$VerifyChangepasswordOTPFromJson;
  static const toJsonFactory = _$VerifyChangepasswordOTPToJson;
  Map<String, dynamic> toJson() => _$VerifyChangepasswordOTPToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VerifyChangepasswordOTP &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $VerifyChangepasswordOTPExtension on VerifyChangepasswordOTP {
  VerifyChangepasswordOTP copyWith({String? otp, String? userId}) {
    return VerifyChangepasswordOTP(
        otp: otp ?? this.otp, userId: userId ?? this.userId);
  }
}

String? cashbookTypeToJson(enums.CashbookType? cashbookType) {
  return enums.$CashbookTypeMap[cashbookType];
}

enums.CashbookType cashbookTypeFromJson(String? cashbookType) {
  if (cashbookType == null) {
    return enums.CashbookType.swaggerGeneratedUnknown;
  }

  return enums.$CashbookTypeMap.entries
      .firstWhere((element) => element.value == cashbookType,
          orElse: () =>
              const MapEntry(enums.CashbookType.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> cashbookTypeListToJson(List<enums.CashbookType>? cashbookType) {
  if (cashbookType == null) {
    return [];
  }

  return cashbookType.map((e) => enums.$CashbookTypeMap[e]!).toList();
}

List<enums.CashbookType> cashbookTypeListFromJson(List? cashbookType) {
  if (cashbookType == null) {
    return [];
  }

  return cashbookType.map((e) => cashbookTypeFromJson(e.toString())).toList();
}

String? filteroptionToJson(enums.Filteroption? filteroption) {
  return enums.$FilteroptionMap[filteroption];
}

enums.Filteroption filteroptionFromJson(String? filteroption) {
  if (filteroption == null) {
    return enums.Filteroption.swaggerGeneratedUnknown;
  }

  return enums.$FilteroptionMap.entries
      .firstWhere((element) => element.value == filteroption,
          orElse: () =>
              const MapEntry(enums.Filteroption.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> filteroptionListToJson(List<enums.Filteroption>? filteroption) {
  if (filteroption == null) {
    return [];
  }

  return filteroption.map((e) => enums.$FilteroptionMap[e]!).toList();
}

List<enums.Filteroption> filteroptionListFromJson(List? filteroption) {
  if (filteroption == null) {
    return [];
  }

  return filteroption.map((e) => filteroptionFromJson(e.toString())).toList();
}

String? orderCriteriaToJson(enums.OrderCriteria? orderCriteria) {
  return enums.$OrderCriteriaMap[orderCriteria];
}

enums.OrderCriteria orderCriteriaFromJson(String? orderCriteria) {
  if (orderCriteria == null) {
    return enums.OrderCriteria.swaggerGeneratedUnknown;
  }

  return enums.$OrderCriteriaMap.entries
      .firstWhere((element) => element.value == orderCriteria,
          orElse: () =>
              const MapEntry(enums.OrderCriteria.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> orderCriteriaListToJson(List<enums.OrderCriteria>? orderCriteria) {
  if (orderCriteria == null) {
    return [];
  }

  return orderCriteria.map((e) => enums.$OrderCriteriaMap[e]!).toList();
}

List<enums.OrderCriteria> orderCriteriaListFromJson(List? orderCriteria) {
  if (orderCriteria == null) {
    return [];
  }

  return orderCriteria.map((e) => orderCriteriaFromJson(e.toString())).toList();
}

String? productTypeToJson(enums.ProductType? productType) {
  return enums.$ProductTypeMap[productType];
}

enums.ProductType productTypeFromJson(String? productType) {
  if (productType == null) {
    return enums.ProductType.swaggerGeneratedUnknown;
  }

  return enums.$ProductTypeMap.entries
      .firstWhere((element) => element.value == productType,
          orElse: () =>
              const MapEntry(enums.ProductType.swaggerGeneratedUnknown, ''))
      .key;
}

List<String> productTypeListToJson(List<enums.ProductType>? productType) {
  if (productType == null) {
    return [];
  }

  return productType.map((e) => enums.$ProductTypeMap[e]!).toList();
}

List<enums.ProductType> productTypeListFromJson(List? productType) {
  if (productType == null) {
    return [];
  }

  return productType.map((e) => productTypeFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(ApiClientJsonDecoderMappings);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
