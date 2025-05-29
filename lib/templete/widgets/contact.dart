import 'package:flutter/material.dart';
import 'package:flutter_web/templete/component/my_lists.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Section Heading
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
          child: Text("Find Me On",
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        const SizedBox(height: 30),

        // Social Links
        Wrap(
          spacing: 30,
          runSpacing: 25,
          alignment: WrapAlignment.center,
          children: List.generate(socialLinks.length, (i) {
            return InkWell(
              onTap: () => launchURL(socialLinks[i]["url"]),
              borderRadius: BorderRadius.circular(12),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: socialLinks[i]["color"], width: 1.5),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: socialLinks[i]["color"],
                        child: Icon(
                          socialLinks[i]["icon"],
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        socialLinks[i]["label"],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
