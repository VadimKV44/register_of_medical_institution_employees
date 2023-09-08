import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/repository/repository.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  Repository repository = Repository();

  List<Employee>? employees;

  void getEmployees() async {
    emit(EmployeeLoading());
    employees = await repository.getEmployees();
    if (employees == null) {
      emit(EmployeeError());
    } else {
      emit(EmployeeSuccess());
    }
  }

  String? _name;
  String? _age;
  bool gender = true; // gender true = male; gender false = female
  String? _specialization;
  List<String> patients = [];

  void addingToPatients(String complaint) {
    if (complaint.isNotEmpty) {
      patients.add(complaint);
      emit(EmployeeInitial());
    }
  }

  void removeInPatients(String complaint) {
    patients.removeWhere((element) => element == complaint);
    emit(EmployeeInitial());
  }

  bool checkingInputFields(String name, String age, String specialization) {
    bool showScaffoldMessage = false;
    if (name.isNotEmpty && age.isNotEmpty && specialization.isNotEmpty && patients.isNotEmpty) {
      _name = name;
      _age = age;
      _specialization = specialization;
      savingEmployee();
    } else {
      showScaffoldMessage = true;
    }
    return showScaffoldMessage;
  }

  void savingEmployee() {
    employees?.insert(
      0,
      Employee(
        name: _name!,
        age: int.parse(_age!),
        gender: gender ? Gender.male : Gender.female,
        specialization: _specialization,
        patients: patients,
      ),
    );
    emit(EmployeeSuccess());
  }
}
