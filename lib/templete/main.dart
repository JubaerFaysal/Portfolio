import 'package:flutter/material.dart';
import 'package:flutter_web/templete/details_page.dart';
import 'package:flutter_web/templete/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IBNA JUBAER HOSSAIN",
      home: DetailsPage(),
    );
  }
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    void openCVInNewTab() {
      html.window.open('lib/templete/images/Jubaer Resume FINAL.pdf', '_blank');
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 900,
          height: 700,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                     onPressed: () async {
                      String url = "mailto:jubaerfaysal@gmail.com";
                      final Uri uri = Uri.parse(url);
                      if (!await launchUrl(uri,
                          mode: LaunchMode.externalApplication)) {
                        throw 'Could not launch $url';
                      }
                    },
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.cyan,
                      size: 14,
                    ),
                    label: Text(
                      "jubaerfaysal@gmail.com",
                      style: GoogleFonts.poppins(
                        color: Colors.cyan,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                     onPressed: () {
                       
                     },
                      icon: const Icon(
                        Icons.vertical_split,
                        color: Color.fromARGB(255, 1, 117, 133),
                      ))
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hi,\nI’m Jubaer",
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Android, iOS, Web App Developer and User Interface Designer",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Hire Me Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text("Hire Me",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                            ),
                            const SizedBox(height: 20),
                            // Download CV
                            TextButton(
                              onPressed: () {
                                openCVInNewTab();
                              },
                              child: Text(
                                "Download CV ↓",
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Right Content (Profile Image)
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child:
                                  Image.asset("lib/templete/images/IMG_5174 copy.png")),
                          const Positioned(
                            top: 20,
                            right: 20,
                            child: Icon(Icons.circle,
                                color: Colors.cyan, size: 15),
                          ),
                          const Positioned(
                            top: 40,
                            right: 60,
                            child: Icon(Icons.circle_outlined,
                                color: Colors.red, size: 25),
                          ),
                          const Positioned(
                            top: 80,
                            right: 30,
                            child: Icon(Icons.circle_outlined,
                                color: Colors.cyan, size: 40),
                          ),
                          // const Positioned(
                          //   top: 150,
                          //   right: 100,
                          //   child: Icon(Icons.comment_outlined,
                          //       color: Colors.cyan, size: 25),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Flutter developer and UI/ UX designer.",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: const Color.fromARGB(255, 42, 36, 36),
                          ),
                        ),
                        Text(
                          "Hey are looking for developer to build your brand and grow your business?",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "let's shake hands with me.",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 111, 109, 109),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.link,
                        color: Colors.red,
                      ),
                      label: Text(
                        "www.dribbbble.com/IBNA JUBAER HOSSAIN",
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
