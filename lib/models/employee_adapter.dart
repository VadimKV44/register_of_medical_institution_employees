import 'package:intl/intl.dart';
import 'package:register_of_medical_institution_employees/models/doctor_model.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';

class DoctorAdapter {
  Employee returnEmployee(Doctor doctor) {
    return Employee(
      id: doctor.id!,
      name: getFullName(doctor.name!, doctor.surname!),
      age: ageCalculation(doctor.birthdate!),
      gender: doctor.gender,
      specialization: doctor.specialization,
      patients: doctor.patients,
    );
  }

  int ageCalculation(DateTime birthdate) {
    int date = int.parse(DateFormat('yyyy').format(DateTime.now()));
    int formattedBirthDate = int.parse(DateFormat('yyyy').format(birthdate));
    return date - formattedBirthDate;
  }

  String getFullName(String name, String surname) {
    return '$name $surname';
  }
}
