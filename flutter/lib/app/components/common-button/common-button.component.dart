import 'package:flutter/material.dart';
import 'package:starter_kit/config/config_screen.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final double? width;
  final double? height;

  const CommonButton({
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width ?? SizeConfig.safeBlockHorizontal * 80,
        height: height ?? 30,
        alignment: Alignment.center,
        child: child,
      ),
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
