import 'package:flutter/material.dart';

import 'package:salvest_app/utility/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    this.mainColor = AppColors.lightBlue,
    this.gradientColor = AppColors.background,
    this.fontSize = 18,
    this.title = '',
    this.onPressed,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  Function()? onPressed;
  String title;
  int fontSize;
  Color mainColor;
  Color gradientColor;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return Builder(builder: (context) {
      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Container(
        height: getHeight * 0.045,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.85, -0.53),
            end: const Alignment(-0.85, 0.53),
            colors: [gradientColor, mainColor],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color(0xff232323),
            elevation: 0,
            disabledBackgroundColor: AppColors.gray25,
            animationDuration: const Duration(milliseconds: 250),
            minimumSize: Size(double.infinity, getHeight * 0.045),
            maximumSize: Size(double.infinity, getHeight * 0.1),
            shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(8)), // <-- Radius
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style:  TextStyle(
              height: 1,
              color: AppColors.background,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      );
    });
  }
}
