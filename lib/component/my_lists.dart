
  import 'package:flutter/material.dart';

final List<String> buttons = ["Home", "Skills", "Services", "Projects", "Contact"];

   final List<Map<String, String>> services = [
    {
      "img":"lib/images/apple.png",
      "title": "iOS Dev",
      "desc": "Crafting seamless experiences for Apple users."
    },
    {
      "img":"lib/images/android.png",
      "title": "Android Dev",
      "desc": "Powering billions with flexible, scalable apps."
    },
    {
      "img":"lib/images/app-development.png",
      "title": "Web Dev",
      "desc": "Bringing ideas to life across browsers."
    },
    {
      "img":"lib/images/computer.png",
      "title": "Desktop Dev",
      "desc": "Easy Desktop use with unique feature."
    },
  ];

  final List<Map<String,String>>skills=[
   { "img": "lib/images/icons8-flutter-512.png",
    "desc":"Flutter"
   },
   { "img": "lib/images/icons8-dart-512.png",
    "desc": "Dart"
   },
   { "img": "lib/images/c-.png",
    "desc":"C++"
   },
   { "img": "lib/images/java.png",
    "desc":"Java"
   },
   { "img": "lib/images/database.png",
    "desc":"SQL"
   },
   { "img": "lib/images/icons8-firebase-512.png",
    "desc":"Firebase"
   },
   { "img": "lib/images/github.png",
    "desc":"GitHub"
   },
  ];

  final List<Map<String, String>> projects = [
  {
    'title': 'Tailor Shop',
    'description': 'Built an iOS app for Clothing Store management.',
    'image': 'lib/images/tailor.png',
    'Link': 'https://github.com/JubaerFaysal/Clothing-Store'
  },
  {
    'title': 'Personal Portfolio',
    'description': 'Developed a web application using Flutter and Firebase',
    'image': 'lib/images/1.png',
  },
  {
    'title': 'Mudi-Bajar',
    'description': 'Created an e-commerce mobile app using Flutter.',
    'image': 'lib/images/basket.png',
    'Link': 'https://github.com/JubaerFaysal/Mudi-Bajar'
  },
];
final List<String> imagePaths = [
  'lib/images/1.png',
  'lib/images/3.png',
  'lib/images/4.png',
  'lib/images/5.png',
  'lib/images/6.png',
  'lib/images/7.png',
  'lib/images/8.png',
  'lib/images/9.png',
  'lib/images/10.png',
  'lib/images/11.png',
  'lib/images/2.png',
];
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
