import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';

class CustomDropDownButtonEmployeesWidget extends StatelessWidget {
  const CustomDropDownButtonEmployeesWidget({
    super.key,
    required this.employees,
    required this.onChanged,
    required this.selectedEmployee,
  });

  final List<Employee> employees;
  final void Function(Employee?)? onChanged;
  final Employee? selectedEmployee;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kBlackColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: DropdownButton<Employee>(
          dropdownColor: MainColors.kWhiteColor,
          borderRadius: BorderRadius.circular(10.0),
          value: selectedEmployee,
          icon: const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
          elevation: 4,
          style: MainStyles.kBlackColorW500(16.0),
          underline: const SizedBox(),
          onChanged: onChanged,
          items: employees.map<DropdownMenuItem<Employee>>((Employee value) {
            return DropdownMenuItem<Employee>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
