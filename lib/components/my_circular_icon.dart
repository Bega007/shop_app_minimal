import 'package:flutter/material.dart';

class MyCircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const MyCircularIcon(
      {super.key,
      this.width,
      this.height,
      this.size,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
