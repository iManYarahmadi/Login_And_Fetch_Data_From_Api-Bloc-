import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final bool obscure;
  final FormFieldValidator<String> validator;
  

  const CustomTextFormField(
      {Key? key, this.textEditingController, required this.obscure, required this.validator})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

   

  late bool obsc = widget.obscure ?? false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.textEditingController,
          obscureText: obsc,
          validator: widget.validator,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.6)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.6)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.6)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: const BorderSide(color: Colors.red, width: 1.6)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.6))),
        ),
      ],
    );
  }
}

