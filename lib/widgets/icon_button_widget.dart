import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconSize = 30.0,
    this.horizontalPadding = 9.0,
    this.verticalPadding = 9.0,
  });

  final void Function() onTap;
  final IconData? icon;
  final double iconSize;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: MainColors.kBlackColor.withOpacity(0.05),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Icon(
              icon,
              size: iconSize,
              color: MainColors.kBlackColor,
            ),
          ),
        ),
      ),
    );
  }
}
