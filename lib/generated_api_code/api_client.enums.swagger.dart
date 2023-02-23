import 'package:json_annotation/json_annotation.dart';

enum CashbookType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('cashin')
  cashin,
  @JsonValue('cashout')
  cashout
}

const $CashbookTypeMap = {
  CashbookType.cashin: 'cashin',
  CashbookType.cashout: 'cashout'
};

enum Filteroption {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('all')
  all,
  @JsonValue('today')
  today,
  @JsonValue('yesterday')
  yesterday,
  @JsonValue('thismonth')
  thismonth,
  @JsonValue('lastmonth')
  lastmonth,
  @JsonValue('singleday')
  singleday,
  @JsonValue('daterange')
  daterange
}

const $FilteroptionMap = {
  Filteroption.all: 'all',
  Filteroption.today: 'today',
  Filteroption.yesterday: 'yesterday',
  Filteroption.thismonth: 'thismonth',
  Filteroption.lastmonth: 'lastmonth',
  Filteroption.singleday: 'singleday',
  Filteroption.daterange: 'daterange'
};

enum OrderCriteria {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('0')
  value_0,
  @JsonValue('1')
  value_1,
  @JsonValue('2')
  value_2,
  @JsonValue('3')
  value_3
}

const $OrderCriteriaMap = {
  OrderCriteria.value_0: '0',
  OrderCriteria.value_1: '1',
  OrderCriteria.value_2: '2',
  OrderCriteria.value_3: '3'
};

enum ProductType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('products')
  products,
  @JsonValue('services')
  services
}

const $ProductTypeMap = {
  ProductType.products: 'products',
  ProductType.services: 'services'
};
