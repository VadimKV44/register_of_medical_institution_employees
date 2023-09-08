import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/widgets/custom_button_widget_2.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.gender,
    required this.firstButtonOnTap,
    required this.secondButtonOnTap,
  });

  final bool gender;
  final void Function() firstButtonOnTap;
  final void Function() secondButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonWidget2(
            text: Strings.male,
            borderColor: gender ? MainColors.kGreyColor.withOpacity(0.8) : MainColors.kGreyColor.withOpacity(0.05),
            onTap: firstButtonOnTap,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: CustomButtonWidget2(
            text: Strings.female,
            borderColor: !gender ? MainColors.kGreyColor.withOpacity(0.8) : MainColors.kGreyColor.withOpacity(0.05),
            onTap: secondButtonOnTap,
          ),
        ),
      ],
    );
  }
}
