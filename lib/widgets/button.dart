import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        alignment: Alignment.center,
        child: widget.isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              )
            : Text(
                widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
      ),
    );
  }
}
