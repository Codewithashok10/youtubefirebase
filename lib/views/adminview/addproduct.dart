import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:youtubefirebase/controllers/admincontroller/productcontroller.dart';

import 'package:youtubefirebase/views/auth/authtextfeild.dart';

class AddProducts extends StatelessWidget {
  AddProducts({super.key});
  final ctrl = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Products"),
          centerTitle: true,
          actions: [
            ElevatedButton(
                onPressed: () {
                  ctrl.validate();
                },
                child: const Text("ADD"))
          ],
        ),
        body: Obx(
          () => ctrl.loading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  children: [
                    AuthTextFeild(
                      controller: ctrl.name,
                      icon: Icons.emoji_objects_outlined,
                      hint: "product name",
                    ),
                    AuthTextFeild(
                      controller: ctrl.description,
                      maxline: 4,
                      icon: Icons.emoji_objects_outlined,
                      hint: "description",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AuthTextFeild(
                            controller: ctrl.regularprice,
                            icon: Icons.emoji_objects_outlined,
                            hint: "regular price",
                            type: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: AuthTextFeild(
                            controller: ctrl.currentprice,
                            icon: Icons.emoji_objects_outlined,
                            hint: "current sprice",
                            type: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    AuthTextFeild(
                      controller: ctrl.brand,
                      icon: Icons.emoji_objects_outlined,
                      hint: "brand name",
                    ),
                    AuthTextFeild(
                      controller: ctrl.discount,
                      icon: Icons.emoji_objects_outlined,
                      hint: "discount",
                      type: TextInputType.number,
                    ),
                    AuthTextFeild(
                      controller: ctrl.stock,
                      icon: Icons.emoji_objects_outlined,
                      hint: "stock",
                      type: TextInputType.number,
                    ),
                    Obx(
                      () => AuthTextFeild(
                        readonly: true,
                        widget: true,
                        action: ctrl.categorydrop(),
                        icon: Icons.emoji_objects_outlined,
                        hint: ctrl.category.value,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => ctrl.imagepath.value != ""
                          ? Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              child: Image.file(File(ctrl.imagepath.value)))
                          : SizedBox(),
                    ),
                    TextButton(
                        onPressed: () {
                          ctrl.getImage();
                        },
                        child: Text("add image"))
                  ],
                ),
        ));
  }
}
