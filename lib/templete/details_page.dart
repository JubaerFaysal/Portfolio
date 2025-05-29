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
    final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Header
              SizedBox(key: navbarKeys.first),
              Header(onButtonPressed: scrollToSection),
              const SizedBox(height: 20),

              // Home
              Home(key: navbarKeys[1]),
              const SizedBox(height: 40),

              // Skills
              Skills(key: navbarKeys[2]),
              const SizedBox(height: 40),

              // Projects
              Projects(key: navbarKeys[3]),
              const SizedBox(height: 40),

              // Contact
              Contact(key: navbarKeys[4]),
              const SizedBox(height: 40),

              // Footer
              Center(
                child: Text(
                  "© 2025 IBNA JUBAER HOSSAIN - All rights reserved.",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
