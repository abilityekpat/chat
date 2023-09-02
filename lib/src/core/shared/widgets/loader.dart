import 'package:chat/src/core/shared/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(
      color: AppColors.primaryColor,
      size: 50.0,
    );
  }
}
