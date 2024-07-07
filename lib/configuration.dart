import 'package:flutter/material.dart';

const Color primaryColor = Color(0XFF656b9c);
const Color primaryContrastColor = Color(0XFFFFFFFF);

const Color secondaryColor = Color(0XFF646A9C);

const Color buttonColor = Color(0XFF656b9c);
const Color buttonTextColor = Color(0XFFffffff);
const Color backgroundColor = Color(0XFFF9F9F9);
const Color contrastBackgroundColor = Color(0XFF000101);
const Color errorColor = Color(0XFFDE3704);

const Color blackColor = Color(0XFF000000);
const Color whiteColor = Color(0XFFFFFFFF);

String currentModality = 'unilife';


String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field cannot be empty';
  } else if (value.length < 6) {
    return 'Very short password';
  } else {
    return null;
  }
}

InputDecoration textFormFieldUnderlineDecoration(
    IconData? icon,
    String hintText,
    String labelText,
    bool enabled,
    {Widget? suffixWidget,
      Widget? alternativeIcon
    }
    ) {
  return InputDecoration(
      enabled: enabled,
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2
        )
      ),
      focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: primaryColor,
            width: 2
          )
      ),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: primaryColor,
            width: 2
          )
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: primaryColor,
            width: 2
          )
      ),
      disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color:primaryColor,
            width: 2
          )
      ),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color:primaryColor,
            width: 2
          )
      ),
      hintText: hintText,
      hintStyle:  const TextStyle(
          color: contrastBackgroundColor,
          fontSize: 12
      ),
      labelText: labelText,
      errorStyle: const TextStyle(
          fontSize: 10,
          color: errorColor
      ),
      labelStyle:  const TextStyle(
          color: contrastBackgroundColor,
          fontSize: 18
      ),
      suffixIcon: suffixWidget,
      icon: alternativeIcon ?? (icon!=null?enabled
          ?Icon( icon,color: contrastBackgroundColor)
          :Icon(icon,color: Colors.grey,)
          :null)
  );
}