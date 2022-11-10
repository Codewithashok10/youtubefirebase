import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtubefirebase/controllers/filtercontroller.dart';
import 'package:youtubefirebase/views/filterpage.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final ctrl = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Products"), centerTitle: true, actions: [
        IconButton(
          icon: const Icon(Icons.sort_sharp),
          onPressed: () {
            Get.to(() => FilterPage());
          },
        ),
      ]),
      body: Obx(() => ctrl.productsList.isNotEmpty
          ? productsbuilder()
          : Center(child: Text("no products available"))),
    );
  }

  GridView productsbuilder() {
    return GridView.builder(
        itemCount: ctrl.productsList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (c, i) {
          final p = ctrl.productsList[i];
          return Card(
            color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   child: Image.network(p?.images ?? ""),
                // ),
                Text("${p.title}"),
                Text("brand : ${p.brand}"),
                Text("discount ${p.discountPercentage}"),
                Text("price : ${p.price}"),
              ],
            ),
          );
        });
  }
}
