import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
              viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason){
                _selectedIndex.value = currentIndex;
            }
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        // borderRadius: BorderRadius.circular(8)
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),

        ),


        Positioned(
          bottom: 8,
          left: 0,
          right: 0,

          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i=0; i<5; i++)
                     Container(
                       width: 16,
                       height: 16,
                       margin: EdgeInsets.symmetric(horizontal: 2),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: value == i ? AppColors.themeColor : Colors.white,
                       ),
                     ),
                ],
              );
            }
          ),
        )


      ],
    );
  }
}
