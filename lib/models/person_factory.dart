import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';

enum WorkersType { employee, patient }

abstract class PersonFactory {
  factory PersonFactory({
    required WorkersType workersType,
    required String id,
    required String name,
    required int age,
    required Gender gender,
    String? specialization,
    List<Patient>? patients,
    List<String>? complaints,
    String? diagnosis,
    Employee? attendingDoctor,
  }) {
    switch (workersType) {
      case WorkersType.employee:
        return Employee(
          id: id,
          name: name,
          age: age,
          gender: gender,
          specialization: specialization,
          patients: patients,
        );
      case WorkersType.patient:
        return Patient(
          id: id,
          name: name,
          age: age,
          gender: gender,
          complaints: complaints,
          diagnosis: diagnosis,
          attendingDoctor: attendingDoctor,
        );
    }
  }
}
