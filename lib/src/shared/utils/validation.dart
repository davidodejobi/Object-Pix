class Validation {
  static String? validateField(
    String label,
    dynamic value,
    String rules,
    String valueToCompare,
  ) {
    List<String> rulesArray = rules.split('||');

    if (rulesArray.contains('required')) {
      if (value.isEmpty) return '$label is required';
    }

    if (rulesArray.contains('url')) {
      String pattern =
          r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Please enter valid url';
      }
      return null;
    }

    if (rulesArray.contains('email')) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Please enter valid email';
      }
      return null;
    }

    if (rulesArray.contains('password')) {
      if (value.length < 4) {
        return 'Password must be at least 4 characters';
      } else if (value != valueToCompare && valueToCompare.isNotEmpty) {
        return 'Passwords do not match';
      }
      return null;
    }

    if (rulesArray.contains('pin')) {
      if (value.length != 4) {
        return 'Pin must be 4 digits';
      }
      return null;
    }

    if (rulesArray.contains('phone')) {
      if (value.length < 10) {
        return 'Phone number cannot be less than 10 digits';
      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
        return 'Please enter valid phone number';
      } else if (value.length > 11) {
        return 'Phone number must be 11 digits';
      }
      return null;
    }

    //firstName
    if (rulesArray.contains('firstName')) {
      if (value.length < 3) {
        return 'First name cannot be less than 3 characters';
      }
      return null;
    }

    //lastName
    if (rulesArray.contains('lastName')) {
      if (value.length < 3) {
        return 'Last name cannot be less than 3 characters';
      }
      return null;
    }

    //tag
    if (rulesArray.contains('tag')) {
      if (value.length < 1) {
        return 'Tag cannot be less than 3 characters';
      }
      return null;
    }

    //pin
    if (rulesArray.contains('pin')) {
      if (value.length != 4) {
        return 'Pin must be 4 digits';
      } else if (value != valueToCompare && valueToCompare.isNotEmpty) {
        return 'Passwords do not match';
      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
        return 'Please enter valid numeric pin';
      }
      return null;
    }

    if (rulesArray.contains('fullName')) {
      if (value.length < 3) {
        return 'Full name cannot be less than 3 characters';
      } else if (value.split(' ').length < 2) {
        return 'Last name required';
      }
      return null;
    }

    return null;
  }
}
