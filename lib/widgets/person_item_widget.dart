import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/widgets/text_block_widget.dart';

class PersonItemWidget extends StatelessWidget {
  const PersonItemWidget({
    super.key,
    this.employee,
    this.patient,
  });

  final Employee? employee;
  final Patient? patient;

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
                TextBlockWidget(title: Strings.name, text: employee?.name ?? patient?.name ?? ''),
                const Divider(color: MainColors.kGreyColor),
                TextBlockWidget(title: Strings.age, text: employee?.age.toString() ?? patient?.age.toString() ?? ''),
              ],
            ),
            const Divider(color: MainColors.kGreyColor),
            TextBlockWidget(title: Strings.gender, text: sexDetermination(employee?.gender, patient?.gender)),

            employee?.specialization != null ? const Divider(color: MainColors.kGreyColor) : const SizedBox(),
            employee?.specialization != null
                ? TextBlockWidget(title: Strings.specialization, text: employee?.specialization ?? '')
                : const SizedBox(),
            employee?.patients != null ? const Divider(color: MainColors.kGreyColor) : const SizedBox(),
            employee?.patients != null
                ? Row(
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
                            itemCount: employee?.patients?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  '${index + 1}) ${employee?.patients?[index]}',
                                  style: MainStyles.kBlackColorW300(16.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            patient?.complaints != null ? const Divider(color: MainColors.kGreyColor) : const SizedBox(),
            patient?.complaints != null ? Row(
              children: [
                Text(
                  Strings.complaints,
                  style: MainStyles.kBlackColorW500(16.0),
                ),
                Expanded(
                  child: SizedBox(
                    height: 16.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: patient?.complaints?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            '${patient?.complaints?[index] ?? ''};',
                            style: MainStyles.kBlackColorW300(14.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ) : const SizedBox(),
            patient?.diagnosis != null ? const Divider(color: MainColors.kGreyColor) : const SizedBox(),
            patient?.diagnosis != null ? TextBlockWidget(title: Strings.diagnosis, text: patient?.diagnosis ?? '') : const SizedBox(),
            const Divider(color: MainColors.kGreyColor),
            patient?.attendingDoctor != null ? TextBlockWidget(title: Strings.attendingDoctor, text: patient?.attendingDoctor?.name ?? '') : const SizedBox(),
          ],
        ),
      ),
    );
  }

  String sexDetermination(Gender? firstGender, Gender? secondGender) {
    String gender = '';
    if (firstGender != null) {
      gender = firstGender == Gender.male ? Strings.male : Strings.female;
    } else if (secondGender != null) {
      gender = secondGender == Gender.male ? Strings.male : Strings.female;
    }
    return gender;
  }
}
