import 'package:flutter/material.dart';

class MyCircularImage extends StatelessWidget {

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  const MyCircularImage({
    super.key,
     this.fit = BoxFit.cover,
     required this.image, 
     this.isNetworkImage = false, 
     this.overlayColor, 
     this.backgroundColor, 
     this.width = 56, 
     this.height = 56,
     this.padding = 8, 
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(100), 
      ),
      child: Center(
        child: Image(image:AssetImage(image),color: overlayColor,
        ),
      ),

    );
  }
}