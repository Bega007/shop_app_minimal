import 'package:flutter/material.dart';

class MyProfileText extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  const MyProfileText({
    super.key,
    this.icon = Icons.arrow_right,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, overflow: TextOverflow.ellipsis),
                )),
            Expanded(
                flex: 3,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 18, overflow: TextOverflow.ellipsis),
                )),
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
