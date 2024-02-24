class AppString {
  AppString._();

  static String proceed = "Proceed";
  static String enterNumber = "Enter Driver's Mobile Number";
  static String number = "Mobile Number";
  static String otp = "OTP";
  static String emailId = "Email Id";
  static String enterPass = "Enter password";
  static String signUp = "Sign Up";
  static String signUpC = "SING UP";
  static String login = "Login";
  static String forgotPass = "Forgot Password";
  static String donHave = "Don't Have an account?";
  static String donHave_1 = "  Sign up";
  static String singUpType = "Please select\nOne of the\nfollowing tab to\ncontinue";
  static String driverType = "Single Bus Driver";
  static String driverType_1 = "Drive Our Bus";
  static String driverType_2 = "Bus Operator";
  static String submit = "Submit";
  static String logged = "Keep me logged in";

  static String singUp = "Signup";
  static String drive = "For Drive With Yellow Bus";
  static String fleet = "For Fleet";
  static String lease = "For Lease";
  static String driverOurBus = "Driver’s and Attendant’s Info";
  static String bus = "Bus Info";
  static String fleetInfo = "Fleet Owner's Info";
  static String termAndCondition = "I accept the terms & conditions";
  static String next = "Next";

  /// drive with Yellow Bus
  static String driverEmail = "Driver's Email id";
  static String driverName = "Driver's Name";
  static String driverMobileNumber = "Driver's Mobile Number";
  static String residentialAddress = "Residential Address";
  static String driverAdharPhoto = "Driver's Aadhaar Card Photo";
  static String driverPhoto = "Driver's Photo";
  static String licenseNumber = "License Number";
  static String licensePhoto = "License Photo";
  static String attendantName = "Attendant's Name";
  static String attendantMobileNumber = "Attendant's Mobile Number";
  static String attendantAdharPhoto = "Attendant's Adhar Photo";
  static String attendantPhoto = "Attendant's Photo";
  static String setPassword = "Set Password";
  static String setCPassword = "Confirm Password";
  static String bankAccountD = "Bank Account Details";
  static String cancelledCheck = "Cancelled Cheque";

  /// --
  static String busNumber = "Bus Number";
  static String busPhoto = "Bus Photo";
  static String seatNumber = "Number Of Seat";
  static String busRcPhoto = "Bus Rc Photo";
  static String busPermit = "Bus Permit";
  static String busInsurance = "Bus Insurance";

  static const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String plzEnterEmail = 'Please enter email';
  static const String enterValidEmail = 'Please enter valid email';
  static const String address = r"^[A-Za-z-0-99999999]+";
  // static const String license = r"^[A-Z]{2}-[0-9]{14}$";
  static const String license = r"^([A-Z]{2})-(\d{2}|\d{3})[a-zA-Z]{0,1}(\d{4})(\d{7})$";
  static const String busNu = r"^[A-Z]{2}-[0-9]{2}-[A-Z]{2}-[0-9]{4}$";
  static const String busNuBH = r"^[0-9]{2}-BH-[0-9]{4}-[A-HJ-NP-Z]{1,2}$";
  static String oEWS =
      "(Our Executive will soon get in touch with you please refer the next to see the documents needed)";

  /// bus operator

  static const String oE = "Owner's Email Id";
  static const String oN = "Owner's Name";
  static const String oF = "Fleet Name";
  static const String oSP = "Set Password";
  static const String oCP = "Confirm Password";
  static const String oA = "Address 1";
  static const String oA_ = "Address 2";
  static const String oC = "City";
  static const String oP = "Pincode";
  static const String oS = "State";
  static const String oB = "Birth Date";
  static const String oM = "Mobile Number";
  static const String oBA = "Owner's Bank Account Details";
  static const String oCC = "Owner's Cancelled Cheque";
  static const String oACN = "Owner's Aadhaar Card Number";
  static const String oAC = "Owner's Aadhaar Card Photo";
  static const String oPH = "Owner's Photo";
  static const String oCHH = "Chassis Number";
}
