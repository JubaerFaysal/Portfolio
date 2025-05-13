import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/app_data.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      // Log error or show a snackbar
      print('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentYear = DateTime.now().year;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor)),
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "© $currentYear ${ABOUT_ME_DATA.fullName}. All rights reserved.",
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: SOCIAL_LINKS_DATA.map((link) {
                return IconButton(
                  icon: Icon(Icons.link, color: theme.colorScheme.primary),
                  tooltip: link.name,
                  onPressed: () => _launchURL(link.url),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
