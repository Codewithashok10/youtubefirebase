import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:youtubefirebase/controllers/admincontroller/productcontroller.dart';
import 'package:youtubefirebase/controllers/cartcontroller.dart';
import 'package:youtubefirebase/conts/consts.dart';
import 'package:youtubefirebase/views/adminview/addproduct.dart';
import 'package:youtubefirebase/views/productview.dart';
import 'package:youtubefirebase/views/utils/producttile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;
  final controller = Get.put(AddProductController());
  final ctrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: basecolour2,
        appBar: AppBar(
          title: const Text("homePage"),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () async {
                  Get.to(AddProducts());
                  // await auth.signOut();
                },
                child: Text("add"))
          ],
        ),
        body: Obx(() => controller.productsList.isEmpty
            ? const Center(
                child: Text("No Products"),
              )
            : GridView.builder(
                itemCount: controller.productsList.length,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6, crossAxisCount: 2),
                itemBuilder: (c, i) {
                  final products = controller.productsList[i];
                  return ProductTile(
                    onpress: () async {
                      await ctrl.getCartItem();
                      await ctrl.check(products);
                      Get.to(() => ProductsDetail(
                            product: products,
                          ));
                    },
                    product: products,
                  );
                })));
  }
}
