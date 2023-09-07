import 'package:flutter/material.dart';

// Widget 을  return 하는 method
// Widget 으로 바꾼 이유 : 함수분리에 용이하기위해서
Widget inputFormField({
  required FocusNode focusNode,
  required Function(String) setValue,
  required Function(String?) validator,
  String? hintText,
  String? helpText,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      focusNode: focusNode,
      validator: (value) => validator(value),
      onChanged: (value) => setValue(value),
      decoration: InputDecoration(
        hintText: hintText,
        helperText: helpText,
        helperStyle: const TextStyle(color: Colors.blue),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  );
}
