import 'package:flutter/material.dart';

class MyBrandTitleText extends StatelessWidget {
  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  //final TextSizes brandTextSize;

  const MyBrandTitleText(
      {super.key,
      this.color,
      required this.title,
      this.maxLines = 1,
      this.textAlign = TextAlign.center,
     // this.brandTextSize = TextSizes.small
       });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      //Check which brandSize is required and set that style
    );
  }
}
