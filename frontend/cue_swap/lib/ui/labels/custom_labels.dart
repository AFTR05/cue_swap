import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels{
  static TextStyle authTitle= GoogleFonts.juliusSansOne(
                fontSize: 100,
                color: const Color.fromRGBO(106, 133, 160, 1),
                fontWeight: FontWeight.normal
              );
  static TextStyle hintFormStyle= GoogleFonts.inter(
    color: Colors.black, 
    fontSize: 16,
    fontWeight: FontWeight.normal
  );
  static TextStyle labelFormStyle= GoogleFonts.inter(
        color:const Color.fromRGBO(106, 133, 160, 1),
        fontSize: 16,
        fontWeight: FontWeight.w400
  );

  static TextStyle formStyle= GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black
  );

  static TextStyle customOutlinedButton= GoogleFonts.inter(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w400
  );

  static TextStyle simpleTongleQuestion= GoogleFonts.inter(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w400
  );
  
  static TextStyle textSpanLink= GoogleFonts.inter(
    fontSize: 15,
    color: const Color.fromRGBO(24, 119, 242  , 1),
    fontWeight: FontWeight.w400
  );

  static TextStyle textSpanBasic= GoogleFonts.inter(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400
  );
}