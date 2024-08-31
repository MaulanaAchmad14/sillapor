import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.controller, this.onChanged, this.validator});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 12, color: Color(0xffFD4F56)),
        fillColor: const Color(0xffF1F0F5),
        filled: true,
        prefix: const SizedBox(width: 10),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xff4141A4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xff4141A4)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xffFD4F56)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Color(0xffFD4F56)),
        ),
        hintText: '',
      ),
      style: const TextStyle(fontSize: 14, color: Colors.black),
    );
  }
}
