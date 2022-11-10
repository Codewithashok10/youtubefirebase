import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtubefirebase/conts/consts.dart';

class AuthTextFeild extends StatelessWidget {
  AuthTextFeild(
      {super.key, this.controller, this.hint, this.icon, this.widget = false});
  TextEditingController? controller;
  String? hint;
  IconData? icon;
  bool widget = false;
  void Function()? fn;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15),
      // padding: EdgeInsets.symmetric(horizontal: 10),
      height: 52,
      decoration: BoxDecoration(
          color: basecolour, borderRadius: BorderRadius.circular(12)),
      child: widget == true
          ? Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        prefixIcon: Icon(icon)),
                  ),
                ),
                IconButton(onPressed: fn, icon: Icon(Icons.remove_red_eye))
              ],
            )
          : TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  prefixIcon: Icon(icon)),
            ),
    );
  }
}
