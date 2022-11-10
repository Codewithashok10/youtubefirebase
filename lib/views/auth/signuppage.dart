import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:youtubefirebase/controllers/authcontroller.dart';
import 'package:youtubefirebase/conts/consts.dart';
import 'package:youtubefirebase/views/auth/authtextfeild.dart';
import 'package:youtubefirebase/views/auth/signinpage.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basecolour2,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Signup your Account to access \nthousands of products",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthTextFeild(
              controller: controller.username,
              hint: "username",
              icon: Icons.person,
            ),
            AuthTextFeild(
              controller: controller.email,
              hint: "email",
              icon: Icons.email_outlined,
            ),
            AuthTextFeild(
              controller: controller.password,
              widget: true,
              hint: "password",
              icon: Icons.lock,
            ),
            Obx(
              () => InkWell(
                onTap: () async {
                  if (controller.username.text.trim().isEmpty &&
                      controller.email.text.trim().isEmpty &&
                      controller.password.text.trim().isEmpty) {
                    Get.snackbar("error", "plz fill all the feilds");
                  } else {
                    await controller.signup();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  height: 52,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(12)),
                  child: controller.loading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                ),
              ),
            ),
            Row(
              children: const [
                Expanded(
                    child: Divider(
                  endIndent: 10,
                  thickness: 2,
                )),
                Text(
                  "OR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                  indent: 10,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                socialButton(svg: "assets/googlesvg.svg"),
                socialButton(svg: "assets/fbsvg.svg"),
                socialButton(icondata: true, icon: Icons.call)
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
                InkWell(
                  onTap: () => Get.to(() => const SigninPage()),
                  child: const Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget socialButton(
      {String? svg,
      void Function()? fn,
      bool icondata = false,
      IconData? icon}) {
    return InkWell(
      onTap: fn,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: basecolour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icondata
            ? Icon(
                icon,
                color: Colors.green,
                size: 40,
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  svg!,
                  fit: BoxFit.scaleDown,
                ),
              ),
      ),
    );
  }
}
