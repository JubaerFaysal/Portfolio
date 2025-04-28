import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_web/component/my_lists.dart';
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
          height: 50,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 65, 65, 252), Color.fromARGB(255, 0, 195, 255)]),
              borderRadius: BorderRadius.circular(100)),
          child: constraints.maxWidth >= 667
              ? Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        html.window.open(
                            'lib/images/Jubaer Resume FINAL.pdf', '_blank');
                      },
                      child: Text("Download CV",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            height: 1.5,
                          )),
                    ),
                    const Spacer(),
                    for (int i = 0; i < buttons.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextButton(
                            onPressed: () {
                              onButtonPressed(i);
                            },
                            child: Text(buttons[i],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500))),
                      )
                  ],
                )
              : Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        html.window.open(
                            'lib/images/Jubaer Resume FINAL.pdf', '_blank');
                      },
                      child: Text("Download CV",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            height: 1.5,
                          )),
                    ),
                    const Spacer(),
                    SpeedDial(
                      icon: Icons.menu,
                      activeIcon: Icons.close,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(100)), // 👈 remove any shape
                      ),
                      direction: SpeedDialDirection.down,
                      children: [
                        SpeedDialChild(
                          child: const Icon(Icons.home),
                          label: 'Home',
                          onTap: () {
                            onButtonPressed(0);
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.handyman_outlined),
                          label: 'Skills',
                          onTap: () {
                            onButtonPressed(2);
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.room_service_rounded),
                          label: 'Services',
                          onTap: () {
                            onButtonPressed(2);
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.apps),
                          label: 'Projects',
                          onTap: () {
                            onButtonPressed(3);
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.contact_emergency),
                          label: 'Contact',
                          onTap: () {
                            onButtonPressed(4);
                          },
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
