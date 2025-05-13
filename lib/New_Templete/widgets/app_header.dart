import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onNavigate;
  final ScrollController scrollController;

  const AppHeader(
      {super.key, required this.onNavigate, required this.scrollController});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHeaderState extends State<AppHeader> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController.offset > 50 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (widget.scrollController.offset <= 50 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      backgroundColor: _isScrolled
          ? theme.scaffoldBackgroundColor.withOpacity(0.95)
          : Colors.transparent,
      elevation: _isScrolled ? 4.0 : 0.0,
      title: InkWell(
        onTap: () => widget.onNavigate('home'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FontAwesomeIcons.briefcase, color: colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              "${ABOUT_ME_DATA.fullName.split(' ')[0]}Folio",
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions:
          MediaQuery.of(context).size.width > 768 // Simple responsive check
              ? NAV_LINKS.map((link) {
                  // bool isActive = _activeSection == link.href;
                  return TextButton(
                    onPressed: () => widget.onNavigate(link.href),
                    child: Text(
                      link.label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme
                            .onBackground, // isActive ? colorScheme.primary : colorScheme.onBackground,
                        // fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  );
                }).toList()
              : [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
    );
  }
}

// TODO: Add EndDrawer for mobile navigation if Scaffold.of(context).openEndDrawer() is used.
// Or implement a custom Sheet for mobile menu similar to the Next.js version.
