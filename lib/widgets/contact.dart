import 'package:flutter/material.dart';
import 'package:flutter_web/component/my_lists.dart';
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
    return  Column(
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
                child: Text("Find me on-",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  for (int i = 0; i < socialLinks.length; i++)
                  InkWell(
                    onTap: () => launchURL(socialLinks[i]["url"]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: socialLinks[i]["color"],
                          child: Icon(socialLinks[i]["icon"], color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(socialLinks[i]["label"],
                            style: GoogleFonts.poppins(
                               color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
  }
}