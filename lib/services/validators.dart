class Validator {
  static String validateEmail(String value) {
    RegExp regex = new RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (value.isEmpty) {
      return 'Email is required';
    }
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return '';
  }

  static String validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!regex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter and one number';
    }
    return '';
  }

  // pin validator
  static String validatePin(String value) {
    RegExp regex = RegExp(r'^[0-9]{4}$');
    if (value.isEmpty) {
      return 'Pin is required';
    }
    if (!regex.hasMatch(value)) {
      return 'Pin must be 4 digits';
    }
    return '';
  }

  // phone validator
  static String validatePhone(String value) {
    RegExp regex = RegExp(r"^(?:[+]977)?[0-9]{10}$");
    if (value.isEmpty) {
      return 'Phone is required';
    }
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return '';
  }
}
