import 'package:flutter/material.dart';
import 'package:register_of_medical_institution_employees/consts/colors.dart';

abstract class MainStyles {
  static TextStyle kBlackColorW500(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: MainColors.kBlackColor,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle kBlackColorW300(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      color: MainColors.kBlackColor,
      fontWeight: FontWeight.w300,
    );
  }
}