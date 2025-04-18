import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
 final bool isLoading;
  const CustomButton({super.key, required this.text, required this.onPressed, this.isLoading =false });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        );
      }
    );
  }
}
