import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';

class TextBlockWidget extends StatelessWidget {
  const TextBlockWidget({
    super.key,
    required this.text,
    required this.title,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: MainStyles.kBlackColorW500(16.0),
        ),
        const SizedBox(width: 6.0),
        Text(
          text,
          style: MainStyles.kBlackColorW300(14.0),
        ),
      ],
    );
  }
}
