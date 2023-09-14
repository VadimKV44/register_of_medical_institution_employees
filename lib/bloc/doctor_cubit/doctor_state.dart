part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorError extends DoctorState {}

class DoctorSuccess extends DoctorState {
  DoctorSuccess({required this.doctors});
  final List<Doctor>? doctors;
}
