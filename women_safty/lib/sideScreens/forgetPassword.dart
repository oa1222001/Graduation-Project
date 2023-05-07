import 'package:flutter/material.dart';
import 'package:women_safty/component/components.dart';
import 'package:women_safty/sideScreens/resetPassword.dart';
class ForgetPassword extends StatefulWidget {

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();
  var formkey = GlobalKey<FormState>();

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
                'Forgot Password',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              defaultFormField(
                controller: emailController,
                label: 'Email',
                type: TextInputType.emailAddress,
                colors: Colors.pink,
                prefix: Icons.email,
                validate: (String value)
                {
                  if (value.isEmpty)
                  {
                    return'email must be non empty';
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
                    'Send',
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
                          MaterialPageRoute(builder: (context) => ResetPassword()),
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