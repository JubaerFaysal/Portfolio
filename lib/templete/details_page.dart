import 'package:flutter/material.dart';
import 'package:flutter_web/templete/widgets/contact.dart';
import 'package:flutter_web/templete/widgets/header.dart';
import 'package:flutter_web/templete/widgets/home.dart';
import 'package:flutter_web/templete/widgets/projects.dart';
import 'package:flutter_web/templete/widgets/skills.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey ());
     void scrollToSection(int index) {
      final keyContext = navbarKeys[index].currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 65, 252),
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //header
            SizedBox(key: navbarKeys.first),
             Header(onButtonPressed: scrollToSection),
            const SizedBox(
              height: 20,
            ),
            //home
             Home(key: navbarKeys [1]),
            const SizedBox(
              height: 40,
            ),
            //skills
             Skills(key: navbarKeys[2]),
            const SizedBox(
              height: 40,
            ),
            //projects
             Projects(key: navbarKeys[3]),
            const SizedBox(
              height: 40,
            ),
            //contact
             Contact(key: navbarKeys[4]),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "© 2025 IBNA JUBAER HOSSAIN - All rights reserved.",
                style: GoogleFonts.poppins(color: Colors.grey[600]),
              ),
            ),
             const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
