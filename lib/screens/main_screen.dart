import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_of_medical_institution_employees/bloc/doctor_cubit/doctor_cubit.dart';
import 'package:register_of_medical_institution_employees/bloc/employee_cubit/employee_cubit.dart';
import 'package:register_of_medical_institution_employees/bloc/patient_cubit/patient_cubit.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/screens/choosing_to_create_screen.dart';
import 'package:register_of_medical_institution_employees/widgets/employees_items_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/patient_items_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    BlocProvider.of<DoctorCubit>(context).getDoctors();
    BlocProvider.of<EmployeeCubit>(context).getEmployees();
    BlocProvider.of<PatientCubit>(context).getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MainColors.kWhiteColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChoosingToCreateScreen()));
        },
        child: const Icon(Icons.add, color: MainColors.kBlackColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10.0, bottom: 80.0, left: 20.0, right: 20.0),
          child: BlocListener<DoctorCubit, DoctorState>(
            listener: (context, state) {
              if (state is DoctorSuccess) {
                BlocProvider.of<EmployeeCubit>(context).doctorToEmployees(state.doctors);
              }
            },
            child: Column(
              children: [
                BlocBuilder<EmployeeCubit, EmployeeState>(
                  builder: (context, state) {
                    Widget employeesItemsWidget = const SizedBox();

                    if (state is EmployeeLoading) {
                      employeesItemsWidget = const Center(
                        child: CircularProgressIndicator(
                          color: MainColors.kBlackColor,
                          backgroundColor: Colors.transparent,
                          strokeWidth: 4.0,
                        ),
                      );
                    } else if (state is EmployeeError) {
                      employeesItemsWidget = Center(
                        child: Text(
                          Strings.failedUploadEmployeeData,
                          style: MainStyles.kBlackColorW500(30.0),
                        ),
                      );
                    } else if (state is EmployeeSuccess) {
                      employeesItemsWidget = EmployeesItemsWidget(employees: BlocProvider.of<EmployeeCubit>(context).employees!);
                    }

                    return employeesItemsWidget;
                  },
                ),
                BlocBuilder<PatientCubit, PatientState>(
                  builder: (context, state) {
                    Widget patientItemsWidget = const SizedBox();
                    if (state is PatientError) {
                      patientItemsWidget = Center(
                        child: Text(
                          Strings.failedUploadPatientData,
                          style: MainStyles.kBlackColorW500(30.0),
                        ),
                      );
                    } else if (state is PatientSuccess) {
                      patientItemsWidget = PatientItemsWidget(patients: BlocProvider.of<PatientCubit>(context).patients!);
                    }

                    return patientItemsWidget;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
