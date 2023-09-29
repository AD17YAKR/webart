import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/register_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildGradientContainer(context),
          );
        },
      ),
    );
  }

  Widget _buildGradientContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(),
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
            controller.isSent.value
                ? _buildOTPTextField()
                : Column(
                    children: [
                      _buildTextField('UserName', controller.userNameController,
                          (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Username';
                        }
                        return null;
                      }),
                      const SizedBox(height: 20.0),
                      _buildEmailField(),
                      const SizedBox(height: 20.0),
                      _buildPhoneNumberField(),
                      const SizedBox(height: 20.0),
                      _buildPasswordField(),
                    ],
                  ),
            controller.isSent.value
                ? _buildVerifyOTP()
                : _buildReceiveOtpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return _buildTextField('Email', controller.emailController, (value) {
      if (value!.isEmpty) {
        return 'Please enter your email';
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    });
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: controller.passwordController,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      obscureText: controller.isPasswordVisible.value,
      decoration: InputDecoration(
        suffix: InkWell(
          onTap: () {
            controller.togglePasswordVisibility();
          },
          child: FaIcon(controller.isPasswordVisible.value
              ? FontAwesomeIcons.eyeLowVision
              : FontAwesomeIcons.eye),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: 'Password',
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
        } else if (value.length < 8) {
          return 'Password must be 8 character or more';
        }
        return null;
      },
    );
  }

  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: hintText,
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
      validator: validator,
    );
  }

  Widget _buildReceiveOtpButton() {
    return ElevatedButton(
      onPressed: () {
        controller.registerButtonPressed();
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
          'Receive OTP',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyOTP() {
    return ElevatedButton(
      onPressed: () {
        controller.verifyButtonPressed();
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
          'Verify OTP',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: controller.phoneController,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: 'Phone Number',
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
          return 'Phone Number cannot be empty';
        } else if (value.length != 10) {
          return 'Invalid Phone Number';
        }
        return null;
      },
    );
  }

  Widget _buildOTPTextField() {
    return Column(
      children: [
        TextFormField(
          controller: controller.otpController,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            hintText: 'OTP',
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
              return 'OTP cannot be empty';
            } else if (value.length != 6) {
              return 'Invalid OTP';
            }
            return null;
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              controller.resendOTPPressed();
            },
            child: const Text(
              'Resend OTP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
