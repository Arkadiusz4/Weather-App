import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.text,
    required this.subtext,
    required this.image,
  });

  final String text, subtext, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      height: 200,
      width: MediaQuery.of(context).size.width / 3 - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4), BlendMode.lighten),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
            child: Text(
              subtext,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
