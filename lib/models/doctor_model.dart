import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';

class Doctor {
  Doctor({
    required this.id,
    required this.name,
    required this.surname,
    required this.birthdate,
    required this.gender,
    required this.specialization,
    required this.patients,
});

  final String? id;
  final String? name;
  final String? surname;
  final DateTime? birthdate;
  final Gender gender;
  final String? specialization;
  final List<Patient>? patients;
}