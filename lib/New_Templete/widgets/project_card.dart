import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

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
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 3,
      clipBehavior:
          Clip.antiAlias, // Ensures the image corners are rounded with the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180, // Fixed height for the image
            width: double.infinity,
            child: Image.network(
              project.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported,
                      size: 50, color: Colors.grey)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        project.description,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 4.0,
                        children: project.techStack.map((tech) {
                          return Chip(
                            label: Text(tech,
                                style: theme.textTheme.labelSmall?.copyWith(
                                    color: colorScheme.onSecondaryContainer)),
                            backgroundColor:
                                colorScheme.secondaryContainer.withOpacity(0.7),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 2.0),
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Spacer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (project.liveUrl != null && project.liveUrl != '#')
                        TextButton.icon(
                          icon: Icon(FontAwesomeIcons.externalLink,
                              size: 16, color: colorScheme.primary),
                          label: Text("Live Demo",
                              style: theme.textTheme.labelMedium
                                  ?.copyWith(color: colorScheme.primary)),
                          onPressed: () => _launchURL(project.liveUrl!),
                        ),
                      TextButton.icon(
                        icon: Icon(FontAwesomeIcons.github,
                            size: 16, color: colorScheme.primary),
                        label: Text("Source",
                            style: theme.textTheme.labelMedium
                                ?.copyWith(color: colorScheme.primary)),
                        onPressed: () => _launchURL(project.repoUrl),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
