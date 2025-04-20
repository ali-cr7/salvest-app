import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFEAEBEA);
  static const Color background = Color(0xFFF5F5F5);
  static const Color black38 = Color(0x61000000); // 38% opacity
  static const Color darkGreen = Color(0xFF22842D);
  static const Color green15 = Color(0x26FFCC02);
  static const Color redColor = Color(0xFFD81721);
  static const Color lightBlue = Color(0x3F9A8AEC);
  static const Color black82 = Color(0xD1000000); // 82% opacity
  static const Color lightPurple = Color(0xFF9A8AEC);
  static const Color black88 = Color(0xE0000000); // 88% opacity
  static const Color gray = Color(0xFFD9D9D9);
  static const Color neonYellow = Color(0xFFE4FF1C);
  static const Color black46 = Color(0x75000000); // 46% opacity
  static const Color black25 = Color(0x40000000); // 25% opacity
  static const Color mediumGreen = Color(0xFF088711);
  static const Color brightGreen = Color(0xFF21D937);
  static const Color oliveGreen = Color(0xFF686F08);
  static const Color teal = Color(0xFF8CE996);
  static const Color mutedYellow = Color(0xFFD8EC43);
  static const Color gray25 = Color(0x40D9D9D9); // 25% opacity
  static const Color brightRed = Color(0xFFF1272B);
  static const Color green = Color(0xA5088711);
  static const purpleGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF9A8AEC), // 0%
      Color(0xFF796CB9), // 31%
      Color(0xFF685D9F), // 62%
      Color(0xFF574E86), // 100%
    ],
    stops: [0.0, 0.31, 0.62, 1.0],
  );

  static const blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0.0, 0.31, 0.62, 1.0], // Corresponding to 0%, 31%, 62%, 100%
    colors: const [
      Color(0xFF9A8AEC), // 0%
      Color(
        0xFF796CB9,
      ), 
      Color(0xFF685D9F), // 62%
      Color(0xFF574E86), // 100%
    ],
  );

  static const greenGradient = LinearGradient(
    begin: Alignment(-0.00, 1.00),
    end: Alignment(1.00, -0.00),
    stops: [0.0, 0.77, 0.98], // Corresponding to 0%, 77%, 98%
    colors: [
      const Color(0xFF088711),
      const Color(0xFF04540A),
      const Color(0xFF033A07),
    ],
  );

  static const yellowGradient = LinearGradient(
    begin: Alignment(-0.00, 1.00),
    end: Alignment(1.00, -0.00),
    colors: [
      const Color(0xFFD8EC43),
      const Color(0xFFA9B934),
      const Color(0xFF7A8626),
    ],
  );
  static const purple2Gradient = LinearGradient(
    begin: Alignment(0.00, 1.00),
    end: Alignment(1.00, 0.00),
    colors: [
      const Color(0xFF9A8AEC),
      const Color(0xFF786CB9),
      const Color(0xFF685D9F),
      const Color(0xFF574E86),
    ],
  );
}
