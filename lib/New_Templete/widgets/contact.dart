
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_web/New_Templete/config/app_data.dart';
import 'package:flutter_web/New_Templete/config/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:string_validator/string_validator.dart' as validator;

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $urlString')),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Simulate success/failure
      // final bool success = Random().nextBool();
      const bool success = true; // Forcing success for now

      setState(() {
        _isSending = false;
      });

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Message sent successfully! I'll get back to you soon."),
              backgroundColor: Colors.green),
        );
        _formKey.currentState!.reset();
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } 
    // else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //           content: Text("Failed to send message. Please try again."),
    //           backgroundColor: Colors.red),
    //     );
    //   }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    Widget contactFormCard = Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Send me a message", style: theme.textTheme.titleLarge),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "Full Name", hintText: "Jubaer Faysal"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  if (value.length < 2) {
                    return "Name must be at least 2 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "Email Address", hintText: "you@example.com"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!validator.isEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                    labelText: "Your Message",
                    hintText: "Tell me about your project or inquiry..."),
                maxLines: 4,
                minLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your message";
                  }
                  if (value.length < 10) {
                    return "Message must be at least 10 characters";
                  }
                  if (value.length > 500) {
                    return "Message must not exceed 500 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: _isSending
                      ? Container(
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.only(right: 8),
                          child: const CircularProgressIndicator(
                              strokeWidth: 2, color: AppColors.darkNavyBlue))
                      : const Icon(FontAwesomeIcons.gofore,
                          size: 18, color: AppColors.darkNavyBlue),
                  label: Text(_isSending ? "Sending..." : "Send Message",
                      style: const TextStyle(color: AppColors.darkNavyBlue)),
                  onPressed: _isSending ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget contactInfoCard = Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Information", style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),
            Text(
              "You can also reach me through the following channels:",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            ...SOCIAL_LINKS_DATA.map((link) => ListTile(
                  leading: Icon(link.icon, color: colorScheme.primary),
                  title: Text(link.name, style: theme.textTheme.bodyLarge),
                  onTap: () => _launchURL(link.url),
                  contentPadding: EdgeInsets.zero,
                )),
          ],
        ),
      ),
    );

    Widget decorativeImage = Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/seed/contactmap/800/400"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        // Gradient overlay
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Let's build something great together.",
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

    return Container(
      color: theme.cardTheme.color?.withOpacity(0.5) ??
          theme.colorScheme.surface.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get In Touch",
            style: theme.textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Have a project in mind, a question, or just want to say hi? Feel free to reach out.",
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Ensure some padding for the content
            child: isSmallScreen
                ? Column(
                    children: [
                      contactFormCard,
                      const SizedBox(height: 24),
                      contactInfoCard,
                      const SizedBox(height: 24),
                      decorativeImage,
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: contactFormCard),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            contactInfoCard,
                            const SizedBox(height: 24),
                            decorativeImage,
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
