
import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart' show SKILLS_DATA, Skill;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Group skills by category
    final Map<String, List<Skill>> skillsByCategory = {};
    for (var skill in SKILLS_DATA) {
      final category = skill.category;
      if (!skillsByCategory.containsKey(category)) {
        skillsByCategory[category] = [];
      }
      skillsByCategory[category]!.add(skill);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Skills",
            style: theme.textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "A showcase of my technical abilities and proficiency.",
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(builder: (context, constraints) {
            int crossAxisCount;
            if (constraints.maxWidth < 600) {
              // Small screens
              crossAxisCount = 1;
            } else if (constraints.maxWidth < 1000) {
              // Medium screens
              crossAxisCount = 2;
            } else {
              // Large screens
              crossAxisCount = 3;
            }

            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: crossAxisCount == 1
                  ? 2.5
                  : (crossAxisCount == 2 ? 1.8 : 2.0), // Adjust aspect ratio
              children: skillsByCategory.entries.map((entry) {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.checkCircle,
                                color: colorScheme.primary, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              entry.key,
                              style: theme.textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          // To ensure listview takes available space
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // important if inside GridView
                            itemCount: entry.value.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final skill = entry.value[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ...[
                                          Icon(skill.icon,
                                              size: 18,
                                              color: theme.colorScheme
                                                  .onSurfaceVariant),
                                          const SizedBox(width: 6),
                                        ],
                                          Text(skill.name,
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ],
                                      ),
                                      Text("${skill.proficiency}%",
                                          style: theme.textTheme.bodySmall),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  LinearProgressIndicator(
                                    value: skill.proficiency / 100,
                                    backgroundColor: colorScheme.surfaceVariant,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        colorScheme.primary),
                                    minHeight: 6,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
