import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  const MyAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                ),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }
}
