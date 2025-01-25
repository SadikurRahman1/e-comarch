import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
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
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),

        ),

        const SizedBox(height: 8,),
        ValueListenableBuilder(
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
                       color: value == i ? AppColors.themeColor : Colors.grey.shade300,
                     ),
                   ),
              ],
            );
          }
        )


      ],
    );
  }
}
