import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';

class Patient extends Person {
  Patient({
    required super.name,
    required super.age,
    required super.gender,
    this.complaints,
    this.diagnosis,
    this.attendingDoctor,
  });

  final List<String>? complaints;
  final String? diagnosis;
  final Employee? attendingDoctor;
}
