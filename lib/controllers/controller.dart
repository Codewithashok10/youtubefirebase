import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtubefirebase/models/model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productsList = <Product>[].obs;
  Rx<Products> products = Products().obs;
  var brand = "select brand".obs;
  RxInt price = 0.obs;
  RxDouble dis = 0.0.obs;
  RxBool isselected = false.obs;
  var priceslist = <int>[].obs;
  var brandlist = <String>[].obs;
  var disclist = <double>[].obs;

  getProducts() async {
    Uri url = Uri.parse("http://192.168.17.142:1003/products");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        products.value = productsFromJson(res.body);
        productsList.value = products.value.products
                ?.where((e) => brandlist.isEmpty &&
                        disclist.isEmpty &&
                        priceslist.isEmpty
                    ? e.price! >= 0
                    : brandlist.isEmpty && disclist.isEmpty
                        ? priceslist.any(
                            (element) => e.price! >= element ? true : false)
                        : brandlist.isEmpty && priceslist.isEmpty
                            ? disclist.any((element) =>
                                e.discountPercentage! >= element ? true : false)
                            : priceslist.isEmpty && disclist.isEmpty
                                ? brandlist.any((element) =>
                                    e.brand == element ? true : false)
                                : brandlist.isNotEmpty &&
                                        disclist.isNotEmpty &&
                                        priceslist.isNotEmpty
                                    ? disclist.any((element) => e.discountPercentage! >= element ? true : false) &&
                                        brandlist.any((element) => e.brand == element
                                            ? true
                                            : false) &&
                                        priceslist.any((element) =>
                                            e.price! >= element ? true : false)
                                    : brandlist.isEmpty
                                        ? disclist.any((element) => e.discountPercentage! >= element ? true : false) &&
                                            priceslist.any((element) => e.price! >= element ? true : false)
                                        : disclist.isEmpty
                                            ? brandlist.any((element) => e.brand == element ? true : false) && priceslist.any((element) => e.price! >= element ? true : false)
                                            : priceslist.isEmpty
                                                ? brandlist.any((element) => e.brand == element ? true : false) && disclist.any((element) => e.discountPercentage! >= element ? true : false)
                                                : e.price! >= 0)
                .toList() ??
            [];
        log(productsList.value.toString());
      } else {
        Get.snackbar("title", "message");
      }
    } catch (e) {
      Get.snackbar("title", "$e");
    }
  }

  DropdownButton branddrop(List list) {
    return DropdownButton(
        value: brand.value,
        hint: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Select brand"),
        ),
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
        onChanged: (val) {
          brand.value = val ?? "";
          log(brand.value);
        });
  }

  DropdownButton pricedrop(List list) {
    return DropdownButton(
        value: price.value,
        hint: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Select price"),
        ),
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(value: e, child: Text("below $e rs"));
        }).toList(),
        onChanged: (val) {
          price.value = val ?? 0;
          log(brand.value);
        });
  }

  DropdownButton disdrop(List list) {
    return DropdownButton(
        value: dis.value,
        hint: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Select discount"),
        ),
        isExpanded: true,
        items: list.map((e) {
          return DropdownMenuItem(
              value: e,
              child: Text("${e.toString().substring(0, 2)}% or more"));
        }).toList(),
        onChanged: (val) {
          dis.value = val ?? 0.0;
          log(brand.value);
        });
  }

  @override
  void onInit() {
    getProducts();
    log(brandlist.length.toString());
    super.onInit();
  }
}

var brands = <String>[];
var prices = <int>[];
var discounts = <double>[];


// brand.value == "select brand"
//                     ? e.price! >= price.value &&
//                         e.discountPercentage! >= dis.value
//                     : e.brand == brand.value &&
//                         e.price! >= price.value &&
//                         e.discountPercentage! >= dis.value