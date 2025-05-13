import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart';
import 'package:flutter_web/New_Templete/widgets/app_footer.dart';
import 'package:flutter_web/New_Templete/widgets/app_header.dart';
import 'package:flutter_web/New_Templete/widgets/contact.dart';
import 'package:flutter_web/New_Templete/widgets/introduction.dart';
import 'package:flutter_web/New_Templete/widgets/project.dart';
import 'package:flutter_web/New_Templete/widgets/skill.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    for (var item in NAV_LINKS) item.href: GlobalKey()
  };

  void _scrollToSection(String key) {
    final sectionKey = _sectionKeys[key];
    if (sectionKey?.currentContext != null) {
      Scrollable.ensureVisible(
        sectionKey!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onNavigate: _scrollToSection,
        scrollController:
            _scrollController, // Pass controller for active state logic
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800; // Example breakpoint
          double horizontalPadding = isDesktop
              ? constraints.maxWidth * 0.1
              : 16.0; // Responsive padding

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: IntroductionSection(key: _sectionKeys['home']),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ProjectsSection(key: _sectionKeys['projects']),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: SkillsSection(key: _sectionKeys['skills']),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ContactSection(key: _sectionKeys['contact']),
                ),
                const AppFooter(),
              ],
            ),
          );
        },
      ),
    );
  }
}
