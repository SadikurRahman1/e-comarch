import 'package:ecom/app/app_colors.dart';
import 'package:ecom/features/product/ui/screens/product_create_review_screen.dart';
import 'package:ecom/features/product/ui/widgets/color_picker_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/product_description_widget.dart';
import '../widgets/product_image_carousel_slider.dart';
import '../../../common/ui/widgets/product_quantity_inc_dec_button.dart';
import '../widgets/size_picker_widget.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key, required this.productId});

  static const String name = '/product/product-review';

  final int productId;

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                    const SizedBox(height: 16),
                    ProductDescriptionWidget(
                      icon: Icons.person_outline,
                      textThem: textThem,
                      name: 'Sadik',
                      description:
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildReviewSection(textThem)
        ],
      ),
    );
  }

  Widget _buildReviewSection(TextTheme textThem) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Review (00)',
            style: textThem.titleMedium,
          ),
          CircleAvatar(
            backgroundColor: AppColors.themeColor,
            radius: 24,
            child: IconButton(
              onPressed: () {
                _createReviewNextButton(context);
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _createReviewNextButton(context) {
  Navigator.pushNamed(context, ProductCreateReviewScreen.name);
}
