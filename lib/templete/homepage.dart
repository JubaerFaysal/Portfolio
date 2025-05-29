// Updated Flutter portfolio with professional design and enhanced UI
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:html' as html;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 208, 228),
      body: Stack(
        children: [
          // Background animated icons
          const BackgroundAnimations(),

          // Main Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const IntroSection(),
                  const SizedBox(height: 40),
                  const Skill(),
                  const SizedBox(height: 40),
                  ServicesSection(),
                  const SizedBox(height: 40),
                  Project(),
                  const SizedBox(height: 40),
                  MyWork(),
                  const SizedBox(height: 40),
                  SocialLinksSection(),
                  const SizedBox(height: 60),
                  Text(
                    "© 2025 IBNA JUBAER HOSSAIN - All rights reserved.",
                    style: GoogleFonts.poppins(color: Colors.grey[600]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  void openCVInNewTab() {
    html.window.open('lib/templete/images/Jubaer Resume FINAL.pdf', '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: 900,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 5,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: constraints.maxWidth > 600
            ? Row(
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("lib/templete/images/IMG_5174 copy.png"),
                  ),
                  const SizedBox(width: 30),
                  Expanded(child: introTextContent()),
                ],
              )
            : Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("lib/templete/images/IMG_5174 copy.png"),
                  ),
                  const SizedBox(height: 20),
                  introTextContent(),
                ],
              ),
      );
    });
  }

  Widget introTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ibna Jubaer Hossain",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            )),
        const SizedBox(height: 10),
        Text("Software Engineer | Developer | 1.5+ Years Experience",
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[700])),
        const SizedBox(height: 10),
        Text(
          "Building ideas into reality, one line of code at a time. Problem-solver by passion.",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                String url =
                    "https://wa.me/8801641420456?text= Hi Sir,I found your portfolio and wanted to work with you.";
                final Uri uri = Uri.parse(url);
                if (!await launchUrl(uri,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $url';
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text("Contact Me"),
            ),
            const SizedBox(width: 15),
            OutlinedButton(
              onPressed: () => openCVInNewTab(),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.indigo),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text("Download CV"),
            )
          ],
        )
      ],
    );
  }
}

class ServicesSection extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      "title": "iOS Development",
      "desc": "Crafting seamless experiences for Apple users."
    },
    {
      "title": "Android Development",
      "desc": "Powering billions with flexible, scalable apps."
    },
    {
      "title": "Web Application",
      "desc": "Bringing ideas to life across browsers."
    },
  ];

  ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 107, 129, 255),
            borderRadius: BorderRadius.circular(12),
             boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          
          child: Text("My Services:",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: services
              .map((service) => Container(
                    width: 260,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service["title"]!,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(service["desc"]!,
                            style: GoogleFonts.poppins(fontSize: 14)),
                      ],
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}

class Skill extends StatelessWidget {
  const Skill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580,
          alignment: Alignment.center,
           padding: const EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 107, 129, 255),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Text(
            "Skills:",
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: ["Flutter", "C++", "Java", "Dart", "SQL", "Firebase", "Git"]
              .map((skill) => Chip(label: Text(skill)))
              .toList(),
        ),
      ],
    );
  }
}

class Project extends StatelessWidget {
  Project({super.key});

