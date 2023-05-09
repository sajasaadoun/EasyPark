class Question {
  final String id;
  final String title;
  final Map<String, int> options;

  // create a constructor
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
