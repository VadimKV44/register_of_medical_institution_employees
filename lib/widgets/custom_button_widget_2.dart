import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';

class CustomButtonWidget2 extends StatelessWidget {
  const CustomButtonWidget2({
    super.key,
    required this.onTap,
    required this.text,
    required this.borderColor,
  });

  final void Function() onTap;
  final String text;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: MainColors.kBlackColor.withOpacity(0.05),
        border: Border.all(color: borderColor, width: 2.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: MainStyles.kBlackColorW500(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
