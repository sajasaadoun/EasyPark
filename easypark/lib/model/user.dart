class User {
  final String imagePath;
  final String name;
  final String email;
  final String password;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.password,
    required this.about,
    required this.isDarkMode,
  });
}