  final List<Map<String, String>> projects = [
    {
      'title': 'Tailor Shop',
      'description': 'Built an iOS app for Clothing Store management.',
      'image': 'lib/templete/images/tailor.png',
      'Link': 'https://github.com/JubaerFaysal/Clothing-Store'
    },
    {
      'title': 'Personal Portfolio',
      'description': 'Developed a web application using Flutter and Firebase',
      'image': 'lib/templete/images/1.png',
    },
    {
      'title': 'Mudi-Bajar',
      'description': 'Created an e-commerce mobile app using Flutter.',
      'image': 'lib/templete/images/basket.png',
      'Link': 'https://github.com/JubaerFaysal/Mudi-Bajar'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580,
          alignment: Alignment.center,
           padding: const EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 107, 129, 255),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Text(
            "Projects:",
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: projects
              .map((project) => Container(
                    width: 280,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(project['image']!),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          project['title']!,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          project['description']!,
                          style: GoogleFonts.poppins(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () => _launchURL(project["Link"]!),
                          label: Text(
                            "Click to View",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 130, 1, 1)),
                          ),
                          icon: const Icon(
                            Icons.link,
                            color: Color.fromARGB(255, 130, 1, 1),
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

class MyWork extends StatelessWidget {
  MyWork({super.key});

  final List<String> imagePaths = [
    'lib/templete/images/1.png',
    'lib/templete/images/3.png',
    'lib/templete/images/4.png',
    'lib/templete/images/5.png',
    'lib/templete/images/6.png',
    'lib/templete/images/7.png',
    'lib/templete/images/8.png',
    'lib/templete/images/9.png',
    'lib/templete/images/10.png',
    'lib/templete/images/11.png',
    'lib/templete/images/2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580,
          alignment: Alignment.center,
           padding: const EdgeInsets.symmetric(horizontal: 15,),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 107, 129, 255),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Text(
            "Some of my Work:",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
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
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 340,
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
                    fit: BoxFit.fitHeight,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
class SocialLinksSection extends StatelessWidget {
  SocialLinksSection({super.key});
  final List<Map<String, dynamic>> socialLinks = [
    {
      "icon": Icons.facebook,
      "url": "https://web.facebook.com/jubaerahmedfaysal/",
      "label": "Facebook",
      "color": Colors.blue,
    },
    {
      "icon": Icons.lan,
      "url": "https://www.linkedin.com/in/jubaer-ahmed-faysal/",
      "label": "LinkedIn",
      "color": Colors.indigo,
    },
    {
      "icon": Icons.earbuds,
      "url": "https://github.com/JubaerFaysal",
      "label": "GitHub",
      "color": Colors.black,
    },
    {
      "icon": Icons.email_outlined,
      "url": "mailto:jubaerfaysal@gmail.com",
      "label": "Email",
      "color": Colors.teal,
    },
    {
      "icon": Icons.wechat,
      "url":
          "https://wa.me/8801641420456?text=Hi Sir, I found your portfolio and wanted to work with you.",
      "label": "WhatsApp",
      "color": Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 580,
          alignment: Alignment.center,
           padding: const EdgeInsets.symmetric(horizontal: 15, ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 107, 129, 255),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Text(
            "Find me on:",
            style: GoogleFonts.poppins(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 30,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: socialLinks
              .map((link) => InkWell(
                    onTap: () => _launchURL(link["url"]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: link["color"],
                          child: Icon(link["icon"], color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(link["label"],
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
class BackgroundAnimations extends StatefulWidget {
  const BackgroundAnimations({super.key});

  @override
  State<BackgroundAnimations> createState() => _BackgroundAnimationsState();
}

class _BackgroundAnimationsState extends State<BackgroundAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat(reverse: true);

    _animation1 = Tween<double>(begin: -25, end: 25)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _animation2 = Tween<double>(begin: 10, end: -10)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Stack(
          children: [
             const Positioned(
              top: 50,
              right: 50,
              child: Icon(Icons.circle, color: Colors.cyan, size: 15),
            ),
            const Positioned(
              top: 70,
              right: 90,
              child: Icon(Icons.circle_outlined, color: Colors.red, size: 25),
            ),
            const Positioned(
              top: 110,
              right: 60,
              child: Icon(Icons.circle_outlined, color: Colors.cyan, size: 40),
            ),
            Positioned(
              top: 100 + _animation1.value,
              left: 40,
              child: const Opacity(
                opacity: 0.3,
                child: Icon(Icons.code, size: 20, color: Color.fromARGB(255, 255, 2, 2)),
              ),
            ),
             const Positioned(
              top: 80,
              left: 230,
              child: Opacity(
                opacity: 0.3,
                child: Icon(Icons.call,
                    size: 60, color: Color.fromARGB(255, 2, 137, 255)),
              ),
            ),
                        Positioned(
              top: 350 + _animation1.value,
              right: 200,
              child: const Opacity(
                opacity: 0.3,
                child: Icon(Icons.qr_code_outlined,
                    size: 40, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
             Positioned(
              top: 380 + _animation1.value,
              left: 180,
              child: const Opacity(
                opacity: 0.4,
                child: Icon(Icons.laptop_mac_outlined,
                    size: 70, color: Color.fromARGB(255, 0, 69, 206)),
              ),
            ),
           
            const Positioned(
              bottom: 120,
              left: 80,
              child: Opacity(
                opacity: 0.5,
                child: Icon(Icons.flutter_dash, size: 60, color: Color.fromARGB(255, 79, 4, 239)),
              ),
            ),
            Positioned(
              bottom: 50 + _animation2.value,
              right: 100,
              child: const Opacity(
                opacity: 0.2,
                child: Icon(Icons.smartphone, size: 40, color: Color.fromARGB(255, 0, 190, 248)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

