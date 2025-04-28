import 'package:flutter/material.dart';
import 'package:flutter_web/component/my_lists.dart';
import 'package:google_fonts/google_fonts.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Text("What Can I Do-",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                children: [
                  for (int i = 0; i < services.length; i++)
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 240,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color.fromARGB(255, 159, 159, 255), width: 1.5)),
                      child: ListTile(
                        leading: Image.asset(services[i]["img"]!),
                        title: Text(services[i]["title"]!,
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500)),
                        subtitle: Text(services[i]["desc"]!,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 205, 201, 201),
                                fontWeight: FontWeight.w300)),
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 10,runSpacing: 10,
                children: [
                  for (int i = 0; i < skills.length; i++)
                    Chip(
                      
                      padding:
                         const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      backgroundColor: const Color.fromARGB(255, 65, 65, 252),
                      label: Text(skills[i]["desc"]!,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w500)),
                      avatar: Image.asset(
                        skills[i]["img"]!,
                      ),
                    )
                ],
              )
            ],
          );
  }
}