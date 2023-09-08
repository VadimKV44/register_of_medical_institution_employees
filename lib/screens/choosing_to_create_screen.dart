import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/screens/creating_employee_screen.dart';
import 'package:register_of_medical_institution_employees/screens/creating_patient_screen.dart';
import 'package:register_of_medical_institution_employees/widgets/custom_button_widget.dart';

class ChoosingToCreateScreen extends StatelessWidget {
  const ChoosingToCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                Strings.chooseWhoYouWantToAdd,
                textAlign: TextAlign.center,
                style: MainStyles.kBlackColorW500(30.0),
              ),
            ),
            const SizedBox(height: 40.0),
            CustomButtonWidget(
              onTap: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatingPatientScreen()));
                if (result == true && context.mounted) {
                  Navigator.pop(context);
                }
              },
              text: Strings.patient,
            ),
            const SizedBox(height: 20.0),
            CustomButtonWidget(
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatingEmployeeScreen()));
              },
              text: Strings.employee,
            ),
          ],
        ),
      ),
    );
  }
}
