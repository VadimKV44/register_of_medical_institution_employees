import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/doctor_model.dart';
import 'package:register_of_medical_institution_employees/repository/repository.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  Repository repository = Repository();

  List<Doctor>? doctors;

  void getDoctors() async {
    emit(DoctorLoading());
    doctors = await repository.getDoctors();
    if (doctors == null) {
      emit(DoctorError());
    } else {
      emit(DoctorSuccess(doctors: doctors));
    }
  }
}
