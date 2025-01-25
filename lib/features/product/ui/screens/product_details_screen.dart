import 'package:ecom/app/app_colors.dart';
import 'package:ecom/features/product/ui/screens/product_review_screen.dart';
import 'package:ecom/features/product/ui/widgets/color_picker_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/product_image_carousel_slider.dart';
import '../widgets/product_quantity_inc_dec_button.dart';
import '../widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product/product-details';

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nike shoe A2 Nike shoe A2 Nike shoe A2 ',
                                    style: textThem.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      const Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, ProductReviewScreen.name,
                                              arguments: 1);
                                        },
                                        child: const Text('Reviews'),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: AppColors.themeColor,
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            ProductQuantityIncDecButton(
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Color',
                          style: textThem.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        ColorPickerWidget(
                          colors: const ['red', 'green', 'blue'],
                          onColorSelected: (String selectedColor) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Size',
                          style: textThem.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        SizePickerWidget(
                          sizes: const ['S', 'M', 'L','XL', 'XXL'],
                          onSizeSelected: (String selectedSize) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Description',
                          style: textThem.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ''',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildAddToCardSection(textThem)
        ],
      ),
    );
  }

  Widget _buildAddToCardSection(TextTheme textThem) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: textThem.titleSmall,
              ),
              const Text('\$100',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor)),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Card'),
            ),
          )
        ],
      ),
    );
  }
}
