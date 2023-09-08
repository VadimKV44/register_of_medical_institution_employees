import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';

class LocalStorage {
  static List<Employee> employees = [
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

  static  List<Patient> patients = [
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
}