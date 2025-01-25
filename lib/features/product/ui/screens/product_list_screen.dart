import 'package:ecom/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});

  static const String name = '/product/product-list-by-category';

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.66,
            crossAxisSpacing: 4,
            // mainAxisSpacing: 4,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductItemWidget());
          },
        ),
      ),
    );
  }
}
