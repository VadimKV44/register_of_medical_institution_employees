import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/widgets/patient_item_widget.dart';

class PatientItemsWidget extends StatelessWidget {
  const PatientItemsWidget({
    super.key,
    required this.patients,
  });

  final List<Patient> patients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: patients.length,
      itemBuilder: (context, index) {
        return PatientItemWidget(
          patient: patients[index],
        );
      },
    );
  }
}
