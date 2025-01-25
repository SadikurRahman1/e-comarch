
import 'package:ecom/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    this.width,
    this.height,
    this.boxFit,
  });

  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appVLogo,
      width: width ?? 200,
      height: height ?? 200,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}