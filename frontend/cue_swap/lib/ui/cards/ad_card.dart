import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AdCard extends StatelessWidget {

  final String? title;
  final Widget child;
  final double? width;

  const AdCard({super.key, this.title, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width!=null) ? width : null,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
          ...[
            FittedBox(
            fit: BoxFit.contain,
            child: Text(
              title!,
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
            const Divider()
          ],
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: const Color.fromRGBO(106, 133, 160, 1),
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );
}