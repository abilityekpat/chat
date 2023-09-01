import 'dart:io';

import 'package:chat/src/core/shared/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function()? press;

  final String text;
  final Color colour;
  final Color txtcolour;
  final double textSize;
  final bool isLoading;
  final Widget? prefix;
  final Widget? suffix;
  final FontWeight? fontWeignt;
  const MainButton({
    super.key,
    required this.press,
    required this.text,
    required this.colour,
    required this.txtcolour,
    this.isLoading = false,
    this.textSize = 15,
    this.prefix,
    this.suffix,
    this.fontWeignt,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      minSize: 0,
      pressedOpacity: 0.7,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 45,
                  width: 45,
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: AppColors.white,
                        )
                      : Transform.scale(
                          scale: 0.7,
                          child: const CupertinoActivityIndicator(
                            color: AppColors.white,
                          ),
                        ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefix ?? const SizedBox.shrink(),
                    if (prefix != null) const SizedBox(width: 10),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: fontWeignt ?? FontWeight.w500,
                        color: txtcolour,
                      ),
                    ),
                    if (suffix != null) const SizedBox(width: 10),
                    suffix ?? const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}
