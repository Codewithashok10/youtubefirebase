import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtubefirebase/models/productmodel.dart';
import 'package:youtubefirebase/views/home/homepage.dart';

class AddProductController extends GetxController {
  var loading = false.obs;
  var productsList = <ProductModel>[].obs;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController regularprice = TextEditingController();
  TextEditingController currentprice = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController stock = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  XFile? image;
  var imagepath = "".obs;
  var imageurl = "".obs;
  var category = "select category".obs;
  ImagePicker picker = ImagePicker();
  getImage() async {
    var i = await picker.pickImage(source: ImageSource.gallery);
    if (i != null) {
      image = i;
      imagepath.value = image?.path ?? "";
    }
  }

  getProduct() async {
    await db.collection("Products").get().then((value) {
      if (value != null) {
        productsList.value =
            value.docs.map((e) => ProductModel.fromJson(e)).toList();
        log(productsList.value.toString());
      }
    });
  }

  uploadProduct() async {
    try {
      loading.value = true;
      await uploadImage(imagepath.value);
      ProductModel product = ProductModel(
          name: name.text,
          brand: brand.text,
          category: category.value,
          currentprice: double.parse(currentprice.text),
          regularprice: double.parse(regularprice.text),
          description: description.text,
          discount: double.parse(discount.text),
          image: imageurl.value,
          stock: double.parse(stock.text));
      await db.collection("Products").add(product.toJson());
      loading.value = false;
      Get.snackbar("productAdded", "Succesfully");
      await getProduct();
      Get.to(() => HomePage());
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  uploadImage(String file) async {
    final uploadtask = await storage
        .ref()
        .child("/productsImages")
        .putFile(File(imagepath.value));
    String url = await uploadtask.ref.getDownloadURL();
    imageurl.value = url;
  }

  DropdownButton categorydrop() {
    return DropdownButton(
        items: categorylist.map((e) {
          return DropdownMenuItem(value: e, child: Text(e));
        }).toList(),
        onChanged: (v) {
          category.value = v;
        });
  }

  validate() {
    if (brand.text.trim().isEmpty &&
        name.text.trim().isEmpty &&
        regularprice.text.trim().isEmpty &&
        currentprice.text.trim().isEmpty &&
        discount.text.trim().isEmpty &&
        stock.text.trim().isEmpty &&
        category.value == "select category" &&
        brand.text.trim().isEmpty &&
        brand.text.trim().isEmpty) {
      Get.snackbar("error", "All Feidls required");
    } else if (imagepath.value == "") {
      Get.snackbar("error", "plz select image");
    } else {
      uploadProduct();
    }
  }

  List<String> categorylist = [
    "select category",
    "mobile",
    "shoes",
    "shirt",
    "teleivision",
  ];
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }
}
