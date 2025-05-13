// ignore_for_file: non_constant_identifier_names

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/widgets.dart';

// ignore_for_file: constant_identifier_names

// ---------------------------
// DATA MODELS
// ---------------------------

class AboutMeData {
  final String fullName;
  final String title;
  final String aboutMeText;
  final String skillsSummaryForAI;
  final String avatarUrl;

  AboutMeData({
    required this.fullName,
    required this.title,
    required this.aboutMeText,
    required this.skillsSummaryForAI,
    required this.avatarUrl,
  });
}

class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? liveUrl;
  final String repoUrl;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.liveUrl,
    required this.repoUrl,
  });
}

class Skill {
  final String id;
  final String name;
  final int proficiency;
  final String category;
  final IconData icon;

  Skill({
    required this.id,
    required this.name,
    required this.proficiency,
    required this.category,
    required this.icon,
  });
}

class SocialLink {
  final String id;
  final String name;
  final String url;
  final IconData icon;

  SocialLink({
    required this.id,
    required this.name,
    required this.url,
    required this.icon,
  });
}

class NavLink {
  final String href;
  final String label;

  const NavLink({
    required this.href,
    required this.label,
  });
}

// ---------------------------
// DATA DEFINITIONS
// ---------------------------

AboutMeData ABOUT_ME_DATA = AboutMeData(
  fullName: "Jubaer Faysal",
  title: "Software Engineer & Flutter Developer",
  aboutMeText:
      "I am a passionate software engineer with expertise in full-stack development and a special focus on creating beautiful and performant mobile applications using Flutter. I thrive on solving complex problems and continuously learning new technologies.",
  skillsSummaryForAI:
      "Flutter, Dart, Next.js, React, Node.js, TypeScript, JavaScript, Firebase, SQL, NoSQL, REST APIs, UI/UX Design Principles, Agile Methodologies, Cloud Platforms (GCP/AWS).",
  avatarUrl: "lib/images/IMG_5174 copy.png",
);

List<Project> PROJECTS_DATA = [
  Project(
    id: 'project-1',
    title: 'E-commerce App (Flutter)',
    description:
        'A full-fledged mobile e-commerce application built with Flutter, featuring user authentication, product catalog, shopping cart, and payment integration.',
    imageUrl: 'https://picsum.photos/seed/ecomapp/600/400',
    techStack: ['Flutter', 'Dart', 'Firebase', 'Stripe SDK'],
    liveUrl: '#',
    repoUrl: 'https://github.com/johndoe/ecommerce-app',
  ),
  Project(
    id: 'project-2',
    title: 'Portfolio Website (Flutter)',
    description:
        'This very portfolio website, built using Flutter. Features AI-powered personalized introductions (simulated).',
    imageUrl: 'https://picsum.photos/seed/portfolio/600/400',
    techStack: ['Flutter', 'Dart', 'HTTP'],
    liveUrl: null,
    repoUrl: 'https://github.com/johndoe/portfolio-flutter',
  ),
  Project(
    id: 'project-3',
    title: 'Task Management API (Node.js)',
    description:
        'A RESTful API for managing tasks, built with Node.js, Express, and MongoDB. Includes JWT authentication and comprehensive testing.',
    imageUrl: 'https://picsum.photos/seed/taskapi/600/400',
    techStack: ['Node.js', 'Express', 'MongoDB', 'JWT',],
    liveUrl: null,
    repoUrl: 'https://github.com/johndoe/task-api',
  ),
];

List<Skill> SKILLS_DATA = [
  Skill(
      id: 'flutter',
      name: 'Flutter',
      proficiency: 90,
      category: 'Mobile & Frontend',
      icon: FontAwesomeIcons.mobileScreen),
  Skill(
      id: 'dart',
      name: 'Dart',
      proficiency: 85,
      category: 'Programming Languages',
      icon: FontAwesomeIcons.code),
  Skill(
      id: 'react',
      name: 'React / Next.js (Conceptual)',
      proficiency: 80,
      category: 'Web Frontend',
      icon: FontAwesomeIcons.react),
  Skill(
      id: 'typescript',
      name: 'TypeScript (Conceptual)',
      proficiency: 85,
      category: 'Programming Languages',
      icon: FontAwesomeIcons.code),
  Skill(
      id: 'javascript',
      name: 'JavaScript (Conceptual)',
      proficiency: 90,
      category: 'Programming Languages',
      icon: FontAwesomeIcons.js),
  Skill(
      id: 'nodejs',
      name: 'Node.js / Express (Backend)',
      proficiency: 75,
      category: 'Backend',
      icon: FontAwesomeIcons.nodeJs),
  Skill(
      id: 'firebase',
      name: 'Firebase',
      proficiency: 70,
      category: 'Backend & Database',
      icon: FontAwesomeIcons.database),
  Skill(
      id: 'sql',
      name: 'SQL (PostgreSQL, MySQL)',
      proficiency: 70,
      category: 'Database',
      icon: FontAwesomeIcons.database),
  Skill(
      id: 'git',
      name: 'Git & GitHub',
      proficiency: 95,
      category: 'Tools & DevOps',
      icon: FontAwesomeIcons.gitAlt),
  Skill(
      id: 'cloud',
      name: 'Cloud (GCP, AWS basics)',
      proficiency: 60,
      category: 'Tools & DevOps',
      icon: FontAwesomeIcons.cloud),
];

List<SocialLink> SOCIAL_LINKS_DATA = [
  SocialLink(
      id: 'linkedin',
      name: 'LinkedIn',
      url: 'https://linkedin.com/in/johndoe-dev',
      icon: FontAwesomeIcons.linkedin),
  SocialLink(
      id: 'github',
      name: 'GitHub',
      url: 'https://github.com/johndoe',
      icon: FontAwesomeIcons.github),
  SocialLink(
      id: 'email',
      name: 'Email',
      url: 'mailto:jubaerfaysal@gmail.com',
      icon: FontAwesomeIcons.envelope),
];

const List<NavLink> NAV_LINKS = [
  NavLink(href: 'home', label: 'Home'),
  NavLink(href: 'projects', label: 'Projects'),
  NavLink(href: 'skills', label: 'Skills'),
  NavLink(href: 'contact', label: 'Contact'),
];
