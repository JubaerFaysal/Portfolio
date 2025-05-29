import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/templete/component/my_lists.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          // Section Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF64FFDA), Color(0xFF0AEFFF)],
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF64FFDA).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text("Projects & Works",
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 30),

          // Cards + Carousel Layout
          constraints.maxWidth >= 600
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Cards (Scroll horizontally)
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(projects.length, (i) {
                            return Container(
                              width: 260,
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A2E).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color(0xFF64FFDA), width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF64FFDA)
                                        .withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 6),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(projects[i]['image']!),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(projects[i]['title']!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  const SizedBox(height: 6),
                                  Text(projects[i]['description']!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[400]),
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 8),
                                  TextButton.icon(
                                    onPressed: () =>
                                        launchURL(projects[i]["Link"]!),
                                    icon: const Icon(Icons.link,
                                        color: Colors.red, size: 20),
                                    label: Text("Click to View",
                                        style: GoogleFonts.poppins(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    // Carousel
                    const SizedBox(width: 20),
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 340,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          viewportFraction: 0.85,
                        ),
                        items: imagePaths.map((path) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(path, fit: BoxFit.cover),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )

              // Mobile Layout
              : Column(
                  children: [
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: List.generate(projects.length, (i) {
                        return Container(
                          width: 280,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A2E).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: const Color(0xFF64FFDA), width: 1),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(projects[i]['image']!),
                              ),
                              const SizedBox(height: 10),
                              Text(projects[i]['title']!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const SizedBox(height: 6),
                              Text(projects[i]['description']!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.grey[400]),
                                  textAlign: TextAlign.center),
                              const SizedBox(height: 8),
                              TextButton.icon(
                                onPressed: () =>
                                    launchURL(projects[i]["Link"]!),
                                icon: const Icon(Icons.link,
                                    color: Colors.red, size: 20),
                                label: Text("Click to View",
                                    style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        viewportFraction: 0.9,
                      ),
                      items: imagePaths.map((path) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(path, fit: BoxFit.cover),
                        );
                      }).toList(),
                    ),
                  ],
                ),
        ],
      );
    });
  }
}
