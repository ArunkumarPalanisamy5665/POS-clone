import 'package:flutter/material.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';
import 'custom_container.dart';

class HoverIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String asset;
  final bool isSvg;

  const HoverIconButton({
    required this.onTap,
    required this.asset,
    this.isSvg  = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      isNeedHover: true,
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(50),
      child: isSvg ?SvgPicture.asset(asset,height: 16, width: 16) :Image.asset(asset, height: 16, width: 16),
    );
  }
}
