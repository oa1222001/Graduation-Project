import 'package:flutter/material.dart';
import 'package:women_safty/component/components.dart';
import 'package:women_safty/screens/register.dart';
import 'package:women_safty/screens/bottomNavBar.dart';
import 'package:women_safty/sideScreens/forgetPassword.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        margin: const EdgeInsets.only(top: 140, left: 10.0, right: 10.0),

        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const Text(
                'Log in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              defaultFormField(
                controller: emailController,
                label: 'Email',
                type: TextInputType.emailAddress,
                colors: Colors.white,
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
              const SizedBox(height: 20.0),
              defaultFormField(
                controller: passwordController,
                label: 'password',
                type: TextInputType.text,
                colors: Colors.white,
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
                    return'password must be non empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: ElevatedButton(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if(formkey.currentState.validate())
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavBar()),
                        );
                      }
                    }
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      'Forget Password?!',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 140.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      'Register?!',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}