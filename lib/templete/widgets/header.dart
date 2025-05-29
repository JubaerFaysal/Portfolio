import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_web/templete/component/my_lists.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Header extends StatelessWidget {
  final Function(int) onButtonPressed;
  const Header({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.02),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ],
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: constraints.maxWidth >= 667
              ? Row(
                  children: [
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        html.window.open('lib/templete/images/Jubaer Resume FINAL.pdf', '_blank');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF64FFDA),
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: const Text("Download CV"),
                    ),
                    const Spacer(),
                    for (int i = 0; i < buttons.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextButton(
                          onPressed: () => onButtonPressed(i),
                          child: Text(
                            buttons[i],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                  ],
                )
              : Row(
                  children: [
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        html.window.open('lib/templete/images/Jubaer Resume FINAL.pdf', '_blank');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF64FFDA),
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: const Text("Download CV"),
                    ),
                    const Spacer(),
                    SpeedDial(
                      icon: Icons.menu,
                      activeIcon: Icons.close,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      direction: SpeedDialDirection.down,
                      children: [
                        SpeedDialChild(
                          child: const Icon(Icons.home, color: Color(0xFF64FFDA)),
                          label: 'Home',
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          backgroundColor: const Color(0xFF1E1E2F),
                          onTap: () => onButtonPressed(0),
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.handyman_outlined, color: Color(0xFF64FFDA)),
                          label: 'Skills',
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          backgroundColor: const Color(0xFF1E1E2F),
                          onTap: () => onButtonPressed(2),
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.room_service_rounded, color: Color(0xFF64FFDA)),
                          label: 'Services',
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          backgroundColor: const Color(0xFF1E1E2F),
                          onTap: () => onButtonPressed(2),
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.apps, color: Color(0xFF64FFDA)),
                          label: 'Projects',
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          backgroundColor: const Color(0xFF1E1E2F),
                          onTap: () => onButtonPressed(3),
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.contact_emergency, color: Color(0xFF64FFDA)),
                          label: 'Contact',
                          labelStyle: GoogleFonts.poppins(color: Colors.black),
                          backgroundColor: const Color(0xFF1E1E2F),
                          onTap: () => onButtonPressed(4),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
