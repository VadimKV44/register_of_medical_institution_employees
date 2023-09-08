import 'package:register_of_medical_institution_employees/local_storage/local_storage.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';

class Repository {

  Future<List<Employee>> getEmployees() async {
    List<Employee>? result;
    await Future.delayed(const Duration(seconds: 2), () {
      result = LocalStorage.employees;
    });
    return result ?? [];
  }
}