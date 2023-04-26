import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 50,
        child: MaterialButton(
            color: Colors.blue,
            shape: OutlineInputBorder(borderSide: BorderSide.none),
            onPressed: widget.onPressed,
            child: Text(widget.text)));
  }
}
