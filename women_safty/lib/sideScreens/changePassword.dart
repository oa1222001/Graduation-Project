import 'package:flutter/material.dart';
import 'package:women_safty/component/components.dart';
import 'package:women_safty/screens/settings.dart';
class ChangePassword extends StatefulWidget {

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword = true;
  bool passwordCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 140, left: 10.0, right: 10.0),
        child: Form(
          key: formkey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                'Change Password',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              defaultFormField(
                controller: passwordController,
                label: 'Old password',
                type: TextInputType.text,
                colors: Colors.pink,
                prefix: Icons.lock,
                suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                isPassword: isPassword,
                suffixPressed: ()
                {
                  setState(()
                  {
                    isPassword = !isPassword;
                  });
                },
                validate: (String value)
                {
                  if (value.isEmpty || value.length < 7)
                  {
                    return'password must be non empty or less than 7 chars';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              defaultFormField(
                controller: newPasswordController,
                label: 'New password',
                type: TextInputType.text,
                colors: Colors.pink,
                prefix: Icons.lock,
                suffix: passwordCheck ? Icons.visibility : Icons.visibility_off,
                isPassword: passwordCheck,
                suffixPressed: ()
                {
                  setState(()
                  {
                    passwordCheck = !passwordCheck;
                  });
                },
                validate: (String value)
                {
                  if (value.isEmpty || value.length < 7)
                  {
                    return'password must be non empty or less than 7 chars';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: ElevatedButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.pink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if(formkey.currentState.validate())
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}