class Task {
  // int id;
  String text;
  bool status = false;

  Task({required this.text, this.status: false});

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'text': text,
      'status': status ? 1 : 0,
    };
  }
}
