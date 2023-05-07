import 'package:flutter/material.dart';
import 'package:women_safty/component/components.dart';
import 'package:women_safty/screens/login.dart';
class ResetPassword extends StatefulWidget {

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  var passwordController = TextEditingController();
  var numberController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword = true;

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
              const Text(
                'Reset Password',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              defaultFormField(
                controller: numberController,
                label: 'Verify',
                type: TextInputType.number,
                colors: Colors.pink,
                prefix: Icons.numbers,
                validate: (String value)
                {
                  if (value.isEmpty || value.length < 5)
                  {
                    return'Verification code must be non empty or != 5 numbers';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              defaultFormField(
                controller: passwordController,
                label: 'New password',
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
                        MaterialPageRoute(builder: (context) => Login()),
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