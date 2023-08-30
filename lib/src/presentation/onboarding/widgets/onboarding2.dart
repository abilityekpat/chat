import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Column(
            children: [
              Image.asset("assets/images/chat3.png"),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Text(
                      "Receive Free Messages",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          wordSpacing: 2,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      "In publishing and graphic design, Lorem is a placeholder text commonly",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          wordSpacing: 2,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
