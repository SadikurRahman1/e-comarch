import 'package:ecom/app/app_constants.dart';
import 'package:ecom/features/auth/ui/widget/app_logo_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _cityTEController = TextEditingController();
final TextEditingController _shippingTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // const SizedBox(height: 20),
              const AppLogoWidget(
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 16),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Get Started with us with your details',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildForm(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // if(_formKey.currentState!.validate()){
                  //   Navigator.pushNamed(context, CompleteProfileScreen.name);
                  // }
                },
                child: const Text('Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameTEController,
              keyboardType: TextInputType.name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your First Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _lastNameTEController,
              keyboardType: TextInputType.name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your Last Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              // maxLength: 11,
              controller: _mobileTEController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Mobile',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your Mobile Number';
                } if(AppConstants.mobileRegex.hasMatch(value!) == false){
                  return 'Enter your valid Mobile Number';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _cityTEController,
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'City',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your City';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 3,
              controller: _shippingTEController,
              keyboardType: TextInputType.streetAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Shipping Address',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your Shipping Address';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
