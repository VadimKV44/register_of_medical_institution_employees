import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_of_medical_institution_employees/bloc/employee_cubit/employee_cubit.dart';
import 'package:register_of_medical_institution_employees/bloc/patient_cubit/patient_cubit.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/strings.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
import 'package:register_of_medical_institution_employees/models/patient_model.dart';
import 'package:register_of_medical_institution_employees/screens/choosing_to_create_screen.dart';
import 'package:register_of_medical_institution_employees/widgets/employees_item_widget.dart';
import 'package:register_of_medical_institution_employees/widgets/patient_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
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
                    List<Employee> employees = BlocProvider.of<EmployeeCubit>(context).employees!;

                    employeesItemsWidget = Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: employees.length,
                          itemBuilder: (context, index) {
                            return EmployeeItemWidget(
                              employee: employees[index],
                            );
                          },
                        ),
                      ],
                    );
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
                    List<Patient> patients = BlocProvider.of<PatientCubit>(context).patients!;
                    patientItemsWidget = ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        return PatientItemWidget(
                          patient: patients[index],
                        );
                      },
                    );
                  }

                  return patientItemsWidget;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
