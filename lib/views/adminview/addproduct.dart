import 'package:flutter/material.dart';

import 'package:youtubefirebase/conts/consts.dart';

import 'package:youtubefirebase/views/auth/authtextfeild.dart';

class AddProducts extends StatelessWidget {
  AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
        centerTitle: true,
        actions: [ElevatedButton(onPressed: () {}, child: const Text("ADD"))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          AuthTextFeild(
            icon: Icons.emoji_objects_outlined,
            hint: "product name",
          ),
          AuthTextFeild(
            maxline: 4,
            icon: Icons.emoji_objects_outlined,
            hint: "description",
          ),
          Row(
            children: [
              Expanded(
                child: AuthTextFeild(
                  icon: Icons.emoji_objects_outlined,
                  hint: "regular price",
                  type: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: AuthTextFeild(
                  icon: Icons.emoji_objects_outlined,
                  hint: "current sprice",
                  type: TextInputType.number,
                ),
              ),
            ],
          ),
          AuthTextFeild(
            readonly: true,
            widget: true,
            widgetIcon: Icons.breakfast_dining,
            icon: Icons.emoji_objects_outlined,
            hint: "brand name",
          ),
          AuthTextFeild(
            icon: Icons.emoji_objects_outlined,
            hint: "discount",
            type: TextInputType.number,
          ),
          AuthTextFeild(
            icon: Icons.emoji_objects_outlined,
            hint: "stock",
            type: TextInputType.number,
          ),
          AuthTextFeild(
            readonly: true,
            widget: true,
            widgetIcon: Icons.breakfast_dining,
            icon: Icons.emoji_objects_outlined,
            hint: "category",
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: basecolour2),
                child: const Icon(
                  Icons.add,
                  size: 80,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
