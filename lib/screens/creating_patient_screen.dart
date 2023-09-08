import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/local_storage/local_storage.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/widgets/custom_button_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/custom_drop_down_button_employees_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/custom_text_field.dart';
import 'package:register_of_medical_institution_employees/widgets/gender_selection_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/icon_button_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/string_item_widget.dart';

class CreatingPatientScreen extends StatefulWidget {
  const CreatingPatientScreen({super.key});

  @override
  State<CreatingPatientScreen> createState() => _CreatingPatientScreenState();
}

class _CreatingPatientScreenState extends State<CreatingPatientScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _complaintsController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();

  /// gender true = male; gender false = female
  bool gender = true;

  List<String> complaints = ['Головная боль', 'Усталость'];

  Employee? selectedEmployee;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _complaintsController.dispose();
    _diagnosisController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: MainColors.kWhiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: [
                const SizedBox(height: 40.0),
                CustomTextField(
                  controller: _nameController,
                  labelText: Strings.name,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _ageController,
                  labelText: Strings.age,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 20.0),
                GenderSelectionWidget(
                  gender: gender,
                  firstButtonOnTap: () {
                    setState(() {
                      gender = true;
                    });
                  },
                  secondButtonOnTap: () {
                    setState(() {
                      gender = false;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _complaintsController,
                        labelText: Strings.enterPatientsComplaints,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    IconButtonWidget(
                      onTap: () {},
                      icon: Icons.add,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  Strings.patientComplaints,
                  style: MainStyles.kBlackColorW300(16.0),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: MainColors.kBlackColor.withOpacity(0.02),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: complaints.length,
                    itemBuilder: (context, index) {
                      return StringItemWidget(
                        text: complaints[index],
                        deleteItem: () {},
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(height: 2.0, color: MainColors.kBlackColor.withOpacity(0.5));
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _diagnosisController,
                  labelText: Strings.diagnosis,
                ),
                const SizedBox(height: 20.0),
                CustomDropDownButtonEmployeesWidget(
                  employees: LocalStorage.employees,
                  selectedEmployee: selectedEmployee,
                  onChanged: (value) {
                    setState(() {
                      selectedEmployee = value!;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonWidget(
                      onTap: () {},
                      text: Strings.save,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
