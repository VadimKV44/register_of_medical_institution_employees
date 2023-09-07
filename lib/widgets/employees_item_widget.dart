import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/widgets/text_block_widget.dart';

class EmployeeItemWidget extends StatelessWidget {
  const EmployeeItemWidget({super.key, required this.employee,});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: MainColors.kGreyColor.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBlockWidget(title: Strings.name, text: employee.name),
                const Divider(color: MainColors.kGreyColor),
                TextBlockWidget(title: Strings.age, text: employee.age.toString()),
              ],
            ),
            const Divider(color: MainColors.kGreyColor),
            TextBlockWidget(title: Strings.gender, text: employee.gender == Gender.male ? Strings.male : Strings.female),
            const Divider(color: MainColors.kGreyColor),
            TextBlockWidget(title: Strings.specialization, text: employee.specialization ?? ''),
            const Divider(color: MainColors.kGreyColor),
            Row(
              children: [
                Text(
                  Strings.patients,
                  style: MainStyles.kBlackColorW500(16.0),
                ),
                Expanded(
                  child: SizedBox(
                    height: 20.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: employee.patients?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            '${index + 1}) ${employee.patients?[index]}',
                            style: MainStyles.kBlackColorW300(16.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
