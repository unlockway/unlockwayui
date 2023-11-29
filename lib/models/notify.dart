class NotifyModel {
  const NotifyModel({
    required this.title,
    required this.description,
    required this.read,
  });

  final String title;
  final bool read;
  final String description;

  factory NotifyModel.fromMap(Map<String, dynamic> map) {
    return NotifyModel(
      title: map['title'],
      description: map['description'],
      read: map['read'],
    );
  }
}
