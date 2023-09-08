import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
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
}
