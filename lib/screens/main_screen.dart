import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/widgets/employees_item_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/patient_item_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10.0, bottom: 80.0, left: 20.0, right: 20.0),
          child: Column(
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return PatientItemWidget(
                    patient: patients[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Employee> employees = [
  Employee(
    name: 'Иван Иванов',
    age: 40,
    gender: Gender.male,
    specialization: 'Стоматолог',
    patients: ['Аслан Коазаев', 'Давид Джелиев'],
  ),
  Employee(
    name: 'Дмитрий Деметьев',
    age: 50,
    gender: Gender.male,
    specialization: 'Терапевт',
    patients: ['Катя Иванова'],
  ),
];

List<Patient> patients = [
  Patient(
    name: 'Катя Иванова',
    age: 32,
    gender: Gender.female,
    complaints: ['Головная боль', 'Усталость'],
    diagnosis: 'Мигрень',
    attendingDoctor: Employee(
      name: 'Дмитрий Деметьев',
      age: 50,
      gender: Gender.male,
      specialization: 'Терапевт',
      patients: ['Катя Иванова'],
    ),
  ),

  Patient(
    name: 'Аслан Коазаев',
    age: 26,
    gender: Gender.male,
    complaints: ['Боль в зубах'],
    diagnosis: 'Кариес',
    attendingDoctor: Employee(
      name: 'Иван Иванов',
      age: 40,
      gender: Gender.male,
      specialization: 'Стоматолог',
      patients: ['Аслан Коазаев', 'Давид Джелиев'],
    ),
  ),
  Patient(
    name: 'Давид Джелиев',
    age: 22,
    gender: Gender.male,
    complaints: ['Боль в зубах'],
    diagnosis: 'Кариес',
    attendingDoctor: Employee(
      name: 'Иван Иванов',
      age: 40,
      gender: Gender.male,
      specialization: 'Стоматолог',
      patients: ['Аслан Коазаев', 'Давид Джелиев'],
    ),
  ),
];

