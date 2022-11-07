import 'package:youtubefirebase/views/filterpage.dart';

class FilterBrand {
  String? brand;
  bool isfilter = false;
  FilterBrand({this.brand, this.isfilter = false});
}

class FilterPrice {
  int? price;
  bool isfilter = false;
  FilterPrice({this.price, this.isfilter = false});
}

class FilterDiscount {
  double? discount;
  bool isfilter = false;
  FilterDiscount({this.discount, this.isfilter = false});
}

List<FilterBrand> listOfFilterBrands = [
  FilterBrand(brand: "Apple", isfilter: false),
  FilterBrand(brand: "Samsung", isfilter: false),
  FilterBrand(brand: "Huwei", isfilter: false),
  FilterBrand(brand: "Oppo", isfilter: false),
];
List<FilterPrice> listoffilterprice = [
  FilterPrice(isfilter: false, price: 100),
  FilterPrice(isfilter: false, price: 500),
  FilterPrice(isfilter: false, price: 1000),
  FilterPrice(isfilter: false, price: 1250),
  FilterPrice(isfilter: false, price: 1500)
];

List<FilterDiscount> listoffilerdiscount = [
  FilterDiscount(discount: 10.0, isfilter: false),
  FilterDiscount(discount: 20.0, isfilter: false),
  FilterDiscount(discount: 30.0, isfilter: false),
  FilterDiscount(discount: 40.0, isfilter: false),
  FilterDiscount(discount: 50.0, isfilter: false),
];
