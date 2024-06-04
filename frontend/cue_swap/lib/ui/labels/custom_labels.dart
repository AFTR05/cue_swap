import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels{
  static TextStyle authTitle= GoogleFonts.juliusSansOne(
                fontSize: 100,
                color: const Color.fromRGBO(106, 133, 160, 1),
                fontWeight: FontWeight.normal
              );

  static TextStyle dashboardTitle= GoogleFonts.juliusSansOne(
                fontSize: 50,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold
              );

  static TextStyle menuItem=GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8)
                    );
  
  static TextStyle tableHeader=GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9)
                    );

  static TextStyle tableData= GoogleFonts.inter(
    color: Colors.black, 
    fontSize: 14,
    fontWeight: FontWeight.normal
  );

  static TextStyle priceText = GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              );

  static TextStyle h2 = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w400
  );
  
  static TextStyle navbarMessage=GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300
                      
                    );

  static TextStyle imageDisplayedTitle=GoogleFonts.inter(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                      
                    );

  static TextStyle imageDisplayedDescription=GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w300
                      
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

  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.w400
  );

  static TextStyle textSpanBasic= GoogleFonts.inter(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w400
  );

  static TextStyle noPageFound= GoogleFonts.montserratAlternates(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.bold
  ); 
}