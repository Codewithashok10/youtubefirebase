import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:youtubefirebase/controllers/filtercontroller.dart';
import 'package:youtubefirebase/models/filtermodel.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final ctrl = Get.put(ProductController());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await ctrl.getProducts();
                  Get.back();
                },
                icon: Icon(Icons.check))
          ],
        ),
        body: Container(
          //  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.blue.shade100,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        color: index == 0 ? Colors.white : Colors.blue.shade100,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                index = 0;
                              });
                            },
                            child: const Text("BRAND"))),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        color: index == 1 ? Colors.white : Colors.blue.shade100,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: const Text("PRICE"))),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 60,
                        color: index == 2 ? Colors.white : Colors.blue.shade100,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: const Text("DISCOUNT"))),
                  ],
                ),
              )),
              Expanded(
                  flex: 3,
                  child: index == 0
                      ? brandui()
                      : index == 1
                          ? priceui()
                          : discountui()),
            ],
          ),
        ));
  }

  /// filter ui

  ListView discountui() {
    return ListView.builder(
        itemCount: listoffilerdiscount.length,
        itemBuilder: (c, i) {
          final f = listoffilerdiscount[i];
          return ListTile(
              onTap: () {
                // add or remove items from discoutn filter list
                setState(() {
                  f.isfilter = !f.isfilter;
                });
                if (f.isfilter == true) {
                  setState(() {
                    ctrl.disclist.add(f.discount!);
                    log(ctrl.disclist.length.toString());
                  });
                } else {
                  setState(() {
                    ctrl.disclist.remove(f.discount);
                    log(ctrl.disclist.length.toString());
                  });
                }
              },
              leading: Checkbox(
                onChanged: (v) {
                  f.isfilter = !f.isfilter;
                  if (f.isfilter == true) {
                    setState(() {
                      ctrl.disclist.add(f.discount!);
                      log(ctrl.disclist.length.toString());
                    });
                  } else {
                    setState(() {
                      ctrl.disclist.remove(f.discount);
                      log(ctrl.disclist.length.toString());
                    });
                  }
                },
                value: f.isfilter,
              ),
              title: Text(
                  "${f.discount.toString().substring(0, 2)}% or more discount"));
        });
  }

  ListView priceui() {
    return ListView.builder(
        itemCount: listoffilterprice.length,
        itemBuilder: (c, i) {
          final f = listoffilterprice[i];
          return ListTile(
              onTap: () {
                // add or remove items from price filter list
                setState(() {
                  f.isfilter = !f.isfilter;
                });
                if (f.isfilter == true) {
                  setState(() {
                    ctrl.priceslist.add(f.price!);
                    log(ctrl.priceslist.length.toString());
                  });
                } else {
                  setState(() {
                    ctrl.priceslist.remove(f.price);
                    log(ctrl.priceslist.length.toString());
                  });
                }
              },
              leading: Checkbox(
                onChanged: (v) {
                  f.isfilter = !f.isfilter;
                  if (f.isfilter == true) {
                    setState(() {
                      ctrl.priceslist.add(f.price!);
                      log(ctrl.priceslist.length.toString());
                    });
                  } else {
                    setState(() {
                      ctrl.priceslist.remove(f.price);
                      log(ctrl.priceslist.length.toString());
                    });
                  }
                },
                value: f.isfilter,
              ),
              title: Text("more then ${f.price}rs"));
        });
  }

  ListView brandui() {
    return ListView.builder(
        itemCount: listOfFilterBrands.length,
        itemBuilder: (c, i) {
          final f = listOfFilterBrands[i];
          return ListTile(
              onTap: () {
                // add or remove items from brand filter list
                setState(() {
                  f.isfilter = !f.isfilter;
                });
                if (f.isfilter == true) {
                  setState(() {
                    ctrl.brandlist.add(f.brand!);
                    log(ctrl.brandlist.length.toString());
                  });
                } else {
                  setState(() {
                    ctrl.brandlist.remove(f.brand);
                    log(ctrl.brandlist.length.toString());
                  });
                }
              },
              leading: Checkbox(
                onChanged: (v) {
                  f.isfilter = !f.isfilter;
                  if (f.isfilter == true) {
                    setState(() {
                      ctrl.brandlist.add(f.brand!);
                      log(ctrl.brandlist.length.toString());
                    });
                  } else {
                    setState(() {
                      ctrl.brandlist.remove(f.brand);
                      log(ctrl.brandlist.length.toString());
                    });
                  }
                },
                value: f.isfilter,
              ),
              title: Text(f.brand!));
        });
  }
}

// List<List<dynamic>> filterData = [brand, price, discount];
// List<Widget> brand = [Text("Apple")];
// List<dynamic> discount = [0.0, 10.0, 20.0, 30.0, 50.0];
// List<dynamic> price = [0, 100, 500, 1000, 2000];

// List<dynamic> brand = ["Apple", "Oppo", "Huwei", "Samsung"];
// ListView.builder(
//                     itemCount: brand.length,
//                     itemBuilder: ((context, i) {
//                       return Obx(
//                         () => CheckboxListTile(
//                             title: Text(brand[i]),
//                             activeColor: Colors.blue,
//                             value: ctrl.isselected.value,
//                             onChanged: (v) {
//                               ctrl.isselected.value = v!;
//                             }),
//                       );
//                     })),

// sample(FilterBrand brand){
//  buildceckbox(brand: brand, fn: (){

//  })
// }

ListTile buildceckbox(
    {required bool brand,
    required String text,
    required void Function() fn,
    required bool i}) {
  return ListTile(
    onTap: fn,
    leading: Checkbox(
      onChanged: (v) => {fn, i = v!},
      value: brand,
    ),
    title: Text(text),
  );
}
