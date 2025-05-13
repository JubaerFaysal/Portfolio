class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  // final String imageHint; // Not directly used
  final List<String> techStack;
  final String? liveUrl;
  final String? repoUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    // required this.imageHint,
    required this.techStack,
    this.liveUrl,
    this.repoUrl,
  });
}
