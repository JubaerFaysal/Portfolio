import 'package:flutter/material.dart';
import 'package:flutter_web/templete/component/my_lists.dart';
import 'package:google_fonts/google_fonts.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              )
            ],
          ),
          child: Text("What Can I Do",
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 30),

        // SERVICES GRID
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < services.length; i++)
              Container(
                width: 260,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A2E).withOpacity(0.7),
                      const Color(0xFF16213E).withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF64FFDA), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64FFDA).withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      Image.asset(services[i]["img"]!, width: 40, height: 40),
                  title: Text(services[i]["title"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(services[i]["desc"]!,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 40),

        // SKILLS CHIPS
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < skills.length; i++)
              Chip(
                elevation: 4,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                backgroundColor: const Color(0xFF0F3460),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Color(0xFF64FFDA), width: 1),
                ),
                avatar: Image.asset(skills[i]["img"]!, width: 20, height: 20),
                label: Text(skills[i]["desc"]!,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ),
          ],
        ),

        const SizedBox(height: 40),
      ],
    );
  }
}
