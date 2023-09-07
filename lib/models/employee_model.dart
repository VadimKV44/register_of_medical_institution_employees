import 'package:register_of_medical_institution_employees/models/person_model.dart';

class Employee extends Person {
  Employee({
    required super.name,
    required super.age,
    required super.gender,
    this.specialization,
    this.patients,
  });

  final String? specialization;
  final List<String>? patients;
}
