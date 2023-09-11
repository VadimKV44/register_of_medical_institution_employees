import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';

class LocalStorage {
  static List<Employee> employees = [
    Employee(
      id: 'b96891b0-07ce-1cd8-a8a5-5589416f1527',
      name: 'Иван Иванов',
      age: 40,
      gender: Gender.male,
      specialization: 'Стоматолог',
      patients: [
        Patient(
          id: 'b9cc3580-07ce-1cd8-a8a5-5589416f1527',
          name: 'Аслан Коазаев',
          age: 26,
          gender: Gender.male,
          complaints: ['Боль в зубах'],
          diagnosis: 'Кариес',
          attendingDoctor: null,
        ),
        Patient(
          id: 'b9d78020-07ce-1cd8-a8a5-5589416f1527',
          name: 'Давид Джелиев',
          age: 22,
          gender: Gender.male,
          complaints: ['Боль в зубах'],
          diagnosis: 'Кариес',
          attendingDoctor: null,
        ),
      ],
    ),
    Employee(
      id: 'b9b419a0-07ce-1cd8-a8a5-5589416f1527',
      name: 'Дмитрий Деметьев',
      age: 50,
      gender: Gender.male,
      specialization: 'Терапевт',
      patients: [
        Patient(
          id: 'b9c16010-07ce-1cd8-a8a5-5589416f1527',
          name: 'Катя Иванова',
          age: 32,
          gender: Gender.female,
          complaints: ['Головная боль', 'Усталость'],
          diagnosis: 'Мигрень',
          attendingDoctor: null,
        ),
      ],
    ),
  ];

  static List<Patient> patients = [
    Patient(
      id: 'b9c16010-07ce-1cd8-a8a5-5589416f1527',
      name: 'Катя Иванова',
      age: 32,
      gender: Gender.female,
      complaints: ['Головная боль', 'Усталость'],
      diagnosis: 'Мигрень',
      attendingDoctor: Employee(
        id: 'b9b419a0-07ce-1cd8-a8a5-5589416f1527',
        name: 'Дмитрий Деметьев',
        age: 50,
        gender: Gender.male,
        specialization: 'Терапевт',
        patients: [],
      ),
    ),
    Patient(
      id: 'b9cc3580-07ce-1cd8-a8a5-5589416f1527',
      name: 'Аслан Коазаев',
      age: 26,
      gender: Gender.male,
      complaints: ['Боль в зубах'],
      diagnosis: 'Кариес',
      attendingDoctor: Employee(
        id: 'b96891b0-07ce-1cd8-a8a5-5589416f1527',
        name: 'Иван Иванов',
        age: 40,
        gender: Gender.male,
        specialization: 'Стоматолог',
        patients: [],
      ),
    ),
    Patient(
      id: 'b9d78020-07ce-1cd8-a8a5-5589416f1527',
      name: 'Давид Джелиев',
      age: 22,
      gender: Gender.male,
      complaints: ['Боль в зубах'],
      diagnosis: 'Кариес',
      attendingDoctor: Employee(
        id: 'b96891b0-07ce-1cd8-a8a5-5589416f1527',
        name: 'Иван Иванов',
        age: 40,
        gender: Gender.male,
        specialization: 'Стоматолог',
        patients: [],
      ),
    ),
  ];
}
