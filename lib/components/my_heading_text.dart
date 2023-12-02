import 'package:flutter/material.dart';

class MyHeading extends StatelessWidget {
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  const MyHeading(
      {super.key,
      this.textColor,
      this.showActionButton = true,
      required this.title,
      this.buttonTitle = 'View all',
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
