import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(),
                    Align(
                      child: Text(
                        "WEBART",
                        style: GoogleFonts.fredoka(
                          fontSize: 60.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildInputFields(),
                        const SizedBox(height: 30.0),
                        _buildContinueButton(),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Don,t Have an account, Register Here!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInputFields() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.emailController,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email cannot be empty';
              }
              final emailRegex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }

              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              hintText: "Email",
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              fillColor: Colors.white.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: controller.passwordController,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            obscureText: controller.isPasswordVisible.value,
            decoration: InputDecoration(
              isDense: true,
              suffix: InkWell(
                onTap: () {
                  controller.togglePasswordVisibility();
                },
                child: FaIcon(controller.isPasswordVisible.value
                    ? FontAwesomeIcons.eyeLowVision
                    : FontAwesomeIcons.eye),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              hintText: "Password",
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              fillColor: Colors.white.withOpacity(0.6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {
        controller.loginButtonPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'Continue',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
