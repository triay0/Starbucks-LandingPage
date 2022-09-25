import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/icon.png', height: 100.0),
        const SizedBox(width: 10.0),
        Text("TweetGen",
            style: GoogleFonts.robotoSlab(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ))
      ],
    );
  }
}
