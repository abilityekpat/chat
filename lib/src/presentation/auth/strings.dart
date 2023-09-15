const String addressNullError = "Please Enter your address";
const String emailCharacterError = 'Email should be at least 8 characters long';
const String emailNullError = "Please Enter your email";
const String incidentError = "Field is required";
const String invalidEmailError = "Please Enter Valid Email";
const String namelNullError = "Please Enter your full name";
const String noError = " ";
const String passNullError = "Please Enter your password";
const String phoneNumberNullError = "Please Enter a valid phone number";
const String shortPassError = "Password must be minimum of 8 character";
const String shortPhoneError = "Phone number must be 11 digit";
String? emailError;
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp phoneValidatorRegExp = RegExp(r'^[0][7-9][0-1]\d{8}$');
