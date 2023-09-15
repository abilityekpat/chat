import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  String? Function(String?)? validator;
  String? Function(String?)? onChange;
  final String? errorText;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
    this.onChange,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}





// TextFormField(
//             controller: _emailController,
//             onChanged: (value) {
//               setState(() {
//                 if (value.length >= 8) {
//                   if (RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
//                     emailError = null;
//                   } else {
//                     emailError = 'Invalid email format';
//                   }
//                 } else {
//                   emailError = 'Email should be at least 8 characters long';
//                 }
//               });
//             },
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               labelText: 'Email',
//               errorText: emailError,
//             ),
//           ),