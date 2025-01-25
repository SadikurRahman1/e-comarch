import 'dart:async';
import 'package:ecom/app/app_colors.dart';
import 'package:ecom/app/app_constants.dart';
import 'package:ecom/features/auth/ui/widget/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  RxBool _enableResendOtpButton = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startResendCode();
  }

  void _startResendCode() {
    _enableResendOtpButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendOtpButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 digit otp has been sent to your email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: _otpTEController,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      // selectedFillColor: Colors.green,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // if(_formKey.currentState!.validate()){
                    //
                    // }
                    Navigator.pushNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                Obx(
                  () => Visibility(
                    visible: !_enableResendOtpButton.value,
                    child: RichText(
                      text: TextSpan(
                        text: 'This code Will be expire in',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '${_remainingTime}s',
                            style: const TextStyle(color: AppColors.themeColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: _enableResendOtpButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResendCode();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
