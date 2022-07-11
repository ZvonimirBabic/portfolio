import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioTextStyles {
  /// Desktop
  static final TextStyle title = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle subtitle = GoogleFonts.montserrat(
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle body = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyBold = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle small = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  /// Mobile
  static final TextStyle titleMobile = GoogleFonts.montserrat(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle subtitleMobile = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyMobile = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyBoldMobile = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle smallMobile = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
