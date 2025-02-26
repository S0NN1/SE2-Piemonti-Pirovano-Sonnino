import 'package:c_lup/utils/AuthService.dart';
import 'package:c_lup/widgets/CustomBox.dart';
import 'package:c_lup/widgets/EmailField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'PasswordLoginField.dart';

///Login card.
class LoginCard extends StatefulWidget {
  LoginCard({
    Key key,
  }) : super(key: key);

  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    TextEditingController controller2 = new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Card(
      elevation: 8.0,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  EmailField(controller: controller),
                  CustomBox(15, 15),
                  PasswordLoginField(
                    controller: controller2,
                  ),
                  CustomBox(1, 1),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgot");
                    },
                    child: Text(
                      'Forgot your password?',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        EasyLoading.show();
                        if (await AuthService.login(
                            email: controller.text,
                            password: controller2.text)) {
                          EasyLoading.showSuccess('Success');
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/home", (r) => false);
                        } else {
                          EasyLoading.showError('Invalid credentials');
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/login", (r) => false);
                        }
                        return Container();
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.button,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
