import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Password field.
class PasswordField extends StatefulWidget {
  PasswordField({this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
  final TextEditingController controller;
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;
  Icon _visibility = Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value.isEmpty) {
          return "Password field cannot be empty";
        } else if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          return "Password must be 8 characters long\n and contain at least:\n• one lower case;\n• one upper case;\n• one digit;\n• one special character (!@#\\\$&*~)."; // should contain at least one Special character";
        } else
          return null;
      },
      obscureText: _isHidden,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: "Password*",
        hintStyle: Theme.of(context).textTheme.bodyText1,
        suffix: InkWell(onTap: _togglePasswordView, child: _visibility),
      ),
    );
  }

  ///Show/hide password.
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
      if (_isHidden) {
        _visibility = Icon(Icons.visibility_off);
      } else
        _visibility = Icon(Icons.visibility);
    });
  }
}
