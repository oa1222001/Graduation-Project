import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmite,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  @required dynamic colors,
  IconData suffix,
  Function suffixPressed,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmite,
  validator: validate,

  decoration: InputDecoration(
    labelText: label,
    labelStyle: TextStyle(
        color: colors,
        fontSize: 15.0,
        fontWeight: FontWeight.bold),
    prefixIcon: Icon (prefix, color: colors, size: 20.0),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
        icon : Icon(suffix), color: colors, iconSize: 20.0) : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:  BorderSide(color: colors, width: 0.6) ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:  BorderSide(color: colors, width: 0.6)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: colors, width: 0.6)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: colors, width: 0.6)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: colors, width: 0.6)),

  ),
  );