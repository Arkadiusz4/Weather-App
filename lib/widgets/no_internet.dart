import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/images/no_internet.png'),
              SizedBox(
                height: 30,
              ),
              Text(
                'Oops',
                style: GoogleFonts.lato(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'No internet connection found. Check your connection again.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Text('Fuck this wind, it\'s the worst.'),
            ],
          ),
        ));
  }
}
