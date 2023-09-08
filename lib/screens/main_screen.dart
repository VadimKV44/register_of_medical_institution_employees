import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_of_medical_institution_employees/bloc/employee_cubit/employee_cubit.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';
import 'package:register_of_medical_institution_employees/consts/styles.dart';
import 'package:register_of_medical_institution_employees/local_storage/local_storage.dart';
import 'package:register_of_medical_institution_employees/models/employee_model.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      builder: (context, state) {
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
            child: getMainScreenWidget(state),
          ),
        );
      },
    );
  }

  Widget getMainScreenWidget(EmployeeState state) {
    Widget mainScreenWidget = const SizedBox();

    if (state is EmployeeLoading) {
      mainScreenWidget = const Center(
        child: CircularProgressIndicator(
          color: MainColors.kBlackColor,
          backgroundColor: Colors.transparent,
          strokeWidth: 4.0,
        ),
      );
    } else if (state is EmployeeError) {
      mainScreenWidget = Center(
        child: Text(
          'Error',
          style: MainStyles.kBlackColorW500(30.0),
        ),
      );
    } else if (state is EmployeeSuccess) {
      List<Employee> employees = BlocProvider.of<EmployeeCubit>(context).employees!;

      mainScreenWidget = SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10.0, bottom: 80.0, left: 20.0, right: 20.0),
        child: Column(
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: LocalStorage.patients.length,
              itemBuilder: (context, index) {
                return PatientItemWidget(
                  patient: LocalStorage.patients[index],
                );
              },
            ),
          ],
        ),
      );
    }

    return mainScreenWidget;
  }
}
