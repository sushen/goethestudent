import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Function onPressed;
  final String text;
  const CustomButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text.toString(),
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
