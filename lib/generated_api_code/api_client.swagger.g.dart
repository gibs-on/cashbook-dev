// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      county: json['county'] as String?,
      district: json['district'] as String?,
      pinCode: json['pinCode'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('county', instance.county);
  writeNotNull('district', instance.district);
  writeNotNull('pinCode', instance.pinCode);
  writeNotNull('location', instance.location);
  return val;
}

AdustProducts _$AdustProductsFromJson(Map<String, dynamic> json) =>
    AdustProducts(
      qty: json['qty'] as int?,
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      buyingPrice: (json['buyingPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AdustProductsToJson(AdustProducts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('qty', instance.qty);
  writeNotNull('sellingPrice', instance.sellingPrice);
  writeNotNull('buyingPrice', instance.buyingPrice);
  return val;
}

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      bankName: json['bankName'] as String?,
      bankCode: json['bankCode'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bankName', instance.bankName);
  writeNotNull('bankCode', instance.bankCode);
  writeNotNull('accountName', instance.accountName);
  writeNotNull('accountNumber', instance.accountNumber);
  return val;
}

BookDTO _$BookDTOFromJson(Map<String, dynamic> json) => BookDTO(
      bookName: json['bookName'] as String?,
      shortname: json['shortname'] as String?,
    );

Map<String, dynamic> _$BookDTOToJson(BookDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bookName', instance.bookName);
  writeNotNull('shortname', instance.shortname);
  return val;
}

BookDTOEdit _$BookDTOEditFromJson(Map<String, dynamic> json) => BookDTOEdit(
      id: json['id'] as int?,
      bookName: json['bookName'] as String?,
      shortname: json['shortname'] as String?,
    );

Map<String, dynamic> _$BookDTOEditToJson(BookDTOEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('bookName', instance.bookName);
  writeNotNull('shortname', instance.shortname);
  return val;
}

CashbookCategoriesfilters _$CashbookCategoriesfiltersFromJson(
        Map<String, dynamic> json) =>
    CashbookCategoriesfilters(
      cashbookType: cashbookTypeFromJson(json['cashbookType'] as String?),
      businessId: json['businessId'] as String?,
    );

Map<String, dynamic> _$CashbookCategoriesfiltersToJson(
    CashbookCategoriesfilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cashbookType', cashbookTypeToJson(instance.cashbookType));
  writeNotNull('businessId', instance.businessId);
  return val;
}

CashbookCategorisDTOAdd _$CashbookCategorisDTOAddFromJson(
        Map<String, dynamic> json) =>
    CashbookCategorisDTOAdd(
      categoryname: json['categoryname'] as String?,
      categorytype: cashbookTypeFromJson(json['categorytype'] as String?),
      customerId: json['customerId'] as String?,
    );

Map<String, dynamic> _$CashbookCategorisDTOAddToJson(
    CashbookCategorisDTOAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categoryname', instance.categoryname);
  writeNotNull('categorytype', cashbookTypeToJson(instance.categorytype));
  writeNotNull('customerId', instance.customerId);
  return val;
}

CashbookCategorisDTOEdit _$CashbookCategorisDTOEditFromJson(
        Map<String, dynamic> json) =>
    CashbookCategorisDTOEdit(
      id: json['id'] as int?,
      categoryname: json['categoryname'] as String?,
      categorytype: cashbookTypeFromJson(json['categorytype'] as String?),
      customerId: json['customerId'] as String?,
    );

Map<String, dynamic> _$CashbookCategorisDTOEditToJson(
    CashbookCategorisDTOEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('categoryname', instance.categoryname);
  writeNotNull('categorytype', cashbookTypeToJson(instance.categorytype));
  writeNotNull('customerId', instance.customerId);
  return val;
}

CashbookRemarksDTO _$CashbookRemarksDTOFromJson(Map<String, dynamic> json) =>
    CashbookRemarksDTO(
      remark: json['remark'] as String?,
      bookId: json['bookId'] as int?,
      ledgerbookType: cashbookTypeFromJson(json['ledgerbookType'] as String?),
    );

Map<String, dynamic> _$CashbookRemarksDTOToJson(CashbookRemarksDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('remark', instance.remark);
  writeNotNull('bookId', instance.bookId);
  writeNotNull('ledgerbookType', cashbookTypeToJson(instance.ledgerbookType));
  return val;
}

CashbookRemarksQuery _$CashbookRemarksQueryFromJson(
        Map<String, dynamic> json) =>
    CashbookRemarksQuery(
      businessId: json['businessId'] as String?,
      ledgerbookType: cashbookTypeFromJson(json['ledgerbookType'] as String?),
      bookId: json['bookId'] as int?,
    );

Map<String, dynamic> _$CashbookRemarksQueryToJson(
    CashbookRemarksQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('businessId', instance.businessId);
  writeNotNull('ledgerbookType', cashbookTypeToJson(instance.ledgerbookType));
  writeNotNull('bookId', instance.bookId);
  return val;
}

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      categoryname: json['categoryname'] as String?,
      longdesc: json['longdesc'] as String?,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categoryname', instance.categoryname);
  writeNotNull('longdesc', instance.longdesc);
  return val;
}

CategoryEditDTO _$CategoryEditDTOFromJson(Map<String, dynamic> json) =>
    CategoryEditDTO(
      id: json['id'] as int?,
      categoryname: json['categoryname'] as String?,
      longdesc: json['longdesc'] as String?,
    );

Map<String, dynamic> _$CategoryEditDTOToJson(CategoryEditDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('categoryname', instance.categoryname);
  writeNotNull('longdesc', instance.longdesc);
  return val;
}

ChangePassword _$ChangePasswordFromJson(Map<String, dynamic> json) =>
    ChangePassword(
      userId: json['userId'] as String?,
      newpin: json['newpin'] as String?,
    );

Map<String, dynamic> _$ChangePasswordToJson(ChangePassword instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('newpin', instance.newpin);
  return val;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      customerid: json['customerid'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerid', instance.customerid);
  return val;
}

CustomerClientDTOAdd _$CustomerClientDTOAddFromJson(
        Map<String, dynamic> json) =>
    CustomerClientDTOAdd(
      clientName: json['clientName'] as String?,
      clientEmail: json['clientEmail'] as String?,
      clientPhone: json['clientPhone'] as String?,
      photo: json['photo'] as String?,
      addressDetails: json['addressDetails'] == null
          ? null
          : AddressDetails.fromJson(
              json['addressDetails'] as Map<String, dynamic>),
      bankDetails: json['bankDetails'] == null
          ? null
          : BankDetails.fromJson(json['bankDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerClientDTOAddToJson(
    CustomerClientDTOAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientName', instance.clientName);
  writeNotNull('clientEmail', instance.clientEmail);
  writeNotNull('clientPhone', instance.clientPhone);
  writeNotNull('photo', instance.photo);
  writeNotNull('addressDetails', instance.addressDetails?.toJson());
  writeNotNull('bankDetails', instance.bankDetails?.toJson());
  return val;
}

CustomerClientEditDTO _$CustomerClientEditDTOFromJson(
        Map<String, dynamic> json) =>
    CustomerClientEditDTO(
      clientName: json['clientName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      favourite: json['favourite'] as bool?,
    );

Map<String, dynamic> _$CustomerClientEditDTOToJson(
    CustomerClientEditDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientName', instance.clientName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('favourite', instance.favourite);
  return val;
}

CustomerCreditAccountsDTO _$CustomerCreditAccountsDTOFromJson(
        Map<String, dynamic> json) =>
    CustomerCreditAccountsDTO(
      id: json['id'] as String?,
      customerContactId: json['customerContactId'] as String?,
      customerContactFirstName: json['customerContactFirstName'] as String?,
      customerContactsLastName: json['customerContactsLastName'] as String?,
      customername: json['customername'] as String?,
      productName: json['productName'] as String?,
      totalOutstanding: (json['totalOutstanding'] as num?)?.toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      amountBalance: (json['amountBalance'] as num?)?.toDouble(),
      itemDesc: json['itemDesc'] as String?,
      remarks: json['remarks'] as String?,
      createdOn: json['createdOn'] as String?,
      createdBy: json['createdBy'] as String?,
      createdByName: json['createdByName'] as String?,
      dueDate: json['dueDate'] as String?,
      fullyPaid: json['fullyPaid'] as bool?,
      partialPaid: json['partialPaid'] as bool?,
      sendreminder: json['sendreminder'] as bool?,
      reminderSent: json['reminderSent'] as bool?,
      reminderCount: json['reminderCount'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CustomerCreditAccountsDTOToJson(
    CustomerCreditAccountsDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customerContactId', instance.customerContactId);
  writeNotNull('customerContactFirstName', instance.customerContactFirstName);
  writeNotNull('customerContactsLastName', instance.customerContactsLastName);
  writeNotNull('customername', instance.customername);
  writeNotNull('productName', instance.productName);
  writeNotNull('totalOutstanding', instance.totalOutstanding);
  writeNotNull('amountPaid', instance.amountPaid);
  writeNotNull('amountBalance', instance.amountBalance);
  writeNotNull('itemDesc', instance.itemDesc);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('createdOn', instance.createdOn);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('dueDate', instance.dueDate);
  writeNotNull('fullyPaid', instance.fullyPaid);
  writeNotNull('partialPaid', instance.partialPaid);
  writeNotNull('sendreminder', instance.sendreminder);
  writeNotNull('reminderSent', instance.reminderSent);
  writeNotNull('reminderCount', instance.reminderCount);
  writeNotNull('status', instance.status);
  return val;
}

CustomerCreditAccountsDTOAdd _$CustomerCreditAccountsDTOAddFromJson(
        Map<String, dynamic> json) =>
    CustomerCreditAccountsDTOAdd(
      customerId: json['customerId'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      productImages: (json['productImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      itemDesc: json['itemDesc'] as String?,
      paidThrough: json['paidThrough'] as String?,
      remarks: json['remarks'] as String?,
      datedue: json['datedue'] as String?,
      addedBy: json['addedBy'] as String?,
    );

Map<String, dynamic> _$CustomerCreditAccountsDTOAddToJson(
    CustomerCreditAccountsDTOAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerId', instance.customerId);
  writeNotNull('totalAmount', instance.totalAmount);
  writeNotNull('amountPaid', instance.amountPaid);
  writeNotNull('products', instance.products);
  writeNotNull('productImages', instance.productImages);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('itemDesc', instance.itemDesc);
  writeNotNull('paidThrough', instance.paidThrough);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('datedue', instance.datedue);
  writeNotNull('addedBy', instance.addedBy);
  return val;
}

CustomerCreditAccountsListDTO _$CustomerCreditAccountsListDTOFromJson(
        Map<String, dynamic> json) =>
    CustomerCreditAccountsListDTO(
      nextPaymentDue: json['nextPaymentDue'] as String?,
      totalAmount: json['totalAmount'] as String?,
      customerCreditAccountsDTOs:
          (json['customerCreditAccountsDTOs'] as List<dynamic>?)
                  ?.map((e) => CustomerCreditAccountsView.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
    );

Map<String, dynamic> _$CustomerCreditAccountsListDTOToJson(
    CustomerCreditAccountsListDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nextPaymentDue', instance.nextPaymentDue);
  writeNotNull('totalAmount', instance.totalAmount);
  writeNotNull('customerCreditAccountsDTOs',
      instance.customerCreditAccountsDTOs?.map((e) => e.toJson()).toList());
  return val;
}

CustomerCreditAccountsView _$CustomerCreditAccountsViewFromJson(
        Map<String, dynamic> json) =>
    CustomerCreditAccountsView(
      id: json['id'] as String?,
      productName: json['productName'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      amountBalance: (json['amountBalance'] as num?)?.toDouble(),
      itemDesc: json['itemDesc'] as String?,
      remarks: json['remarks'] as String?,
      createdOn: json['createdOn'] as String?,
      dueDate: json['dueDate'] as String?,
      fullyPaid: json['fullyPaid'] as bool?,
      partialPaid: json['partialPaid'] as bool?,
      sendreminder: json['sendreminder'] as bool?,
      reminderSent: json['reminderSent'] as bool?,
      reminderCount: json['reminderCount'] as int?,
      status: json['status'] as String?,
      customerClientId: json['customerClientId'] as int?,
      customerIdCustId: json['customerIdCustId'] as String?,
      paidThrough: json['paidThrough'] as String?,
    );

Map<String, dynamic> _$CustomerCreditAccountsViewToJson(
    CustomerCreditAccountsView instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('productName', instance.productName);
  writeNotNull('totalAmount', instance.totalAmount);
  writeNotNull('amountPaid', instance.amountPaid);
  writeNotNull('amountBalance', instance.amountBalance);
  writeNotNull('itemDesc', instance.itemDesc);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('createdOn', instance.createdOn);
  writeNotNull('dueDate', instance.dueDate);
  writeNotNull('fullyPaid', instance.fullyPaid);
  writeNotNull('partialPaid', instance.partialPaid);
  writeNotNull('sendreminder', instance.sendreminder);
  writeNotNull('reminderSent', instance.reminderSent);
  writeNotNull('reminderCount', instance.reminderCount);
  writeNotNull('status', instance.status);
  writeNotNull('customerClientId', instance.customerClientId);
  writeNotNull('customerIdCustId', instance.customerIdCustId);
  writeNotNull('paidThrough', instance.paidThrough);
  return val;
}

CustomerDTO _$CustomerDTOFromJson(Map<String, dynamic> json) => CustomerDTO(
      id: json['id'] as int?,
      valuedueDate: json['valuedueDate'] as String?,
      clientName: json['clientName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      lastName: json['lastName'] as String?,
      balance: json['balance'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$CustomerDTOToJson(CustomerDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('valuedueDate', instance.valuedueDate);
  writeNotNull('clientName', instance.clientName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('email', instance.email);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('balance', instance.balance);
  writeNotNull('paymentStatus', instance.paymentStatus);
  writeNotNull('dueDate', instance.dueDate);
  return val;
}

CustomerDTOEdit _$CustomerDTOEditFromJson(Map<String, dynamic> json) =>
    CustomerDTOEdit(
      custId: json['custId'] as String?,
      organizationName: json['organizationName'] as String?,
      fullnames: json['fullnames'] as String?,
      primaryPhone: json['primaryPhone'] as String?,
      secondaryPhone: json['secondaryPhone'] as String?,
      primaryEmail: json['primaryEmail'] as String?,
      secondaryEmail: json['secondaryEmail'] as String?,
      website: json['website'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      location: json['location'] as String?,
      businessTypeId: json['businessType_Id'] as String?,
      editedby: json['editedby'] as String?,
      imageFile: json['imageFile'] as String?,
      editedIP: json['editedIP'] as String?,
    );

Map<String, dynamic> _$CustomerDTOEditToJson(CustomerDTOEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custId', instance.custId);
  writeNotNull('organizationName', instance.organizationName);
  writeNotNull('fullnames', instance.fullnames);
  writeNotNull('primaryPhone', instance.primaryPhone);
  writeNotNull('secondaryPhone', instance.secondaryPhone);
  writeNotNull('primaryEmail', instance.primaryEmail);
  writeNotNull('secondaryEmail', instance.secondaryEmail);
  writeNotNull('website', instance.website);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  writeNotNull('country', instance.country);
  writeNotNull('location', instance.location);
  writeNotNull('businessType_Id', instance.businessTypeId);
  writeNotNull('editedby', instance.editedby);
  writeNotNull('imageFile', instance.imageFile);
  writeNotNull('editedIP', instance.editedIP);
  return val;
}

CustomerDTOView _$CustomerDTOViewFromJson(Map<String, dynamic> json) =>
    CustomerDTOView(
      custId: json['custId'] as String?,
      organizationName: json['organizationName'] as String?,
      fullnames: json['fullnames'] as String?,
      primaryPhone: json['primaryPhone'] as String?,
      secondaryPhone: json['secondaryPhone'] as String?,
      primaryEmail: json['primaryEmail'] as String?,
      secondaryEmail: json['secondaryEmail'] as String?,
      website: json['website'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      location: json['location'] as String?,
      logo: json['logo'] as String?,
      businessTypeName: json['businessTypeName'] as String?,
      businessTypeId: json['businessTypeId'] as String?,
    );

Map<String, dynamic> _$CustomerDTOViewToJson(CustomerDTOView instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('custId', instance.custId);
  writeNotNull('organizationName', instance.organizationName);
  writeNotNull('fullnames', instance.fullnames);
  writeNotNull('primaryPhone', instance.primaryPhone);
  writeNotNull('secondaryPhone', instance.secondaryPhone);
  writeNotNull('primaryEmail', instance.primaryEmail);
  writeNotNull('secondaryEmail', instance.secondaryEmail);
  writeNotNull('website', instance.website);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  writeNotNull('country', instance.country);
  writeNotNull('location', instance.location);
  writeNotNull('logo', instance.logo);
  writeNotNull('businessTypeName', instance.businessTypeName);
  writeNotNull('businessTypeId', instance.businessTypeId);
  return val;
}

CustomerPaymentsDTOADD _$CustomerPaymentsDTOADDFromJson(
        Map<String, dynamic> json) =>
    CustomerPaymentsDTOADD(
      clientId: json['clientId'] as String?,
      originalTranId: json['originalTranId'] as String?,
      notes: json['notes'] as String?,
      paymentMode: json['paymentMode'] as String?,
      paidBy: json['paidBy'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomerPaymentsDTOADDToJson(
    CustomerPaymentsDTOADD instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('originalTranId', instance.originalTranId);
  writeNotNull('notes', instance.notes);
  writeNotNull('paymentMode', instance.paymentMode);
  writeNotNull('paidBy', instance.paidBy);
  writeNotNull('amount', instance.amount);
  return val;
}

CustomerSupplierDTO _$CustomerSupplierDTOFromJson(Map<String, dynamic> json) =>
    CustomerSupplierDTO(
      id: json['id'] as String?,
      supplierName: json['supplierName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      customerInfo: json['customerInfo'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      active: json['active'] as bool?,
      favourite: json['favourite'] as bool?,
      approved: json['approved'] as bool?,
      approvedBy: json['approvedBy'] as String?,
      approvedOn: json['approvedOn'] == null
          ? null
          : DateTime.parse(json['approvedOn'] as String),
      editedBy: json['editedBy'] as String?,
      editedOn: json['editedOn'] == null
          ? null
          : DateTime.parse(json['editedOn'] as String),
      edited: json['edited'] as bool?,
      editedIp: json['editedIp'] as String?,
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      createdBy: json['createdBy'] as String?,
      createdIp: json['createdIp'] as String?,
    );

Map<String, dynamic> _$CustomerSupplierDTOToJson(CustomerSupplierDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('supplierName', instance.supplierName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('customerInfo', instance.customerInfo);
  writeNotNull('email', instance.email);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('active', instance.active);
  writeNotNull('favourite', instance.favourite);
  writeNotNull('approved', instance.approved);
  writeNotNull('approvedBy', instance.approvedBy);
  writeNotNull('approvedOn', instance.approvedOn?.toIso8601String());
  writeNotNull('editedBy', instance.editedBy);
  writeNotNull('editedOn', instance.editedOn?.toIso8601String());
  writeNotNull('edited', instance.edited);
  writeNotNull('editedIp', instance.editedIp);
  writeNotNull('createdOn', instance.createdOn?.toIso8601String());
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdIp', instance.createdIp);
  return val;
}

CustomerSupplierDTOADD _$CustomerSupplierDTOADDFromJson(
        Map<String, dynamic> json) =>
    CustomerSupplierDTOADD(
      supplierName: json['supplierName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      addressDetails: json['addressDetails'] == null
          ? null
          : AddressDetails.fromJson(
              json['addressDetails'] as Map<String, dynamic>),
      bankDetails: json['bankDetails'] == null
          ? null
          : BankDetails.fromJson(json['bankDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerSupplierDTOADDToJson(
    CustomerSupplierDTOADD instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('supplierName', instance.supplierName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('addressDetails', instance.addressDetails?.toJson());
  writeNotNull('bankDetails', instance.bankDetails?.toJson());
  return val;
}

CustomerSupplierDTOEdit _$CustomerSupplierDTOEditFromJson(
        Map<String, dynamic> json) =>
    CustomerSupplierDTOEdit(
      supplierName: json['supplierName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      active: json['active'] as bool?,
      favourite: json['favourite'] as bool?,
      editedIp: json['editedIp'] as String?,
    );

Map<String, dynamic> _$CustomerSupplierDTOEditToJson(
    CustomerSupplierDTOEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('supplierName', instance.supplierName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('active', instance.active);
  writeNotNull('favourite', instance.favourite);
  writeNotNull('editedIp', instance.editedIp);
  return val;
}

CustomerSupplierDTOView _$CustomerSupplierDTOViewFromJson(
        Map<String, dynamic> json) =>
    CustomerSupplierDTOView(
      id: json['id'] as int?,
      valuedueDate: json['valuedueDate'] as String?,
      supplierName: json['supplierName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      lastName: json['lastName'] as String?,
      balance: json['balance'] as String?,
      dueDate: json['dueDate'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
    );

Map<String, dynamic> _$CustomerSupplierDTOViewToJson(
    CustomerSupplierDTOView instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('valuedueDate', instance.valuedueDate);
  writeNotNull('supplierName', instance.supplierName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('email', instance.email);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('balance', instance.balance);
  writeNotNull('dueDate', instance.dueDate);
  writeNotNull('paymentStatus', instance.paymentStatus);
  return val;
}

EditDueDate _$EditDueDateFromJson(Map<String, dynamic> json) => EditDueDate(
      dueDate: json['dueDate'] as String?,
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$EditDueDateToJson(EditDueDate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dueDate', instance.dueDate);
  writeNotNull('transactionId', instance.transactionId);
  return val;
}

FilterBy _$FilterByFromJson(Map<String, dynamic> json) => FilterBy(
      filteroption: filteroptionFromJson(json['filteroption'] as String?),
      filteroptionvalue: (json['filteroptionvalue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FilterByToJson(FilterBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filteroption', filteroptionToJson(instance.filteroption));
  writeNotNull('filteroptionvalue', instance.filteroptionvalue);
  return val;
}

GetCustomerClientBy _$GetCustomerClientByFromJson(Map<String, dynamic> json) =>
    GetCustomerClientBy(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$GetCustomerClientByToJson(GetCustomerClientBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

LastBackupDTOAdd _$LastBackupDTOAddFromJson(Map<String, dynamic> json) =>
    LastBackupDTOAdd(
      businessId: json['businessId'] as String?,
      lastBackupDate: json['lastBackupDate'] as String?,
    );

Map<String, dynamic> _$LastBackupDTOAddToJson(LastBackupDTOAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('businessId', instance.businessId);
  writeNotNull('lastBackupDate', instance.lastBackupDate);
  return val;
}

LedgerBookDTO _$LedgerBookDTOFromJson(Map<String, dynamic> json) =>
    LedgerBookDTO(
      ledgerbookType: cashbookTypeFromJson(json['ledgerbookType'] as String?),
      transactiondate: json['transactiondate'] as String?,
      transactiontime: json['transactiontime'] as String?,
      cashbookCategoryid: json['cashbookCategoryid'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      paymentModeId: json['paymentModeId'] as int?,
    );

Map<String, dynamic> _$LedgerBookDTOToJson(LedgerBookDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ledgerbookType', cashbookTypeToJson(instance.ledgerbookType));
  writeNotNull('transactiondate', instance.transactiondate);
  writeNotNull('transactiontime', instance.transactiontime);
  writeNotNull('cashbookCategoryid', instance.cashbookCategoryid);
  writeNotNull('amount', instance.amount);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('paymentModeId', instance.paymentModeId);
  return val;
}

LedgerBookDTODelete _$LedgerBookDTODeleteFromJson(Map<String, dynamic> json) =>
    LedgerBookDTODelete(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$LedgerBookDTODeleteToJson(LedgerBookDTODelete instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

LedgerBookDTOEdit _$LedgerBookDTOEditFromJson(Map<String, dynamic> json) =>
    LedgerBookDTOEdit(
      id: json['id'] as int?,
      ledgerbookType: cashbookTypeFromJson(json['ledgerbookType'] as String?),
      transactionDate: json['transaction_date'] as String?,
      transactionTime: json['transaction_time'] as String?,
      cashbookCategoryid: json['cashbookCategoryid'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      paymentModeId: json['paymentModeId'] as int?,
    );

Map<String, dynamic> _$LedgerBookDTOEditToJson(LedgerBookDTOEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('ledgerbookType', cashbookTypeToJson(instance.ledgerbookType));
  writeNotNull('transaction_date', instance.transactionDate);
  writeNotNull('transaction_time', instance.transactionTime);
  writeNotNull('cashbookCategoryid', instance.cashbookCategoryid);
  writeNotNull('amount', instance.amount);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('paymentModeId', instance.paymentModeId);
  return val;
}

OTPValidation _$OTPValidationFromJson(Map<String, dynamic> json) =>
    OTPValidation(
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$OTPValidationToJson(OTPValidation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  return val;
}

PaymentmodeAdd _$PaymentmodeAddFromJson(Map<String, dynamic> json) =>
    PaymentmodeAdd(
      name: json['name'] as String?,
      businessId: json['businessId'] as String?,
    );

Map<String, dynamic> _$PaymentmodeAddToJson(PaymentmodeAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('businessId', instance.businessId);
  return val;
}

PaymentmodeEdit _$PaymentmodeEditFromJson(Map<String, dynamic> json) =>
    PaymentmodeEdit(
      name: json['name'] as String?,
      paymentmodeId: json['paymentmodeId'] as int?,
      businessId: json['businessId'] as String?,
    );

Map<String, dynamic> _$PaymentmodeEditToJson(PaymentmodeEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('paymentmodeId', instance.paymentmodeId);
  writeNotNull('businessId', instance.businessId);
  return val;
}

ProductDTOAdd _$ProductDTOAddFromJson(Map<String, dynamic> json) =>
    ProductDTOAdd(
      name: json['name'] as String?,
      category: json['category'] as String?,
      longDesc: json['longDesc'] as String?,
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      buyingPrice: (json['buyingPrice'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      businessId: json['businessId'] as String?,
      active: json['active'] as bool?,
      isPhysicalProduct: json['isPhysicalProduct'] as bool?,
      productType: productTypeFromJson(json['productType'] as String?),
      trackInventory: json['trackInventory'] as bool?,
    );

Map<String, dynamic> _$ProductDTOAddToJson(ProductDTOAdd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('category', instance.category);
  writeNotNull('longDesc', instance.longDesc);
  writeNotNull('sellingPrice', instance.sellingPrice);
  writeNotNull('buyingPrice', instance.buyingPrice);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('businessId', instance.businessId);
  writeNotNull('active', instance.active);
  writeNotNull('isPhysicalProduct', instance.isPhysicalProduct);
  writeNotNull('productType', productTypeToJson(instance.productType));
  writeNotNull('trackInventory', instance.trackInventory);
  return val;
}

ProductEditDTO _$ProductEditDTOFromJson(Map<String, dynamic> json) =>
    ProductEditDTO(
      name: json['name'] as String?,
      category: json['category'] as String?,
      longDesc: json['longDesc'] as String?,
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      buyingPrice: (json['buyingPrice'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      businessId: json['businessId'] as String?,
      active: json['active'] as bool?,
      trackInventory: json['trackInventory'] as bool?,
    );

Map<String, dynamic> _$ProductEditDTOToJson(ProductEditDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('category', instance.category);
  writeNotNull('longDesc', instance.longDesc);
  writeNotNull('sellingPrice', instance.sellingPrice);
  writeNotNull('buyingPrice', instance.buyingPrice);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('businessId', instance.businessId);
  writeNotNull('active', instance.active);
  writeNotNull('trackInventory', instance.trackInventory);
  return val;
}

ProductViewDTO _$ProductViewDTOFromJson(Map<String, dynamic> json) =>
    ProductViewDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      category: json['category'] as String?,
      quantity: json['quantity'] as int?,
      categoryID: json['categoryID'] as String?,
      longDesc: json['longDesc'] as String?,
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      buyingPrice: (json['buyingPrice'] as num?)?.toDouble(),
      customerId: json['customerId'] as String?,
      active: json['active'] as bool?,
      deleted: json['deleted'] as bool?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$ProductViewDTOToJson(ProductViewDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('category', instance.category);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('categoryID', instance.categoryID);
  writeNotNull('longDesc', instance.longDesc);
  writeNotNull('sellingPrice', instance.sellingPrice);
  writeNotNull('buyingPrice', instance.buyingPrice);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('active', instance.active);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('userId', instance.userId);
  return val;
}

ResetPassword _$ResetPasswordFromJson(Map<String, dynamic> json) =>
    ResetPassword(
      phonenumber: json['phonenumber'] as String?,
      countrycode: json['countrycode'] as String?,
    );

Map<String, dynamic> _$ResetPasswordToJson(ResetPassword instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phonenumber', instance.phonenumber);
  writeNotNull('countrycode', instance.countrycode);
  return val;
}

Response$ _$Response$FromJson(Map<String, dynamic> json) => Response$(
      success: json['success'] as bool?,
      errordesc: json['errordesc'] as String?,
      result: json['result'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$Response$ToJson(Response$ instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('success', instance.success);
  writeNotNull('errordesc', instance.errordesc);
  writeNotNull('result', instance.result);
  writeNotNull('id', instance.id);
  return val;
}

SaleProductsDTO _$SaleProductsDTOFromJson(Map<String, dynamic> json) =>
    SaleProductsDTO(
      name: json['name'] as String?,
      longDesc: json['longDesc'] as String?,
      price: json['price'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SaleProductsDTOToJson(SaleProductsDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('longDesc', instance.longDesc);
  writeNotNull('price', instance.price);
  writeNotNull('id', instance.id);
  return val;
}

SupplierPaymentsDTO _$SupplierPaymentsDTOFromJson(Map<String, dynamic> json) =>
    SupplierPaymentsDTO(
      supplierId: json['supplierId'] as String?,
      originalTranId: json['originalTranId'] as String?,
      notes: json['notes'] as String?,
      paymentMode: json['paymentMode'] as String?,
      paidBy: json['paidBy'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SupplierPaymentsDTOToJson(SupplierPaymentsDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('supplierId', instance.supplierId);
  writeNotNull('originalTranId', instance.originalTranId);
  writeNotNull('notes', instance.notes);
  writeNotNull('paymentMode', instance.paymentMode);
  writeNotNull('paidBy', instance.paidBy);
  writeNotNull('amount', instance.amount);
  return val;
}

SupplierTransactionsDTOADD _$SupplierTransactionsDTOADDFromJson(
        Map<String, dynamic> json) =>
    SupplierTransactionsDTOADD(
      supplierid: json['supplierid'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      itemDesc: json['itemDesc'] as String?,
      datedue: json['datedue'] as String?,
    );

Map<String, dynamic> _$SupplierTransactionsDTOADDToJson(
    SupplierTransactionsDTOADD instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('supplierid', instance.supplierid);
  writeNotNull('totalAmount', instance.totalAmount);
  writeNotNull('amountPaid', instance.amountPaid);
  writeNotNull('products', instance.products);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('itemDesc', instance.itemDesc);
  writeNotNull('datedue', instance.datedue);
  return val;
}

TenziBookLogin _$TenziBookLoginFromJson(Map<String, dynamic> json) =>
    TenziBookLogin(
      username: json['username'] as String?,
      countrycode: json['countrycode'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$TenziBookLoginToJson(TenziBookLogin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('countrycode', instance.countrycode);
  writeNotNull('password', instance.password);
  return val;
}

TenzibookRegisterDTO _$TenzibookRegisterDTOFromJson(
        Map<String, dynamic> json) =>
    TenzibookRegisterDTO(
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      businessName: json['businessName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      countryCode: json['countryCode'] as String?,
      deviceType: json['deviceType'] as String?,
      os: json['os'] as String?,
      deviceId: json['deviceId'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$TenzibookRegisterDTOToJson(
    TenzibookRegisterDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('businessName', instance.businessName);
  writeNotNull('email', instance.email);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('deviceType', instance.deviceType);
  writeNotNull('os', instance.os);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('country', instance.country);
  return val;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transactionId', instance.transactionId);
  return val;
}

ValidateDetails _$ValidateDetailsFromJson(Map<String, dynamic> json) =>
    ValidateDetails(
      countryCode: json['countryCode'] as String?,
      phonenumber: json['phonenumber'] as String?,
    );

Map<String, dynamic> _$ValidateDetailsToJson(ValidateDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('phonenumber', instance.phonenumber);
  return val;
}

VerifyChangepasswordOTP _$VerifyChangepasswordOTPFromJson(
        Map<String, dynamic> json) =>
    VerifyChangepasswordOTP(
      otp: json['otp'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$VerifyChangepasswordOTPToJson(
    VerifyChangepasswordOTP instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  writeNotNull('userId', instance.userId);
  return val;
}
