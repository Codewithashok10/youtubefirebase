import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:youtubefirebase/models/productmodel.dart';

class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.product, required this.onpress});
  ProductModel product;
  VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                      height: 180,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: product.image == null
                          ? Image.asset(
                              "assets/apple.png",
                              fit: BoxFit.cover,
                            )
                          : Image.network(product.image!)),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_rounded),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.name ?? "no name",
                maxLines: 2,
                style: const TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              //  if (product.rating != null)
              Text("Stock ${product.stock}"),
              const SizedBox(height: 8),
              Text('₹${product.currentprice}',
                  style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ],
          ),
        ),
      ),
    );
  }
}
