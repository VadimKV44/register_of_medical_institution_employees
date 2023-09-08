import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
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
}
