// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiClient extends ApiClient {
  _$ApiClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiClient;

  @override
  Future<Response<CustomerDTOView>> apiAccountGetProfileBusinessIdGet(
      {required String? businessId}) {
    final $url = '/api/Account/GetProfile/${businessId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CustomerDTOView, CustomerDTOView>($request);
  }

  @override
  Future<Response<dynamic>> apiAccountGetBusinessTypeGet() {
    final $url = '/api/Account/GetBusinessType';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Response$>> apiAccountUpdateBusinessProfileBusinessIdPost(
      {required String? businessId, required CustomerDTOEdit? body}) {
    final $url = '/api/Account/UpdateBusinessProfile/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<dynamic>> apiAccountResendOTPUserIdPost(
      {required String? userId}) {
    final $url = '/api/Account/ResendOTP/${userId}';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiAccountValidateOTPPost(
      {required OTPValidation? body}) {
    final $url = '/api/Account/ValidateOTP';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiAuthDeleteBusinessBusinessIdDelete(
      {required String? businessId}) {
    final $url = '/api/Auth/deleteBusiness/${businessId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiAuthValidatePhonePost(
      {required ValidateDetails? body}) {
    final $url = '/api/Auth/ValidatePhone';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiAuthRegisterPost(
      {required TenzibookRegisterDTO? body}) {
    final $url = '/api/Auth/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CustomerDTOView>> apiAuthChangePasswordPost(
      {required ChangePassword? body}) {
    final $url = '/api/Auth/changePassword';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CustomerDTOView, CustomerDTOView>($request);
  }

  @override
  Future<Response<Response$>> apiAuthVerifyChangepasswordOTPPost(
      {required VerifyChangepasswordOTP? body}) {
    final $url = '/api/Auth/verifyChangepasswordOTP';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<dynamic>> apiAuthResetPasswordPost(
      {required ResetPassword? body}) {
    final $url = '/api/Auth/ResetPassword';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiAuthLoginPost({required TenziBookLogin? body}) {
    final $url = '/api/Auth/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookUpdateCashbookTransactionBusinessIdBookIdPatch(
          {required String? businessId,
          required String? bookId,
          required LedgerBookDTOEdit? body}) {
    final $url =
        '/api/CashBook/UpdateCashbookTransaction/${businessId}/${bookId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookGetCashbookSingleTransactionBusinessIdTransactionIdGet(
          {required String? businessId, required String? transactionId}) {
    final $url =
        '/api/CashBook/GetCashbookSingleTransaction/${businessId}/${transactionId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookGetCashbookTransactionsBusinessIdBookIdGet(
          {required String? businessId, required String? bookId}) {
    final $url =
        '/api/CashBook/GetCashbookTransactions/${businessId}/${bookId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetCashbookBalancesBusinessidBookidPost(
      {required String? businessid,
      required String? bookid,
      required FilterBy? body}) {
    final $url = '/api/CashBook/GetCashbookBalances/${businessid}/${bookid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetLastTimeBackupBusinessidGet(
      {required String? businessid}) {
    final $url = '/api/CashBook/GetLastTimeBackup/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookAddlastbackupdatePost(
      {required LastBackupDTOAdd? body}) {
    final $url = '/api/CashBook/addlastbackupdate';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookAddCashbookTransactionBusinessidBookIdPost(
          {required String? businessid,
          required String? bookId,
          required List<LedgerBookDTO>? body}) {
    final $url = '/api/CashBook/AddCashbookTransaction/${businessid}/${bookId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookDeleteCashbookTransactionBusinessidBookIdDelete(
          {required String? businessid,
          required String? bookId,
          required List<LedgerBookDTODelete>? body}) {
    final $url =
        '/api/CashBook/DeleteCashbookTransaction/${businessid}/${bookId}';
    final $body = body;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookCreateNewbookBusinessidPost(
      {required String? businessid, required BookDTO? body}) {
    final $url = '/api/CashBook/CreateNewbook/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetPaymentmodesBusinessidGet(
      {required String? businessid}) {
    final $url = '/api/CashBook/GetPaymentmodes/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookAddPaymentModePost(
      {required PaymentmodeAdd? body}) {
    final $url = '/api/CashBook/AddPaymentMode';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGet({required PaymentmodeAdd? body}) {
    final $url = '/api/CashBook';
    final $body = body;
    final $request = Request('GET', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetCashbookRemarksPost(
      {required CashbookRemarksQuery? body}) {
    final $url = '/api/CashBook/GetCashbookRemarks';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookAddCashbookRemarksBusinessIdPost(
      {required String? businessId, required CashbookRemarksDTO? body}) {
    final $url = '/api/CashBook/AddCashbookRemarks/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookDeleteCashbookRemarksBusinessIdRemarkIdBookIdDelete(
          {required String? businessId,
          required String? remarkId,
          required int? bookId}) {
    final $url =
        '/api/CashBook/DeleteCashbookRemarks/${businessId}/${remarkId}/${bookId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookDeletePaymentModeBusinessIdPaymentmodeIdDelete(
          {required int? paymentmodeId, required String? businessId}) {
    final $url =
        '/api/CashBook/DeletePaymentMode/${businessId}/${paymentmodeId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookUpdatePaymentModePatch(
      {required PaymentmodeEdit? body}) {
    final $url = '/api/CashBook/UpdatePaymentMode';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookCreateCashbookCategoryBusinessIdPost(
      {required String? businessId, required CashbookCategorisDTOAdd? body}) {
    final $url = '/api/CashBook/CreateCashbookCategory/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookUpdateCashbookcategoriesBusinessIdPatch(
      {required String? businessId, required CashbookCategorisDTOEdit? body}) {
    final $url = '/api/CashBook/UpdateCashbookcategories/${businessId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiCashBookDeleteCashbookcategoriesBusinessIdCategoryIdDelete(
          {required int? categoryId, required String? businessId}) {
    final $url =
        '/api/CashBook/DeleteCashbookcategories/${businessId}/${categoryId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetCashbookcategoriesPost(
      {required CashbookCategoriesfilters? body}) {
    final $url = '/api/CashBook/GetCashbookcategories';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookGetbooksBusinessIdGet(
      {required String? businessId}) {
    final $url = '/api/CashBook/Getbooks/${businessId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookEditBookBusinessIdPatch(
      {required String? businessId, required BookDTOEdit? body}) {
    final $url = '/api/CashBook/EditBook/${businessId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> apiCashBookDeleteBookBusinessIdBookIdDelete(
      {required String? businessId, required String? bookId}) {
    final $url = '/api/CashBook/DeleteBook/${businessId}/${bookId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Response$>> apiCustomersAddcustomerBusinessidPost(
      {required String? businessid, required CustomerClientDTOAdd? body}) {
    final $url = '/api/Customers/addcustomer/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>>
      apiCustomersDeleteCustomerBusinessidCustomeridDelete(
          {required String? businessid, required String? customerid}) {
    final $url = '/api/Customers/DeleteCustomer/${businessid}/${customerid}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>> apiCustomersEditcustomerBusinessidCustomeridPost(
      {required String? businessid,
      required String? customerid,
      required CustomerClientEditDTO? body}) {
    final $url = '/api/Customers/Editcustomer/${businessid}/${customerid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<CustomerDTO>> apiCustomersGetCustomerBusinessidPost(
      {required String? businessid,
      dynamic order,
      required GetCustomerClientBy? body}) {
    final $url = '/api/Customers/GetCustomer/${businessid}';
    final $params = <String, dynamic>{'order': order};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<CustomerDTO, CustomerDTO>($request);
  }

  @override
  Future<Response<CustomerDTO>> apiCustomersGetCustomersListBusinessidGet(
      {required String? businessid, dynamic order}) {
    final $url = '/api/Customers/GetCustomersList/${businessid}';
    final $params = <String, dynamic>{'order': order};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<CustomerDTO, CustomerDTO>($request);
  }

  @override
  Future<Response<dynamic>> apiDashboardGetTotalsBalanceCustomersBusinessIdGet(
      {required String? businessId}) {
    final $url = '/api/Dashboard/GetTotalsBalanceCustomers/${businessId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ProductViewDTO>>> getServicesBusinessidGet(
      {required String? businessid}) {
    final $url = '/GetServices/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProductViewDTO>, ProductViewDTO>($request);
  }

  @override
  Future<Response<List<ProductViewDTO>>> getProductsBusinessidGet(
      {required String? businessid}) {
    final $url = '/GetProducts/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProductViewDTO>, ProductViewDTO>($request);
  }

  @override
  Future<Response<dynamic>> getProductBusinessIdProductIdGet(
      {required String? businessId, required String? productId}) {
    final $url = '/GetProduct/${businessId}/${productId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductActivityBusinessIdProductIdGet(
      {required String? businessId, required String? productId}) {
    final $url = '/GetProductActivity/${businessId}/${productId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateStockBusinessIdProductIdPost(
      {required String? businessId,
      required String? productId,
      required AdustProducts? body}) {
    final $url = '/UpdateStock/${businessId}/${productId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> duplicateProductBusinessIdProductIdGet(
      {required String? businessId, required String? productId}) {
    final $url = '/DuplicateProduct/${businessId}/${productId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editProductBusinessidProductidPost(
      {required String? businessid,
      required String? productid,
      required ProductEditDTO? body}) {
    final $url = '/editProduct/${businessid}/${productid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteProductBusinessidProductidDelete(
      {required String? businessid, required String? productid}) {
    final $url = '/deleteProduct/${businessid}/${productid}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addProductsBusinessIdPost(
      {required String? businessId, required ProductDTOAdd? body}) {
    final $url = '/AddProducts/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteCategoryBusinessIdCategoryIdDelete(
      {required String? businessId, required String? categoryId}) {
    final $url = '/DeleteCategory/${businessId}/${categoryId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategoriesBusinessIdGet(
      {required String? businessId}) {
    final $url = '/GetCategories/${businessId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editCategoriesBusinessIdPost(
      {required String? businessId, required CategoryEditDTO? body}) {
    final $url = '/EditCategories/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addCategoriesBusinessIdPost(
      {required String? businessId, required CategoryDTO? body}) {
    final $url = '/AddCategories/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Response$>> apiSupplierAddSupplierBusinessidPost(
      {required String? businessid, required CustomerSupplierDTOADD? body}) {
    final $url = '/api/Supplier/addSupplier/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<CustomerSupplierDTO>>
      apiSupplierGetSupplierSupplieridBusinessidGet(
          {required String? supplierid, required String? businessid}) {
    final $url = '/api/Supplier/GetSupplier/${supplierid}/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CustomerSupplierDTO, CustomerSupplierDTO>($request);
  }

  @override
  Future<Response<Response$>>
      apiSupplierDeleteSupplierSupplieridBusinessidDelete(
          {required String? supplierid, required String? businessid}) {
    final $url = '/api/Supplier/DeleteSupplier/${supplierid}/${businessid}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>> apiSupplierEditSupplierSupplieridBusinessidPost(
      {required String? supplierid,
      required String? businessid,
      required CustomerSupplierDTOEdit? body}) {
    final $url = '/api/Supplier/EditSupplier/${supplierid}/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<CustomerSupplierDTOView>>
      apiSupplierGetSuppliersBusinessidGet({required String? businessid}) {
    final $url = '/api/Supplier/GetSuppliers/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<CustomerSupplierDTOView, CustomerSupplierDTOView>($request);
  }

  @override
  Future<Response<Response$>>
      apiSupplierTransactionsPostExistingPaymentEntryBusinessidPost(
          {required String? businessid, required SupplierPaymentsDTO? body}) {
    final $url =
        '/api/SupplierTransactions/PostExistingPaymentEntry/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>> apiSupplierTransactionsEditDueDateBusinessidPost(
      {required String? businessid, required EditDueDate? body}) {
    final $url = '/api/SupplierTransactions/EditDueDate/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<SaleProductsDTO>>
      apiSupplierTransactionsGetTransactionProductsTransactionIdBusinessidGet(
          {required String? transactionId, required String? businessid}) {
    final $url =
        '/api/SupplierTransactions/GetTransactionProducts/${transactionId}/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SaleProductsDTO, SaleProductsDTO>($request);
  }

  @override
  Future<Response<CustomerCreditAccountsDTO>>
      apiSupplierTransactionsGetTransactionDetailsBusinessidPost(
          {required String? businessid, required Transaction? body}) {
    final $url =
        '/api/SupplierTransactions/GetTransactionDetails/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<CustomerCreditAccountsDTO, CustomerCreditAccountsDTO>($request);
  }

  @override
  Future<Response<dynamic>>
      apiSupplierTransactionsAddSupplierTransactionsBusinessIdPost(
          {required String? businessId,
          required SupplierTransactionsDTOADD? body}) {
    final $url =
        '/api/SupplierTransactions/AddSupplierTransactions/${businessId}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiSupplierTransactionsGetSupplierAllTransactionsBusinessIdGet(
          {required String? businessId}) {
    final $url =
        '/api/SupplierTransactions/GetSupplierAllTransactions/${businessId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>>
      apiSupplierTransactionsGetSupplierTransactionsBusinessIdSupplierIdGet(
          {required String? businessId, required String? supplierId}) {
    final $url =
        '/api/SupplierTransactions/GetSupplierTransactions/${businessId}/${supplierId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Response$>>
      apiTransactionsPostExistingPaymentEntryBusinessidPost(
          {required String? businessid,
          required CustomerPaymentsDTOADD? body}) {
    final $url = '/api/Transactions/PostExistingPaymentEntry/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>> apiTransactionsEditDueDateBusinessidPost(
      {required String? businessid, required EditDueDate? body}) {
    final $url = '/api/Transactions/EditDueDate/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<Response$>> apiTransactionsAddNewentryBusinessidPost(
      {required String? businessid,
      required CustomerCreditAccountsDTOAdd? body}) {
    final $url = '/api/Transactions/addNewentry/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Response$, Response$>($request);
  }

  @override
  Future<Response<CustomerCreditAccountsDTO>>
      apiTransactionsGetCustomerPaymentsBusinessidPost(
          {required String? businessid, required Customer? body}) {
    final $url = '/api/Transactions/GetCustomerPayments/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<CustomerCreditAccountsDTO, CustomerCreditAccountsDTO>($request);
  }

  @override
  Future<Response<CustomerCreditAccountsDTO>>
      apiTransactionsGetTransactionDetailsBusinessidPost(
          {required String? businessid, required Transaction? body}) {
    final $url = '/api/Transactions/GetTransactionDetails/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<CustomerCreditAccountsDTO, CustomerCreditAccountsDTO>($request);
  }

  @override
  Future<Response<CustomerCreditAccountsListDTO>>
      apiTransactionsGetPaymentListBusinessidPost(
          {required String? businessid, required Customer? body}) {
    final $url = '/api/Transactions/GetPaymentList/${businessid}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CustomerCreditAccountsListDTO,
        CustomerCreditAccountsListDTO>($request);
  }

  @override
  Future<Response<SaleProductsDTO>>
      apiTransactionsGetTransactionProductsTransactionIdBusinessidGet(
          {required String? transactionId, required String? businessid}) {
    final $url =
        '/api/Transactions/GetTransactionProducts/${transactionId}/${businessid}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SaleProductsDTO, SaleProductsDTO>($request);
  }
}
