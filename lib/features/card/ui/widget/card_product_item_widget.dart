import 'package:ecom/app/app_colors.dart';
import 'package:ecom/app/assets_path.dart';
import 'package:ecom/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardProductItemWidget extends StatelessWidget {
  const CardProductItemWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Card(
        elevation: 1,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsPath.shoes_1,
                width: 90,
                height: 90,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 8),

              Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Nike ShoeNike ShoeNike ShoeNike Shoe',
                                  maxLines: 1,
                                  style: textThem.bodyLarge?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Text('Color : Red'),
                                    SizedBox(width: 8),
                                    Text('Size : XL'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$100',
                            style: TextStyle(
                                color: AppColors.themeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          ProductQuantityIncDecButton(
                              onChange: (int noOfItem) {})
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
