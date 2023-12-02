import 'package:flutter/material.dart';

class MyProductPrice extends StatelessWidget {
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  const MyProductPrice(
      {super.key,
      this.currencySign = '\$',
      required this.price,
      this.maxLines = 1,
      this.isLarge = false,
      this.lineThrough = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
