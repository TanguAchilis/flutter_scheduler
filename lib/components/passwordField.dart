import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({this.onChanged, this.labelText});
  final Function(String) onChanged;
  final String labelText;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: GestureDetector(
          onTap: () {
            showPassword = !showPassword;
            setState(() {});
          },
          child: showPassword
              ? Icon(Icons.visibility, color: Colors.blue)
              : Icon(Icons.visibility_off, color: Colors.blue),
        ),
      ),
    );
  }
}
