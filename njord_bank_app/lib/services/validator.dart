import 'package:njord_bank_app/services/validation_message.dart';
import 'package:njord_bank_app/services/validation_regex.dart';

class Validators {
  static String? Function(String?) composeValidators(
      List<String? Function(String?)> validators) {
    return (String? value) {
      for (var validator in validators) {
        final result = validator(value);
        if (result != null) {
          // Return the first error message encountered
          return result;
        }
      }
      // If no errors, validation passed for all validators
      return null;
    };
  }

  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessage.requiredField;
    }
    return null; // Return null if the data is valid
  }

  static String? validateEmail(String? value) {
    return requiredField(value) ??
        (ValidationRegex.emailAddress.hasMatch(value!)
            ? null
            : 'Enter a valid email address.');
  }

  // static String? validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email is required.';
  //   }
  //   if (!ValidationRegex.emailAddress.hasMatch(value)) {
  //     return 'Enter a valid email address.';
  //   }
  //   return null;
  // }

  static String? validatePhoneNumber(String? value) {
    return requiredField(value) ??
        (ValidationRegex.mobilePhone.hasMatch(value!)
            ? null
            : 'Enter a valid phone number.');
  }
  // static String? validatePhoneNumber(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Phone number is required.';
  //   }
  //   String pattern = r'(^[0-9]{9}$)'; // Adjust pattern to match your criteria
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Enter a valid phone number.';
  //   }
  //   return null;
  // }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    if (value.length < 2) {
      return ValidationMessage.nameLength;
    }
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid name.';
    }
    return null;
  }

  static String? validateSecondName(String? value, {bool isRequired = false}) {
    // Directly return null if the field is optional and not filled. This makes it valid.
    if (!isRequired && (value == null || value.isEmpty)) {
      return null;
    }

    // Proceed with other validations if the field is not empty or if it is a required field.
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters long.';
    }

    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid name.';
    }

    // If none of the above conditions are met, the name is considered valid.
    return null;
  }

  static String? validatePesel(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    if (value.length < 2) {
      return ValidationMessage.peselLength;
    }
    String pattern = r"^\d{11}$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid PESEL number.';
    }
    return null;
  }

  static String? validateOptionalName(String? value) {
    // Optional field, validate only if not empty
    if (value != null && value.isNotEmpty) {
      return validateName(value); // Reuse validateName for validation rules
    }
    return null; // No validation needed if the field is left empty
  }

  // Add more validators as needed
}
