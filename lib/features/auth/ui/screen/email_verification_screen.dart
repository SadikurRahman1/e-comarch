
import 'package:ecom/features/auth/ui/screen/otp_verification_screen.dart';
import 'package:ecom/features/auth/ui/widget/app_logo_widget.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_constants.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}
final TextEditingController _emailTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                  'Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your Email Address';
                    } if(AppConstants.emailRegex.hasMatch(value!) == false){
                      return 'Enter your valid Mobile Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    
                  onPressed: () {
                    // if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, OtpVerificationScreen.name);
                    // }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
