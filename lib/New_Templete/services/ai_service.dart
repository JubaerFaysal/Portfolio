class PersonalizeIntroInput {
  final String visitorRole;
  final String aboutMe;
  final String skills;

  PersonalizeIntroInput({
    required this.visitorRole,
    required this.aboutMe,
    required this.skills,
  });
}

class PersonalizeIntroOutput {
  final String personalizedIntro;

  PersonalizeIntroOutput({required this.personalizedIntro});
}

class AIService {
  // Simulates the AI call to personalize the introduction.
  // In a real app, this would make an HTTP request to a backend running Genkit or similar.
  Future<PersonalizeIntroOutput> personalizeIntro(
      PersonalizeIntroInput input) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    String introText;
    switch (input.visitorRole.toLowerCase()) {
      case 'recruiter':
        introText =
            "As a results-oriented Software Engineer, I leverage skills in ${input.skills.split(',').take(2).join(', ')} and beyond to build impactful solutions. I'm seeking opportunities where I can contribute to innovative projects.";
        break;
      case 'potential collaborator':
        introText =
            "Hi there! I'm a Software Engineer passionate about ${input.skills.split(',').first.toLowerCase()} and collaborative development. I'm always open to discussing new ideas and potential projects.";
        break;
      case 'general browser':
      default:
        introText =
            "Welcome! I'm a Software Engineer driven by a passion for creating elegant and efficient applications. Explore my work and let's connect if you find something interesting.";
        break;
    }

    // Add a bit of the original aboutMe to make it slightly more dynamic
    introText =
        "${input.aboutMe.substring(0, (input.aboutMe.length * 0.2).clamp(10, 50).toInt())}... $introText";

    return PersonalizeIntroOutput(personalizedIntro: introText);
  }
}
