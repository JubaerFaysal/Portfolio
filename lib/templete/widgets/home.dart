import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        // height: constraints.maxHeight/1.2,
        constraints: const BoxConstraints(
          minHeight: 350.0,
        ),

        child: constraints.maxWidth >= 760
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, \nI'm Jubaer Ahmed\nFlutter Developer",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                height: 1.5)),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String url = "mailto:jubaerfaysal@gmail.com";

                            final Uri uri = Uri.parse(url);
                            if (!await launchUrl(uri,
                                mode: LaunchMode.externalApplication)) {
                              throw 'Could not launch $url';
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("Get in Touch",
                              style: GoogleFonts.poppins(color: Colors.white)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            "Software Engineer | Developer | 1.5+ Years Experience",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color:
                                    const Color.fromARGB(255, 215, 215, 215))),
                        const SizedBox(height: 10),
                        Text(
                          "Building ideas into reality, one line of code at a time. Problem-solver by passion.",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 188, 188, 188)),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CircleAvatar(
                    radius: 220,
                    backgroundImage: AssetImage("lib/images/IMG_5174 copy.png"),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 180,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        "lib/images/IMG_5174 copy.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Hi, \nI'm Jubaer Ahmed\nFlutter Developer",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Get in Touch",
                        style: GoogleFonts.poppins(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 10),
                  Text("Software Engineer | Developer | 1.5+ Years Experience",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 215, 215, 215))),
                  const SizedBox(height: 10),
                  Text(
                    "Building ideas into reality, one line of code at a time. Problem-solver by passion.",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 188, 188, 188)),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
      );
    });
  }
}
