import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isWide = constraints.maxWidth >= 760;
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(30),
        child: isWide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left side text
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, 👋",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color(0xFF64FFDA),
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(height: 5),
                        Text("I'm Jubaer Ahmed",
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            )),
                        Text("Flutter Developer",
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final Uri uri =
                                Uri.parse("mailto:jubaerfaysal@gmail.com");
                            if (!await launchUrl(uri,
                                mode: LaunchMode.externalApplication)) {
                              throw 'Could not launch $uri';
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF64FFDA),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 8,
                          ),
                          child: Text(
                            "Get in Touch",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                            "Software Engineer | Developer | 1.5+ Years Experience",
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.grey[300])),
                        const SizedBox(height: 10),
                        Text(
                          "Building ideas into reality, one line of code at a time.\nProblem-solver by passion.",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 30),

                  // Right side image
                  Expanded(
                    flex: 4,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF64FFDA), width: 3),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF64FFDA).withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        child: const ClipOval(
                          child: Image(
                            image: AssetImage(
                                "lib/templete/images/IMG_5174 copy.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF64FFDA), width: 3),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF64FFDA).withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: const ClipOval(
                        child: Image(
                          image: AssetImage(
                              "lib/templete/images/IMG_5174 copy.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Hi, I'm Jubaer Ahmed",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Flutter Developer",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      final Uri uri =
                          Uri.parse("mailto:jubaerfaysal@gmail.com");
                      if (!await launchUrl(uri,
                          mode: LaunchMode.externalApplication)) {
                        throw 'Could not launch $uri';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF64FFDA),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Get in Touch",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 20),
                  Text("Software Engineer | Developer | 1.5+ Years Experience",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey[300])),
                  const SizedBox(height: 10),
                  Text(
                    "Building ideas into reality, one line of code at a time.\nProblem-solver by passion.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 15, color: Colors.grey[400]),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
      );
    });
  }
}
