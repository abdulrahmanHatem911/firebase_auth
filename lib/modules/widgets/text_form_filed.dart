import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTextFormFiled extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validate; //function onchange
  final Function(String)? onChanged;
  TextInputType? type;
  String? hintText;
  IconData? prefix;
  IconData? suffix;
  bool isPassword = false;
  int maxLength;
  DefaultTextFormFiled({
    super.key,
    required this.controller,
    required this.validate,
    this.type,
    this.hintText,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.maxLength = 20,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        validator: validate,
        cursorColor: Colors.black54,
        maxLength: maxLength,
        style: GoogleFonts.almarai(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black54),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14.0),
          hintText: hintText,
          filled: true,
          prefixIcon: prefix != null
              ? Icon(prefix, color: Colors.blue.withOpacity(0.8))
              : null,
          suffix: suffix != null
              ? Icon(
                  suffix,
                  color: Colors.yellow,
                )
              : null,
          fillColor: Colors.white.withOpacity(0.9),
          hintStyle: GoogleFonts.almarai(color: Colors.black12, fontSize: 15.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
