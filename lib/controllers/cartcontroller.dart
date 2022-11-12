import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:youtubefirebase/controllers/admincontroller/productcontroller.dart';
import 'package:youtubefirebase/models/datamodel.dart';
import 'package:youtubefirebase/models/productmodel.dart';

class CartController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var cartitems = <ProductModel>[].obs;
  var loading = false.obs;
  RxInt qty = 1.obs;
  var exist = false.obs;

  addtoCart(ProductModel productModel) async {
    try {
      loading.value = true;
      // ProductModel product = ProductModel(
      //   brand: productModel.brand,
      //   category: productModel.category,
      //   currentprice: productModel.currentprice,
      //   description: productModel.description,
      //   discount: productModel.discount,
      //   id: productModel.id,
      //    image: productModel.image,
      //    name: productModel.name

      // );
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("cart")
          .doc(productModel.id)
          .set(productModel.toJson())
          .then((value) async {
        await db
            .collection("Products")
            .doc(productModel.id)
            .update({"id": productModel.id});
      });

      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  check(id) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("cart")
        .get()
        .then((value) {
      final d = value.docs.map((e) => ProductModel.fromJson(e)).toList();
      for (var element in d) {
        if (element.id == id) {
          exist.value = true;
        } else {
          exist.value = false;
        }
      }
    });
  }

  getCartItem() async {
    db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("cart")
        .get()
        .then((value) {
      cartitems.value =
          value.docs.map((e) => ProductModel.fromJson(e)).toList();
    });
  }

  countplus(id) {
    qty.value++;
    db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("cart")
        .doc(id)
        .update({"qty": qty.value}).then((value) => getCartItem());
  }

  countminus(id) {
    if (qty.value <= 1) {
      qty.value = 1;
    } else {
      qty.value--;
      db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("cart")
          .doc(id)
          .update({"qty": qty.value}).then((value) => getCartItem());
    }
  }

  @override
  void onInit() {
    getCartItem();
    super.onInit();
  }
}
