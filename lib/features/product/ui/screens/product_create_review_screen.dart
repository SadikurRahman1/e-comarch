import 'package:flutter/material.dart';

class ProductCreateReviewScreen extends StatefulWidget {
  const ProductCreateReviewScreen({super.key});

  static const name = '/product/product-create-review';

  @override
  State<ProductCreateReviewScreen> createState() => _ProductCreateReviewScreenState();
}

final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _descriptionTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ProductCreateReviewScreenState extends State<ProductCreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),

                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameTEController,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(hintText: 'Your Name'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter your Name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionTEController,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(hintText: 'Write a description ...'),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter The Description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                    _reviewSubmitButton();
                    }

                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _reviewSubmitButton() {
    /// ToDo : Review submit
  }
}
