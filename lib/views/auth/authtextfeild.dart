import 'package:flutter/material.dart';

import 'package:youtubefirebase/conts/consts.dart';

class AuthTextFeild extends StatelessWidget {
  AuthTextFeild(
      {super.key,
      this.controller,
      this.widgetIcon,
      this.hint,
      this.icon,
      this.widget = false,
      this.maxline = 1,
      this.type = TextInputType.text,
      this.readonly = false,
      this.fn});
  TextEditingController? controller;
  String? hint;
  IconData? icon, widgetIcon;
  bool widget = false;
  void Function()? fn;
  int? maxline = 1;
  TextInputType? type;
  bool readonly = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: readonly ? 30 : 0),
      height: maxline! >= 2 ? 100 : 52,
      decoration: BoxDecoration(
          color: basecolour, borderRadius: BorderRadius.circular(12)),
      child: widget == true
          ? Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: readonly,
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        prefixIcon: readonly ? null : Icon(icon)),
                  ),
                ),
                IconButton(onPressed: fn, icon: Icon(widgetIcon))
              ],
            )
          : TextFormField(
              keyboardType: type,
              maxLines: maxline,
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  prefixIcon: readonly ? null : Icon(icon)),
            ),
    );
  }
}
