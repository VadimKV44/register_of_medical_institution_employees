import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/repository/repository.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  Repository repository = Repository();

  List<Patient>? patients;

  void getPatients() async {
    emit(PatientLoading());
    patients = await repository.getPatients();
    if (patients == null) {
      emit(PatientError());
    } else {
      emit(PatientSuccess());
    }
  }

  String? _name;
  String? _age;
  bool gender = true; // gender true = male; gender false = female
  List<String> complaints = [];
  String? _diagnosis;
  Employee? selectedEmployee;

  void addingToComplaints(String complaint) {
    if (complaint.isNotEmpty) {
      complaints.add(complaint);
      emit(PatientInitial());
    }
  }

  void removeInComplaints(String complaint) {
    complaints.removeWhere((element) => element == complaint);
    emit(PatientInitial());
  }

  bool checkingInputFields(String name, String age, String diagnosis) {
    bool showScaffoldMessage = false;
    if (name.isNotEmpty && age.isNotEmpty && complaints.isNotEmpty && diagnosis.isNotEmpty && selectedEmployee != null) {
      _name = name;
      _age = age;
      _diagnosis = diagnosis;
      savingPatient();
    } else {
      showScaffoldMessage = true;
    }
    return showScaffoldMessage;
  }

  void savingPatient() {
    patients?.insert(
      0,
      Patient(
        name: _name!,
        age: int.parse(_age!),
        gender: gender ? Gender.male : Gender.female,
        complaints: complaints,
        diagnosis: _diagnosis,
        attendingDoctor: selectedEmployee,
      ),
    );
    emit(PatientSuccess());
  }
}
