import 'package:flutter/material.dart';

class MyProductTitleText extends StatelessWidget {
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  const MyProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLines = 2,
      this.textAlign = TextAlign.left,});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? const TextStyle(fontSize: 22) : const TextStyle(fontSize: 8),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
