import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:youtubefirebase/controllers/cartcontroller.dart';
import 'package:youtubefirebase/models/productmodel.dart';
import 'package:youtubefirebase/views/cartpage.dart';

class ProductsDetail extends StatelessWidget {
  ProductsDetail({super.key, required this.product});
  ProductModel product;
  final controller = Get.put(CartController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.to(CartPage()),
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Container(
            
            height: 200,
            color: Colors.amber,
            child: Image.network(
              product.image!,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.name!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    product.regularprice.toString(),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    product.currentprice.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Text(
                    " (${product.discount}% OFF)",
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              Obx(
                () => Row(children: [
                  TextButton(
                      onPressed: () async {
                        if (controller.exist.value == true) {
                          await controller.getCartItem();
                          await controller.check(product.id);
                          Get.to(() => CartPage());
                        } else {
                          await controller.addtoCart(product);
                          controller.check(product.id);
                        }
                      },
                      child: controller.exist.value == false
                          ? Text("Add to cart")
                          : Text("Go to cart")),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
