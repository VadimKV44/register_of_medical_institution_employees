import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/doctor_model.dart';
import 'package:register_of_medical_institution_employees/models/employee_adapter.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/repository/repository.dart';
import 'package:uuid/uuid.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  var uuid = Uuid();

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

  void doctorToEmployees(List<Doctor>? doctors) {
    if (doctors != null && doctors.isNotEmpty) {
      for (var item in doctors) {
        employees?.add(DoctorAdapter().returnEmployee(item));
      }
    }
    emit(EmployeeSuccess());
  }

  List<Patient>? _patients;

  void getPatients() async {
    _patients = await repository.getPatients();
  }

  Patient? searchPatient(String text) {
    Patient? result;
    if (_patients != null) {
      result = _patients!.firstWhereOrNull((element) => element.name == text);
    }
    return result;
  }

  String? _name;
  String? _age;
  bool gender = true; // gender true = male; gender false = female
  String? _specialization;
  List<Patient> patients = [];

  bool addPatient(String patientName) {
    Patient? result;
    if (patientName.isNotEmpty) {
      result = searchPatient(patientName);
      if (result != null) {
        patients.add(result);
        emit(EmployeeInitial());
      }
    }
    return result != null ? false : true;
  }

  void removePatient(String patientId) {
    patients.removeWhere((element) => element.id == patientId);
    emit(EmployeeInitial());
  }

  bool checkInputFields(String name, String age, String specialization) {
    bool showScaffoldMessage = false;
    if (name.isNotEmpty && age.isNotEmpty && specialization.isNotEmpty && patients.isNotEmpty) {
      _name = name;
      _age = age;
      _specialization = specialization;
      saveEmployee();
    } else {
      showScaffoldMessage = true;
    }
    return showScaffoldMessage;
  }

  void saveEmployee() {
    employees?.insert(
      0,
      Employee(
        id: uuid.v1(),
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
