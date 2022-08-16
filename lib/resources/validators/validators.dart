class Validators {
  String? validateEmail(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null) {
      _msg = "Enter your email";
    } else if (!regex.hasMatch(value)) {
      _msg = "Enter your email correctly";
    }
    return _msg;
  }

  String? validatePassword(String? value) {
    String? _msg;
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    if (value == null) {
      _msg = "Enter your password";
    } else if (!regex.hasMatch(value)) {
      _msg =
          "The password must contain Latin characters in both registers \n and at least 1 digit and a special character";
    }
    return _msg;
  }

  String? validateUsername(String? value) {
    String? _msg;
    if (value == null) {
      _msg = "Enter your username";
    }
    return _msg;
  }

  String? validateRequiredFields(String? value) {
    String? _msg;
    if (value == null) {
      _msg = 'This field is required!';
    }
    return _msg;
  }
    String? validateMoney(String? value) {
    String? _msg;
    RegExp _regExp = RegExp(r'^[0-9]+$');
    if (value == null) {
      _msg = 'This field is required!';
    } else if(!_regExp.hasMatch(value)){
      _msg = 'Only numbers!';
    }
    return _msg;
  }
}
