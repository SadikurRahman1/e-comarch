import 'package:ecom/app/app_colors.dart';
import 'package:ecom/app/assets_path.dart';
import 'package:ecom/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecom/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecom/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ProductSearchBar(
                  controller: _searchBarTEController,
                ),
                const SizedBox(height: 16),
                const HomeCarouselSlider(),
                const SizedBox(height: 16),
                HomeSectionHeader(
                  title: 'Category',
                  onTap: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoryList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(
                  title: 'Popular',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(
                  title: 'Special',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(
                  title: 'New',
                  onTap: () {},
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: CategoryItemWidget(),
      ));
    }
    return categoryList;
  }
  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsPath.appHLogo,
        width: 100,
      ),
      actions: [
        AppBarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.call_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

