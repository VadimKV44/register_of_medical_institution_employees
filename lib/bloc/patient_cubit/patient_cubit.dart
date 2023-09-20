import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/models/person_factory.dart';
import 'package:register_of_medical_institution_employees/models/person_model.dart';
import 'package:register_of_medical_institution_employees/repository/repository.dart';
import 'package:uuid/uuid.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  var uuid = Uuid();

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

  bool searchComplaint(String complaint) {
    return complaints.contains(complaint);
  }

  bool addComplaint(String complaint) {
    bool showScaffoldMessage = false;
    if (complaint.isNotEmpty) {
      showScaffoldMessage = searchComplaint(complaint);
      if (!showScaffoldMessage) {
        complaints.add(complaint);
      }
      emit(PatientInitial());
    }
    return showScaffoldMessage;
  }

  void removeComplaint(String complaint) {
    complaints.removeWhere((element) => element == complaint);
    emit(PatientInitial());
  }

  bool checkInputFields(String name, String age, String diagnosis) {
    bool showScaffoldMessage = false;
    if (name.isNotEmpty && age.isNotEmpty && complaints.isNotEmpty && diagnosis.isNotEmpty && selectedEmployee != null) {
      _name = name;
      _age = age;
      _diagnosis = diagnosis;
      savePatient();
    } else {
      showScaffoldMessage = true;
    }
    return showScaffoldMessage;
  }

  void savePatient() {
    var person = PersonFactory(
      workersType: WorkersType.patient,
      id: uuid.v1(),
      name: _name!,
      age: int.parse(_age!),
      gender: gender ? Gender.male : Gender.female,
      complaints: complaints,
      diagnosis: _diagnosis,
      attendingDoctor: selectedEmployee,
    );
    patients?.insert(0, person as Patient);
    emit(PatientSuccess());
  }
}
