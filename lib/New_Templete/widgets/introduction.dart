import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart';
import 'package:flutter_web/New_Templete/services/ai_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroductionSection extends StatefulWidget {
  const IntroductionSection({super.key});

  @override
  State<IntroductionSection> createState() => _IntroductionSectionState();
}

class _VisitorRoleOption {
  final String value;
  final String label;
  final IconData icon;

  _VisitorRoleOption(
      {required this.value, required this.label, required this.icon});
}

class _IntroductionSectionState extends State<IntroductionSection> {
  final AIService _aiService = AIService();
  String _personalizedText = "Loading personalized introduction...";
  bool _isLoading = true;

  final List<_VisitorRoleOption> _visitorRoles = [
    _VisitorRoleOption(
        value: 'recruiter',
        label: 'Recruiter',
        icon: FontAwesomeIcons.briefcase),
    _VisitorRoleOption(
        value: 'potential collaborator',
        label: 'Collaborator',
        icon: FontAwesomeIcons.users),
    _VisitorRoleOption(
        value: 'general browser',
        label: 'General Visitor',
        icon: FontAwesomeIcons.userCheck),
  ];
  late _VisitorRoleOption _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = _visitorRoles.first;
    _fetchPersonalizedIntro();
  }

  Future<void> _fetchPersonalizedIntro() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final input = PersonalizeIntroInput(
        visitorRole: _selectedRole.value,
        aboutMe: ABOUT_ME_DATA.aboutMeText,
        skills: ABOUT_ME_DATA.skillsSummaryForAI,
      );
      final result = await _aiService.personalizeIntro(input);
      setState(() {
        _personalizedText = result.personalizedIntro;
      });
    } catch (e) {
      setState(() {
        _personalizedText =
            "Welcome to my portfolio! I'm a passionate software engineer ready to tackle new challenges.";
      });
      // Log error e
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onRoleChanged(_VisitorRoleOption? newRole) {
    if (newRole != null) {
      setState(() {
        _selectedRole = newRole;
      });
      _fetchPersonalizedIntro();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm ",
          style:
              isSmallScreen ? textTheme.headlineMedium : textTheme.displaySmall,
        ),
        Text(
          ABOUT_ME_DATA.fullName,
          style: (isSmallScreen
                  ? textTheme.headlineMedium
                  : textTheme.displaySmall)
              ?.copyWith(
                  color: colorScheme.primary, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          ABOUT_ME_DATA.title,
          style: isSmallScreen
              ? textTheme.titleLarge
              : textTheme.headlineSmall
                  ?.copyWith(color: theme.colorScheme.secondary),
        ),
        const SizedBox(height: 24),
        Card(
          elevation: 1,
          color: colorScheme.surface.withOpacity(0.5), // semi-transparent card
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Tailor my intro for you:",
                        style: textTheme.bodySmall),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButton<_VisitorRoleOption>(
                        value: _selectedRole,
                        isExpanded: true,
                        underline:
                            Container(height: 1, color: colorScheme.primary),
                        onChanged: _onRoleChanged,
                        items: _visitorRoles.map((role) {
                          return DropdownMenuItem<_VisitorRoleOption>(
                            value: role,
                            child: Row(
                              children: [
                                Icon(role.icon,
                                    size: 18,
                                    color: textTheme.bodyMedium?.color),
                                const SizedBox(width: 8),
                                Text(role.label, style: textTheme.bodyMedium),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _isLoading
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          const SizedBox(width: 8),
                          Text("Personalizing intro...",
                              style: textTheme.bodyLarge),
                        ],
                      )
                    : Text(
                        _personalizedText,
                        style: textTheme.bodyLarge?.copyWith(height: 1.5),
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {/* TODO: Implement scroll to projects */},
              child: const Text("View My Work"),
            ),
            OutlinedButton(
              onPressed: () {/* TODO: Implement scroll to contact */},
              child: const Text("Get In Touch"),
            ),
          ],
        ),
      ],
    );

    Widget avatar = Center(
      child: Container(
        width: isSmallScreen ? 250 : 350,
        height: isSmallScreen ? 250 : 350,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0), // Creates the border effect
          child: ClipOval(
            child: Image.asset(
              ABOUT_ME_DATA.avatarUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 100),
            ),
          ),

        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: isSmallScreen
          ? Column(children: [avatar, const SizedBox(height: 32), content])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 3, child: content),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: avatar),
              ],
            ),
    );
  }
}
