import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinoyrecipies/screens/category_screen.dart';

void main() {
  runApp(const PinoyRecipe());
}

class PinoyRecipe extends StatelessWidget {
  const PinoyRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CategoryScreen(),
      theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 18,
            ),
            caption: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          )),
    );
  }
}
