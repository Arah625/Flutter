import 'package:flutter/material.dart';
import 'package:njord_bank_app/colors/app_colors.dart'; // Make sure this points to your actual color constants file

class ValidatedTextField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry padding;
  final String? Function(String?) validator;

  const ValidatedTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    required this.validator,
  });

  @override
  ValidatedTextFieldState createState() => ValidatedTextFieldState();
}

class ValidatedTextFieldState extends State<ValidatedTextField> {
  late FocusNode _focusNode;
  bool _hasTyped = false; // Indicates if the user has started typing.
  bool _forceValidation =
      false; // Flag to force validation display when the form is submitted.

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _hasTyped =
              true; // The user is considered to have interacted once the field loses focus.
        });
      }
    });
  }

  void triggerValidation() {
    setState(() {
      _forceValidation =
          true; // Forces the validation to show when the form is submitted.
      _hasTyped =
          true; // Ensures that typing is considered to have occurred for validation purposes.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine if an error message should be shown.
    bool showError = (_forceValidation || _hasTyped) &&
        widget.validator(widget.controller.text) != null;

    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: const TextStyle(
                  color: textFieldBackgroundHint, fontSize: 16)),
          const SizedBox(height: 6),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: showError ? validationError : textFieldBackgroundHint),
              fillColor: lightBlue.withOpacity(0.5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: goldGradient[0], width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: goldGradient[1], width: 2.0),
                  borderRadius: BorderRadius.circular(8.0)),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: validationError, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: validationError, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0)),
              errorStyle: const TextStyle(color: validationError),
              errorText:
                  showError ? widget.validator(widget.controller.text) : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            onChanged: (value) {
              setState(() {
                _hasTyped =
                    true; // Mark as typed to enable real-time validation feedback.
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
