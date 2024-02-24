// import 'package:yelowbus_attendantapp_flutter/helper/exception_handler.dart';
// import 'package:yelowbus_attendantapp_flutter/res/strings_utils.dart';
//
// class AppValidator {
//   static String? emailValidator(String? value) {
//     const Pattern pattern = AppString.emailRegExp;
//     final RegExp regex = RegExp(pattern.toString());
//     if (value!.isEmpty) {
//       return AppString.plzEnterEmail;
//     } else if (!regex.hasMatch(value)) {
//       return AppString.enterValidEmail;
//     } else {
//       "";
//     }
//     return null;
//   }
//
//   String? confirmPasswordValidator(String? value, {required String password}) {
//     if (value!.isEmpty) {
//       return 'Please Re-Enter your Password';
//     } else if (value != password) {
//       return "Password don't match";
//     } else {
//       return null;
//     }
//   }
//
//   static String? otpValidation(String? value) {
//     if (value!.isEmpty) {
//       return "Please fill 6 digit code";
//     } else if (value.length != 6) {
//       return "Please fill 6 digit code";
//     } else {
//       return null;
//     }
//   }
//
//   static String? isAccount(String? value) {
//     if (value!.isEmpty) {
//       return "Please Enter Bank Account Details";
//     } else if (value.length < 7) {
//       return "Please Enter valid Bank Account Details";
//     } else {
//       return null;
//     }
//   }
//
//   static String? isAdhara(String? value) {
//     if (value!.isEmpty) {
//       return "Enter your adhar number";
//     } else if (value.length < 12) {
//       return "Enter valid adhar number";
//     } else {
//       return null;
//     }
//   }
//
//   static String? isValidMobile(String? value) {
//     if (value!.isEmpty) {
//       return "Please Enter your mobile number";
//     } else if ((value.length != 10 /*> 7 && value.length < 11*/)) {
//       return "Invalid mobile number";
//     }
//     return null;
//   }
//
//   static String? isName(String? value) {
//     if (value!.isEmpty) {
//       return "Please Enter your Name";
//     }
//     return null;
//   }
//
//   static String? isAddress(String? value) {
//     const Pattern pattern = AppString.address;
//     final RegExp regex = RegExp(pattern.toString());
//     if (value!.isEmpty) {
//       return "Please Enter your Address";
//     } else if (!regex.hasMatch(value)) {
//       return "Please Enter your Valid Address";
//     }
//     return null;
//   }
//
//   static String? isLicense(String? value) {
//     const Pattern pattern = AppString.license;
//     final RegExp regex = RegExp(pattern.toString());
//     if (value!.isEmpty) {
//       return "Please Enter your License Number";
//     } else if (!regex.hasMatch(value)) {
//       return "Enter valid License Number";
//     }
//     return null;
//   }
//
//   static String? isPassword(String? value) {
//     if (value!.isEmpty) {
//       return "Enter your Password";
//     } else if ((value.length < 8)) {
//       return "password should be at least 8 characters";
//     } else if (!value.contains(RegExp(r'[!@#%&,":<>{}()`~$+-._|/;*?^=•©®°¶€£₹¥]'))) {
//       return "Password missing symbolic character";
//     } else if (!value.contains(RegExp(r'[0-9]'))) {
//       return "Password missing numeric character";
//     } else if (!value.contains(RegExp(r'[A-Z]'))) {
//       return "Password missing upper case character";
//     }
//     return null;
//   }
//
//   static String? isBusNumber(String? value) {
//     const Pattern pattern = AppString.busNu;
//     const Pattern patternBH = AppString.busNuBH;
//     final RegExp regex = RegExp(pattern.toString());
//     final RegExp regexBH = RegExp(patternBH.toString());
//     if (value!.isEmpty) {
//       return "Enter bus number";
//     } else if (!regex.hasMatch(value) && !regexBH.hasMatch(value)) {
//       return "Invalid bus number";
//     }
//     return null;
//   }
//
//   static String? isSeat(String? value) {
//     // const Pattern pattern = AppString.address;
//     // final RegExp regex = RegExp(pattern.toString());
//     if (value!.isEmpty) {
//       return "Total seat in Your Bus";
//     }
//     return null;
//   }
// /*  static String? emailValidator(String? value) {
//     const Pattern pattern = StringsUtils.emailRegExp;
//     final RegExp regex = RegExp(pattern.toString());
//     if (value!.isEmpty) {
//       return StringsUtils.plzEnterEmail;
//     } else if (!regex.hasMatch(value)) {
//       return StringsUtils.enterValidEmail;
//     } else {
//       StringsUtils.emptyQuote;
//     }
//     return null;
//   }*/
//
// /*  static String? passwordValidator(String? value) {
//     if (value!.isEmpty) {
//       return StringsUtils.plzEnterPWD;
//     } else if (!(RegExp(StringsUtils.pWDRegExp).hasMatch(value.trim()))) {
//       return StringsUtils.pWDMustBeUpperLower;
//     } else {
//       return null;
//     }
//   }*/
//
// }
//
// void showError(String message) {
//   AppException(errorCode: 0, message: message).show();
// }
