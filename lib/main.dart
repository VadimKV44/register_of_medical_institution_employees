import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_of_medical_institution_employees/bloc/doctor_cubit/doctor_cubit.dart';
import 'package:register_of_medical_institution_employees/bloc/employee_cubit/employee_cubit.dart';
import 'package:register_of_medical_institution_employees/bloc/patient_cubit/patient_cubit.dart';
import 'package:register_of_medical_institution_employees/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeCubit>(create: (BuildContext context) => EmployeeCubit()),
        BlocProvider<PatientCubit>(create: (BuildContext context) => PatientCubit()),
        BlocProvider<DoctorCubit>(create: (BuildContext context) => DoctorCubit()),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
