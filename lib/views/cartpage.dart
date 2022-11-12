import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:youtubefirebase/controllers/cartcontroller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final controller = Get.put(CartController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: controller.cartitems.length,
            itemBuilder: (c, i) {
              final item = controller.cartitems[i];
              return Container(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      child: Image.network(item.image!),
                    )),
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name!),
                              Text(
                                item.description!,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  Text(((item.currentprice)! * (item.qty!))
                                      .toString()),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        controller.countminus(item.id);
                                      },
                                      icon:
                                          const Icon(Icons.minimize_outlined)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      item.qty.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.countplus(item.id);
                                      },
                                      icon:
                                          const Icon(Icons.minimize_outlined)),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              );
            }));
  }
}
