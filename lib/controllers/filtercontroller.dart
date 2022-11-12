import 'dart:developer';

import 'package:get/get.dart';

import 'package:youtubefirebase/models/datamodel.dart';
import 'package:http/http.dart' as http;

class FilterController extends GetxController {
  var productsList = <Product>[].obs;
  Rx<Products> products = Products().obs;

  var priceslist = <int>[].obs;
  var brandlist = <String>[].obs;
  var disclist = <double>[].obs;

  getProducts() async {
    Uri url = Uri.parse("http://192.168.17.142:1003/products");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        products.value = productsFromJson(res.body); // actual list

        // filter list with conditions
        // when it was initialy no filters (e.price! >= 0) this condition will excute
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

  @override
  void onInit() {
    getProducts();
    log(brandlist.length.toString());
    super.onInit();
  }
}
