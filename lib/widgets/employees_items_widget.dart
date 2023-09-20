import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/widgets/employees_item_widget.dart';

class EmployeesItemsWidget extends StatelessWidget {
  const EmployeesItemsWidget({
    super.key,
    required this.employees,
  });

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: employees.length,
          itemBuilder: (context, index) {
            return EmployeeItemWidget(
              employee: employees[index],
            );
          },
        ),
      ],
    );
  }
}
