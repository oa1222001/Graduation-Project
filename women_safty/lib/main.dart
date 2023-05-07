import 'package:flutter/material.dart';
import 'package:women_safty/screens/register.dart';
import 'package:women_safty/screens/login.dart';
import 'package:women_safty/screens/home.dart';
import 'package:women_safty/sideScreens/resetPassword.dart';
import 'package:women_safty/sideScreens/forgetPassword.dart';
import 'package:women_safty/screens/settings.dart';
import 'package:women_safty/screens/bottomNavBar.dart';
import 'package:women_safty/screens/Contacts.dart';
import 'package:women_safty/sideScreens/changeNumber.dart';
import 'package:women_safty/sideScreens/changePassword.dart';
import 'package:women_safty/sideScreens/addContact.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes:{
        'register' : (context) => Register(),
        'login' : (context) => Login(),
        'home' : (context) => Home(),
        'resetPassword' : (context) => ResetPassword(),
        'forgetPassword' : (context) => ForgetPassword(),
        'bottomNavBar' : (context) => BottomNavBar(),
        'Contacts' : (context) => TrustContacts(),
        'settings' : (context) => Settings(),
        'changeNumber' : (context) => ChangeNumber(),
        'changePassword' : (context) => ChangePassword(),
        'addContact' : (context) => AddContact(),

      },
    );
  }
}