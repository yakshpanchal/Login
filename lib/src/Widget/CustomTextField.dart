import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  // final IconData prefixIcon;
  final FormFieldValidator<String>? validator; // Validator function
  final bool enabled; // Added enabled parameter
  final TextInputType keyboardType; // Added keyboardType parameter
  final bool obscureText; // Added obscureText parameter
  final ValueChanged<String>? onChanged; // Added onChanged parameter
  final List<TextInputFormatter>? inputFormatters; // Added inputFormatters parameter

  const CustomTextFormFiled(
      {super.key,
        required this.controller,
        required this.labelText,
        // required this.prefixIcon,
        this.validator,
        required this.enabled,
        required this.keyboardType,
        required this.obscureText,
        this.onChanged, this.inputFormatters});

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      enabled: widget.enabled, // Set the enabled property
      keyboardType: widget.keyboardType, // Set keyboardType
      obscureText: widget.obscureText, // Set obscureText
      onChanged: widget.onChanged, // Set onChanged callback
      decoration: InputDecoration(
        // prefixIcon: Icon(widget.prefixIcon),
        // hintText: "Email Address",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        filled: true,
        fillColor: Colors.transparent,
        labelText: widget.labelText,

        // labelStyle: TextStyle(color: Colors.red),
      ),
      validator: widget.validator,
    );
  }
}