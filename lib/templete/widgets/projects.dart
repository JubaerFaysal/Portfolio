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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
             padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 65, 65, 252),
                  Color.fromARGB(255, 0, 195, 255)
                ]),
                borderRadius: BorderRadius.circular(20)),
            child: Text("Projects & Works-",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 15,
          ),
          constraints.maxWidth >= 600
              ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < projects.length; i++)
                        Container(
                          width: 250,
                          height: 360,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(projects[i]['image']!),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                projects[i]['title']!,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                projects[i]['description']!,
                                style: GoogleFonts.poppins(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              TextButton.icon(
                                onPressed: () =>
                                    launchURL(projects[i]["Link"]!),
                                label: Text(
                                  "Click to View",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 500,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 340,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            viewportFraction: 0.8,
                            aspectRatio: 16 / 9,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: imagePaths.map((path) {
                            return Container(
                              height: 340,
                              //width: 340,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Image.asset(
                                path,
                                fit: BoxFit.cover,
                                //width: double.infinity,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
              )
              : Column(
                  children: [
                    Wrap(spacing: 20, runSpacing: 20, children: [
                      for (int i = 0; i < projects.length; i++)
                        Container(
                          width: 250,
                          height: 360,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(projects[i]['image']!),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                projects[i]['title']!,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                projects[i]['description']!,
                                style: GoogleFonts.poppins(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              TextButton.icon(
                                onPressed: () =>
                                    launchURL(projects[i]["Link"]!),
                                label: Text(
                                  "Click to View",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        )
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 340,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 0.8,
                        aspectRatio: 16 / 9,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imagePaths.map((path) {
                        return Container(
                          height: 340,
                          //width: 340,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: Image.asset(
                            path,
                            fit: BoxFit.cover,
                            //width: double.infinity,
                          ),
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
