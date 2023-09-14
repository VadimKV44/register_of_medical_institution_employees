import 'package:register_of_medical_institution_employees/models/doctor_model.dart';
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

  static List<Doctor> doctors = [
    Doctor(
      id: '1682f120-adb0-1ce1-9880-7da865c5cd7d',
      name: 'John',
      surname: 'Smith',
      birthdate: DateTime(1903, 1, 4),
      gender: Gender.male,
      specialization: 'Доктор всех наук',
      patients: [],
    ),
    Doctor(
      id: '175ef940-adb0-1ce1-9880-7da865c5cd7d',
      name: 'Маргарита',
      surname: 'Петровна',
      birthdate: DateTime(1999, 2, 10),
      gender: Gender.female,
      specialization: 'Фармацевт',
      patients: patients,
    ),
    Doctor(
      id: '17addc90-adb0-1ce1-9880-7da865c5cd7d',
      name: 'Альфия',
      surname: 'Сидакова',
      birthdate: DateTime(1998, 3, 12),
      gender: Gender.female,
      specialization: 'Медсестра',
      patients: patients,
    ),
    Doctor(
      id: '17b83cd0-adb0-1ce1-9880-7da865c5cd7d',
      name: 'Елена',
      surname: 'Бестужева',
      birthdate: DateTime(1997, 4, 14),
      gender: Gender.female,
      specialization: 'Патологоанатом',
      patients: patients,
    ),
    Doctor(
      id: '17cb0180-adb0-1ce1-9880-7da865c5cd7d',
      name: 'Вадим',
      surname: 'Тавасиев',
      birthdate: DateTime(1996, 5, 18),
      gender: Gender.male,
      specialization: 'Проктолог',
      patients: patients,
    ),
  ];
}
