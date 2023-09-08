import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/widgets/icon_button_widget.dart';

class StringItemWidget extends StatelessWidget {
  const StringItemWidget({super.key, required this.text, required this.deleteItem,});

  final String text;
  final void Function() deleteItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
          ),
        ),
        IconButtonWidget(
          onTap: deleteItem,
          icon: Icons.delete,
          iconSize: 22.0,
          verticalPadding: 6.0,
          horizontalPadding: 16.0,
        ),
      ],
    );
  }
}
